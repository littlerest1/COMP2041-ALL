#!/usr/bin/perl -w

die "Usage: $0 <file>\n" if @ARGV != 1;

$filename = $ARGV[0];
my $total = 0.00;
open my $f,$filename or die "Can not open $filename\n";

while ($line = <$f>){
  #  print $line;
     if($line =~ m/price/){
       my @price = split ':',$line;
       my $temp = $price[2] =~ s/,//gr;
       $temp = $temp =~ s/"//gr;
       $temp = $temp =~ s/\$//gr;
       $temp = $temp =~ s/}//gr;
       $temp = $temp =~ s/\s+//gr;
       $total += $temp;
      # print "$temp ";
     }

}

printf "\$%.2f\n",$total;
