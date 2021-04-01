#!/usr/bin/perl -w

if($#ARGV < 1){
	print "Usage: ./identical_files.pl <files>\n";
	exit 1;
}

my @comp;
foreach my $arg(@ARGV){
	open $input,$arg or die "Could not open $arg:$!";
	my $count = 0;
	foreach my $line(<$input>){
		chomp $line;
		$line =~ s/\s+//g;
		$comp[$count] = $line;
		$count ++;
	}
	close($input);
	
	foreach my $file(@ARGV){
		open $data,$file or die "Could not open $file:$!";
		my $c = 0;
		foreach my $line(<$data>){
			chomp $line;
			$line =~ s/\s+//g;
			if($line ne $comp[$c]){
				print "$file is not identical\n";
				exit 1;
			}
			$c ++;
		}
		if($c != $count){
		    print "$file is not identical\n";
			exit 1;
		}
		close($data);
	}
}
print "All files are identical\n";
