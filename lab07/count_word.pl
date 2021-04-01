#!/usr/bin/perl -w

my $word = $ARGV[0];
my $count = 0;
while (my $line=<STDIN>){
	chomp $line;
	$line = lc $line;
	$line =~ s/[^a-z]/ /g;
	$line =~ s/\s+/ /g;
	$line =~ s/^ //g;
	my @words = split / /,$line;
	foreach my $w (@words){
		if($w eq $word){
			$count ++;
		}
	}
}
print $word," occurred ",$count," times\n";
