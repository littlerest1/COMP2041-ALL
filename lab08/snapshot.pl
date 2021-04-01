#!/usr/bin/perl -w
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);

if($#ARGV  != 1 && $#ARGV != 0){
	print "Incorrect argument\n";
	exit 1;
}

my $arg = lc $ARGV[0];
if($arg eq "save"){
	#print "Save mode\n";
	copy_file();
}
elsif($arg eq "load"){
	#print "Load mode\n";
	copy_file();
	save_file();
}

sub copy_file{
	use Cwd;
	use File::Copy;
	
	my $dir = cwd;
	#print "$dir\n";
	
	my $f = 0;
	my $count = 0;
	my $directory = ".snapshot.";
	while($f == 0){
		$directory = ".snapshot.$count";
		if(-e $directory){
			$count ++;
		}
		else{
			$f = 1;
		}
	}	
    unless(mkdir($directory)) {
        die "Unable to create $directory\n";
    }
	print "Creating snapshot $count\n";
	
	foreach my $file (glob("$dir/*")){
		#print "file name before=$file\n";
		my @files = split '/',$file;
		#print "file name after=$files[$#files]\n";
		my $filename = $files[$#files];
		if($filename eq "snapshot.pl"){
			next;
		}
		
		my $name = "$directory/$filename";
		#print "\n path name =$name\n";
		copy($file,$name) or die "Copy failed: $filename $!";
		#print "Backup of '$file' saved as '$name'\n";	
	}
	return;
}

sub save_file{
	use Cwd;
	
	my $n = $ARGV[1];
	my $dir = cwd;
	if(!looks_like_number($n)){
		print "Usage:./snapshot load number(x)\n";
		exit 1;
	}

	my $directory = ".snapshot.$n";
	foreach my $file(glob("$directory/*")){
		my @files = split '/',$file;
		#print "file name after=$files[$#files]\n";
		my $overwrite = "$dir/$files[$#files]";
		copy($file,$overwrite) or die "Copy failed: $file $!";
	}
	print "Restoring snapshot $n\n";
	return;
}
