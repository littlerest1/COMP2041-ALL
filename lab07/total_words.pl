#!/usr/bin/perl -w

use strict;
use warnings;

my $count = 0;
while (my $line = <>){
	chomp $line;
	$line = lc $line;
	$line =~ s/[^a-z]/ /g;
	$line =~ s/\s+/ /g;
	$line =~ s/^ //g;
	#$line =~ s/^s//g;
	#$line =~ s/s$//g;
	my @words = split / /, $line;
    foreach my $word (@words) {
	   # print $word,"\n";
		$count++;
    }
	#print $count,"\n";
}
print $count," words\n";
