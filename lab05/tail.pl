#!/usr/bin/perl

#print("$#ARGV\n");
if($#ARGV == -1){
    my $input;
    my $count = 0;
    while (<STDIN>) {
        $input = join '',$input, $_;
        $count = $count +1;
    }
  #  print("$count\n");
    my $newcount = 0;
    for my $a (split //, $input){
        if ($newcount ge ($count - 10)){
            print "$a";
        }
        if($a eq "\n"){
            $newcount = $newcount +1;
        }
    }
}
elsif($ARGV[0]=~/^-[0-9]\d*$/){
   # print("$ARGV[0]\n");
    my $num = - $ARGV[0];
    #print("$num\n");
    
    foreach $arg (@ARGV) {
        if ($arg eq "--version") {
            print "$0: version 0.1\n";
            exit 0;
        # handle other options
        # ...
        }elsif($arg eq $ARGV[0]){
           next;
        } 
        else {
            push @files, $arg;
        }
    }
    
    foreach $file (@files) {
        open $fh, '<', "$file" or die "$0: Can't open $file: $!\n";
        if($#ARGV > 1){
            print("==> $file <==\n");
        }
        my $input;
        my $count = 0;
        while (my $line = <$fh> ) {
          #  print("$line");
            $input = join '',$input, $line;
            $count = $count +1;
        }
        
        my $newcount = 0;
        for my $a (split //, $input){
            if ($newcount >= ($count - $num)){
                print "$a";
            }
            if($a eq "\n"){
                $newcount = $newcount +1;
            }
        }
        
        close $fh;
   }
}
else{
    foreach $arg (@ARGV) {
        if ($arg eq "--version") {
            print "$0: version 0.1\n";
            exit 0;
        # handle other options
        # ...
        } else {
            push @files, $arg;
        }
    }

    foreach $file (@files) {
        open $fh, '<', "$file" or die "$0: Can't open $file: $!\n";
        if($#ARGV > 1){
            print("==> $file <==\n");
        }
        my $input;
        my $count = 0;
        while (my $line = <$fh> ) {
          #  print("$line");
            $input = join '',$input, $line;
            $count = $count +1;
        }
       # print("count=$count \n");
        
        my $newcount = 0;
        for my $a (split //, $input){
            if ($newcount >= ($count - 10)){
                print "$a";
            }
            if($a eq "\n"){
                $newcount = $newcount +1;
            }
        }
        
        close $fh;
   }
}
