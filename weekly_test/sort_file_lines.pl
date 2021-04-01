#!/usr/bin/perl -w

if($#ARGV != 0){
	print "Incorrect argument\n";
	exit 1;
}

my %table;
open my $data,$ARGV[0] or die "Could not open $ARGV[0]:$!";
foreach my $line(<$data>){
	#print "$line";
	my @length = split //,$line;
	$table{$line} = scalar @length;
}

@keys = sort {$table{$a} <=> $table{$b} or $a cmp $b} keys % 
		table;
		
foreach my $key(@keys){
	print "$key";
}
