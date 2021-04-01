#!/usr/bin/perl -w

foreach $line(<STDIN>){
	chomp $line;
	my @words = split ' ',$line;
	my @sorted = sort @words;
	foreach $word(@sorted){
		print "$word ";
	}
	print "\n";
}
