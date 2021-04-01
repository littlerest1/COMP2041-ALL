#!/usr/bin/perl -w

open my $info, $ARGV[1] or die "Could not open $ARGV[0]: $!";

my $num = 0;
my $scal;
my $pod = 0;
while( my $line = <$info>){
	@count = $line =~ / (\d+) /gm;
	
	@lines = $line =~ / (.*)$/gm;
	$scal = join(" ", @lines);
	
	$scal = $scal =~ s/\d//gr;
	$scal = $scal =~ s/^\s+//gr;
	$scal = $scal =~ s/\s+$//gr;
	if($scal eq $ARGV[0]){
		$pod = $pod + 1;
		$c = join(" ", @count);
		$num = $num + $c;
	}
}
print "$ARGV[0] observations: $pod pods, $num individuals\n";
close $info;
