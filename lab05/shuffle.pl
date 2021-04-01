#!/usr/bin/perl

#print("$#ARGV\n");
my @file;
while (<STDIN>) {
    push @file, $_;
} 
my $i = 0;
my @output;
my $a;
while ($i <= $#file){
    my $flag = 0;
    my $num = int(rand($#file + 1));
    if($#output == -1){
       push @output, $num;
       $flag = 1;
       $i = $i + 1;
    }
    else{
        foreach $a(@output){
          if($a == $num){
            $flag = 1;
          }
        }
    }
    if($flag == 0){
      push @output, $num;
      $i = $i+1;
    }
}

foreach $a (@output){
     print("$a\n");
}

