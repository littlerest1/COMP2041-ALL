#!/usr/bin/perl -w

# Stop after a line oN STDIN is seen n times, n is supplied as a command line argument
# written by andrewt@unsw.edu.au as COMP[29]041 sample solution

die "Usage: $0 <n>" if @ARGV != 1;

my $snap_after_n_repeats = $ARGV[0];
my %line_repeats;

while ($line = <STDIN>) {
    $line_repeats{$line}++;

    if ($line_repeats{$line} >= $snap_after_n_repeats) {
        print "Snap: $line";
        last;
    }
}
