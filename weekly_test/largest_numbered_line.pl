#!/usr/bin/perl -w
use Scalar::Util qw(looks_like_number);

my @lines;
my $comp="-10000";
while(my $line = <STDIN>){
	if($line =~m/\d+/){
		my $temp = lc $line;
		$temp =~s/[a-z]/ /g;
		my @act = split(' ',$temp);
		
		foreach my $elem(@act){
			#print "comp=$comp ,elem= $elem\n";
			$elem =~s/--/-/g;
			$elem =~s/-$//g;
			#print "$elem\n";
			if($elem =~ m/\d+/ && $elem == $comp){
				#print "line = $line";
				push @lines,$line;
				$comp = $elem;
			}
			elsif($elem =~ m/\d+/ && $elem > $comp){
				$lines[0] = $line;
				$comp = $elem;
			}
		}
	}
}

if(@lines){
	foreach my $elem(@lines){
		print $elem;
	}
}
