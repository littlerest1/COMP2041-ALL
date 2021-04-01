#!/usr/bin/perl -w


open my $info, $ARGV[0] or die "Could not open $ARGV[0]: $!";

my $num = 0;
my $scal;
while( my $line = <$info>){
	@count = $line =~ / (\d+) /gm;
	
	@lines = $line =~ / (.*)$/gm;
	$scal = join(" ", @lines);
	
	$scal = $scal =~ s/\d//gr;
	$scal = $scal =~ s/^\s+//gr;
	$scal = $scal =~ s/\s+$//gr;
	if($scal eq "Orca"){
		$c = join(" ", @count);
		$num = $num + $c;
	}
}
print "$num Orcas reported in $ARGV[0]\n";
close $info;
