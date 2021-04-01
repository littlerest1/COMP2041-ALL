#!/usr/bin/perl -w
use File::Copy;

foreach $file(@ARGV){
	my $num = 0;
	my $name = ".$file.";
	my $flag = 0;
	while($flag == 0){
		$name = ".$file.$num";
		if(-e $name){
			$num ++;
		}
		else{
			$flag = 1;
		}
	}
	#print "$name\n";
	copy($file,$name) or die "Copy failed: $!";
	print "Backup of '$file' saved as '$name'\n";	
}
