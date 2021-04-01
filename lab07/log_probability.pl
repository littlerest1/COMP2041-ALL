#!/usr/bin/perl -w

my $key = $ARGV[0];
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
			if($word eq $key){
				$fre ++;
			}
			$total++;
		}
	 }
	 #log($n)/log(10);
	 my $final = log(($fre+1)/$total);
	# printf("%.9f ", $final);
	 printf("log((%d+1)/%6d) = %8.4f %s\n",$fre,$total,$final,$name);
	 close $file;
}
