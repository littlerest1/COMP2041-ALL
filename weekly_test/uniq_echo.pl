#!/usr/bin/perl -w

my @words;
foreach my $input(@ARGV){
	my $flag = 0;
	foreach my $a(@words){
		if($input eq $a){
			$flag = 1;
		}
	}
	if($flag == 0){
		my @word = $input;
		push @words,@word;
	}
}

foreach my $a(@words){
	print "$a ";
}
print "\n";
