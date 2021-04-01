#!/usr/bin/perl -w

use strict;
use warnings;
	
open my $info, $ARGV[0] or die "Could not open file $ARGV[0]: $!";

my @sorted;
my @lines;
my @array;
my $scal;
while( my $line = <$info>){	
	$line = lc $line;
	@lines = $line =~ / (.*)$/gm;
	$scal = join(",", @lines);
	
	$scal = $scal =~ s/\d//gr;
	$scal = $scal =~ s/^\s+//gr;
	$scal = $scal =~ s/\s+$//gr;
	$scal = $scal =~ s/\s+/ /gr;
	#print"$scal\n";
	@array = split(',' , $scal);
	push @sorted,@array;
}
close $info;
@sorted = sort @sorted;

my $prev = $sorted[0];
#print "prev = $prev\n";
my @order;

my $num = 0;
my $scals;
my $pod = 0;
my @count;
my @newlines;
my $c;

open my $data, $ARGV[0] or die "Could not open file $ARGV[0]: $!";
while( my $line = <$data>){
	$line = lc $line;
	@count = $line =~ / (\d+) /gm;
	
	@newlines = $line =~ / (.*)$/gm;
	$scals = join(",", @newlines);
	
	$scals = $scals =~ s/\d//gr;
	$scals = $scals =~ s/^\s+//gr;
	$scals = $scals =~ s/\s+$//gr;
	$scals = $scals =~ s/\s+/ /gr;
	#print "scal = $scal\n";
	my $addp = $prev . 's';

	if($scals eq $prev or $scals eq $addp){
		$pod = $pod + 1;
		$c = join(" ", @count);
		$num = $num + $c;
	}
}
print "$prev observations: $pod pods, $num individuals\n";
close $data;

foreach my $name (@sorted){
	my $aN = $prev.'s';
	if(($name ne $prev) && ($aN ne $name)){
		##print "name = $name";
		open my $data, $ARGV[0] or die "Could not open file $ARGV[0]: $!";
		$num = 0;
		my $s;
		$pod = 0;
		my @countN;
		my @newline;
		my $cn;
		while( my $line = <$data>){
			$line = lc $line;
			@countN = $line =~ / (\d+) /gm;
			
			@newline = $line =~ / (.*)$/gm;
			$s = join(",", @newline);
			
			$s = $s =~ s/\d//gr;
			$s = $s =~ s/^\s+//gr;
			$s = $s =~ s/\s+$//gr;
			$s = $s =~ s/\s+/ /gr;
			my $addp = $name . 's';
			if($s eq $name or $s eq $addp){
				$pod = $pod + 1;
				$cn = join(" ", @countN);
				$num = $num + $cn;
			}
		}
		print "$name observations: $pod pods, $num individuals\n";
		close $data;
		$prev = $name;
	}
}
