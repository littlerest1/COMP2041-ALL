#!/usr/bin/perl -w
use strict;
use warnings;
use autodie;

my $filename = 'script.txt';
	unless(open FILE, '>'.$filename) {
		die "\nUnable to create $filename\n";
}
close(FILE);

open my $FN,'>',"script.txt" or die "Could no open script.txt\n";
print  $FN "#!/usr/bin/perl -w\n";
if($ARGV[0] =~ m/\\/){
	$ARGV[0] = $ARGV[0] =~ s/\\/\\\\/gr;
}
$ARGV[0] = $ARGV[0] =~ s/\"/\\\"/gr;
print $FN "print \"$ARGV[0]\\n\"; ";
close ($FN);

open my $fh,'<',"script.txt" or die  "Could no open script.txt second\n";
while(my $line = <$fh>){
	print "$line";
}
close($fh);
