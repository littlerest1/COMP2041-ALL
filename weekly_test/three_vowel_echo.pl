#!/usr/bin/perl -w

foreach my $args(@ARGV){
	my $output = "";
	if($args =~ m/a[aeiou][aeiou]/i){
		$output = $args;
	}
	elsif($args =~ m/e[eioua][eioua]/i){
		$output = $args;
	}
	elsif($args =~ m/i[iouae][iouae]/i){
		$output = $args;
	}
	elsif($args =~ m/o[ouaei][ouaei]/i){
		$output = $args;
	}
	elsif($args =~ m/u[uaeio][uaeio]/i){
		$output = $args;
	}
	if($output ne ""){
		print "$output ";
	}
}
print "\n";
