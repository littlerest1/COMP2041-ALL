#!/usr/bin/perl -w

if($#ARGV != 1){
	print "Incorrect input\n";
	exit 1;
}

open  $data,$ARGV[1] or die "Could not open $ARGV[1]:$!";

my $num = 1;
while(my $line=<$data>){
	if($num == $ARGV[0]){
		print "$line";
	}
	$num ++;
}
