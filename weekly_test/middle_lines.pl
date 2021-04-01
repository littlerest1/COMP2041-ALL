#!/usr/bin/perl -w

if($#ARGV != 0){
	print "Usage:./middle_lines.pl <filename>\n";
	exit 1;
}
if($ARGV[0] =~m/.txt/){
	open F,$ARGV[0] or die "Could not open $ARGV[0]\n";
    my @lines = <F>;
    close F;
    my $var = @lines%2;
    print "nums of lines $#lines,$var\n";
}


