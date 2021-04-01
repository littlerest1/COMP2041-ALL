#!/usr/bin/perl -w

if($#ARGV != 2){
	print "Incorrect argument\n";
	exit 1;
}

my $c=$ARGV[0];
open(FH, '>', $ARGV[2]) or die $!;
while($c <= $ARGV[1]){
	print FH "$c\n";
	$c ++;
}
close(FH);

