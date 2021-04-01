#!/usr/bin/perl

use Encode;
use JSON::XS;
use Data::Dumper;

my @array;
open  F, '<',$ARGV[1] or die "Could not open $ARGV[1]";
while (my $line=<F>){
   if($line =~ m/species/){
       my @name = split(':',$line);
       my $whale = $name[1] =~ s/"//gr;
       $whale = $whale =~ s/^\s+//gr;
       $whale = $whale =~ s/\s+$//gr;
       #print $whale;
       push @array,$whale;
    }

}
close F;
#print "\n";
my $count = 0;
my $sum = 0;
open  F, '<',$ARGV[1] or die "Could not open $ARGV[1]";
while (my $line=<F>){
   if($line =~ m/how_many/){
       my @name = split(':',$line);
       my $num = $name[1] =~ s/"//gr;
       $num = $num =~ s/,//gr;
       $num = $num =~ s/^\s+//gr;
       $num = $num =~ s/\s+$//gr;
      # print $num;
       if($array[$count] eq $ARGV[0]){
            $sum += $num
       }
     #  print "$array[$count] \n";
       $count ++;
    }

}
close F;

print "$sum\n";
