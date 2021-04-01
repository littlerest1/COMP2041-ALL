#!/usr/bin/perl

use warnings;
use strict;
use Scalar::Util qw(looks_like_number);

my $index;

if($#ARGV != 1){
    print "Usage: ./echon.pl <number of lines> <string>\n";
    exit 1;
}

if(looks_like_number($ARGV[0]) && $ARGV[0] ge "0"){
    $index = "0";
    while($index ne $ARGV[0]){
        print("$ARGV[1]\n");
        $index =$index + "1";
    }
}
else{
    print("./echon.pl: argument 1 must be a non-negative integer\n")
}
