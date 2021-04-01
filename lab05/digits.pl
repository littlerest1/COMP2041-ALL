#!/usr/bin/perl
use strict;

my $input;

while (<STDIN>) {
 #   chomp;
    $input = join '',$input, $_;
}



for my $a (split //, $input){
    if ("$a" ge "0" && "$a" lt "5"){
        print "<";
    }
    elsif("$a" gt "5" && "$a" le "9"){
        print ">";
    }
    else{
        print "$a";
    }
}
