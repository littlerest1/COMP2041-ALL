#!/usr/bin/perl -w

my @array;
my $count = 0;
foreach my $num(@ARGV){
	push @array,$num;
	$count = $count + 1;
}
@array = sort { $a <=> $b } @array;
#print "$count\n";
$count = $count -1;
$count = $count /2;
#foreach $n(@array){
#	print "$n\n";
#}
#print "$count\n";
#print "$array[$count]\n";
print "$array[$count]\n";
