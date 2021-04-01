#!/usr/bin/perl -w

if($#ARGV != 0){
	print"Incorrect argument\n";
	exit 1;
}

open $input,$ARGV[0] or die "Could not open $ARGV[0]:$!";

my @output;
my $count = 0;
foreach $line(<$input>){
	$line =~ s/\d/#/g;
	$output[$count] = $line;
	$count ++;
}
close($input);

my $i = 0;

open(FH,'>',$ARGV[0]) or die "Could not open $ARGV[0]:$!";

while($i < $count){
	print FH "$output[$i]";
	$i ++;
}

close(FH);
