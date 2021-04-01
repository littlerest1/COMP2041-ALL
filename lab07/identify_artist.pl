#!/usr/bin/perl -w

my %table;
foreach $file (glob "lyrics/*.txt") {
	 open my $info,$file or die "Could not open $file: $!";
	 my $name = $file;
	 $name =~ s/.txt//g;
	 $name =~ s/.*\///g;
	 $name =~ s/[^a-zA-Z]/ /g;
	# print $name,"\n";
	 my $fre = 0;
	 my $total = 0;
	 while(my $line=<$info>){
		chomp $line;
		$line = lc $line;
		$line =~ s/[^a-z]/ /g;
		$line =~ s/\s+/ /g;
		$line =~ s/^ //g;
		my @words = split / /, $line;
		foreach my $word (@words) {
			$table{$name}{0}++;
			$table{$name}{$word}++;
		}
	 }
	 close $file;
}

foreach my $input(@ARGV){
	open my $data,$input or die "Could not open $input: $!";
			foreach my $name (sort keys %table) {
			$table{$name}{1} = 0;
		}
	while(my $line=<$data>){
		chomp $line;
		$line = lc $line;
		$line =~ s/[^a-z]/ /g;
		$line =~ s/\s+/ /g;
		$line =~ s/^ //g;
			#print "data= $data\n";
		my @ws = split / /, $line;
		foreach my $k(@ws){	
			foreach my $name (sort keys %table) {
				my $fre = $table{$name}{$k};
				$fre ++;
				my $final = log(($fre)/$table{$name}{0});
				$table{$name}{1} += $final;
			}
		}
		
	}
	my @keys = sort {$table{$b}{1} <=> $table{$a}{1}} keys % 
		table;
	#song2.txt most resembles the work of Ed Sheeran (log-probability=-206.6)
	printf("%s most resembles the work of %s (log-probability=%.1f)\n",$input,$keys[0],$table{$keys[0]}{1});
	#printf("%s : log %.1f\n",$keys[0],$table{$keys[0]}{1});
	close $input;
}

