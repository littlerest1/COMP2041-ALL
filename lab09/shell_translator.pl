#!/usr/bin/perl -w

use strict;
use warnings;
local $| = 1; 
if($#ARGV != 0){
	print "Usage:./shell_translator.pl *.sh\n";
	exit 1;
}

my @var;
foreach my $file(@ARGV){
	open my $filename,$file or die "Could not open $file:$!\n";
	foreach my $line(<$filename>){
		$line=~ s/[\r\n]+$//g;
		if($line eq ""){
			print "$line\n";
			next;
		}
		$line = $line =~ s/done/\}/gr;
		$line = $line =~ s/\b(do)\b/\{/gr;
		$line = $line =~ s/\b(else)\b/\}else\{/gr;
		$line = $line =~ s/\b(fi)\b/\}/gr;
		$line = $line =~ s/then/\{/gr;
		#$line = $line =~ s/echo /print "/gr;
		
		if($line =~ m/^#!/){
			$line = "#!/usr/bin/perl -w\n";
		}
		if($line =~ m/=[0-9]/){
			my $assign = $line;
			$assign = $assign =~ s/=[0-9]*//gr;
			
			my @variable = $assign;
			push @var,@variable;		
		}
		if($line =~ m/\((.*)\)/){
			$line = $line =~ s/\(\(/\(/gr;
			$line = $line =~ s/\)\)/\)/gr;
		}
		foreach my $a (@var){
			if($line =~ m/echo/){
				next;
			}
			if($line =~ m/$a/){
				$line = $line =~ s/\b($a)\b/\$$a/gr;
				$line = $line =~ s/\$\$/\$/gr;
				if(! $line =~ m/^while/){
					$line = $line =~ s/=/ = /gr;
				}
				$line = $line =~ s/^\$/my \$/gr;
				if($line =~ m/^my/){
					$line = "$line\;";
				}
			#	print "matches:$line\n";
			}
		}
		if($line =~ m/\$\(.*\)/){
			$line = $line =~ s/\$\(//gr;
			$line = $line =~ s/\)/\;/gr;
		}
		
		if($line =~ m/echo/){
			$line = $line =~ s/echo /print "/gr; 	
			$line = "$line\\n\"\;";
		}
		if($line =~ /=\$/){			
			my $newline = $line;
			$newline = $newline =~ s/^\s+//gr;
			my $assign = $newline;
			$assign = $assign =~ s/=\$.*//gr;
			my @variable = $assign;
			push @var,@variable;	
			$line = "	my \$$newline\;"
		}
		if($line =~ m/my \$\$/){
			$line = $line =~ s/my //gr;
			$line = $line =~ s/\$\$/\$/gr;
			$line = $line =~ s/\;\;/\;/gr;
		}
		print "$line\n";
		
	}
}


