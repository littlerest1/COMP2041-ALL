#!/usr/bin/perl -w
use strict;
use warnings;
use Cwd;
use File::Copy;
use File::Compare;
use Scalar::Util qw(looks_like_number);
use autodie;
use v5.10;


my $dir = getcwd;
my $dir1 = "$dir/$ARGV[0]";
my $dir2 = "$dir/$ARGV[1]";
my @final;
my $f = 0;
if (!is_folder_empty($dir1)) {
	my $x = 0;
	my $y = 0;
	my @fN;
	foreach my $file(glob("$dir1/*")){
		my @filename = split('/',$file);
		#print "$file\n";
		push @fN,$filename[$#filename];
	}
	
	@fN = sort @fN;
	#foreach my $fk(@fN){
	#print "$fk\n";
	#}
	#print "$#fN\n";
	if(!is_folder_empty($dir2)){
		my $y = 0;
		while($y <= $#fN){
		#print "in dir 1 $fN[$y]\n";
			foreach my $file(glob("$dir2/*")){
				if($y > $#fN){
					last;
				}
				my @filename = split('/',$file);
				#print "in dir2 $filename[$#filename]\n";
				if($filename[$#filename] eq $fN[$y]){
					my $k = 0;
					my $flag = 0;
					my @f1;
					open my $fh,$file or die "Could not open $file\n";
					foreach my $line(<$fh>){
						push @f1,$line;
						$k ++;
					}
					my $j = 0;
					open my $fx,"$dir1/$filename[$#filename]" or die "Could not open $filename[$#filename]\n";
					foreach my $line(<$fx>){
						if($line ne $f1[$j]){
							$flag = 1;
							last;
						} 
						#print "$line || $f1[$j]";
						$j ++;
					}
					if($j != $k){
						$flag = 1;
					}
					if($flag == 0){
						push @final,$filename[$#filename];
						$f ++;
					}
					next;
				}
			}
			$y ++;
		}
	}
}
#print "End\n";
foreach my $fk(@final){
	print "$fk\n";
}

sub is_folder_empty {
    my $dirname = shift;
    opendir(my $dh, $dirname) or die "Not a directory";
    return scalar(grep { $_ ne "." && $_ ne ".." } readdir($dh)) == 0;
}
