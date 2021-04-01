#!/usr/bin/perl -w
use strict;
use warnings;
use autodie;

my $file = 'text.txt';
	unless(open FL, '>'.$file) {
		die "\nUnable to create $file\n";
}
close(FL);


open my $Test,'>',"test.txt" or die "Could no open text.txt\n";
print $Test "#!/usr/bin/perl -w\n";
print $Test "use strict;
use warnings;
use autodie;\n\n";
print $Test "my \$args = \"$ARGV[1]\";\n";
print $Test "my \$filename = \'script.txt\'\;\n";
print $Test "	unless(open FILE, '>'.\$filename) \{ \n";
print $Test "		die \"\\nUnable to create \$filename\\n\"\; \n";
print $Test "\} \n";
print $Test "close(FILE)\; \n";
print $Test "\nopen my \$FN,'>',\"script.txt\" or die \"Could no open script.txt\\n\";\n";
print $Test "print  \$FN \"#!/usr/bin/perl -w\\n\";\n";
print $Test "if(\$args =~ m/\\\\/)\{ \n";
print $Test "	\$args = \$args =~ s/\\\\/\\\\\\\\/gr;\n";
print $Test "\}\n";
print $Test "\$args = \$args =~ s/\\\"\/\\\\\\\"\/gr;\n";
print $Test "print \$FN \"print \\\"\$args\\\\n\\\"; \";";
print $Test "\nclose (\$FN);\n";
print $Test "\nopen my \$fh,'<',\"script.txt\" or die  \"Could no open script.txt second\\n\"; \n";
print $Test "while(my \$line = <\$fh>)\{ \n";
print $Test "	print \"\$line\"; \n";
print $Test "\} \n";
print $Test "close(\$fh); \n";

close($Test);

open my $again,'<',"test.txt" or die "Could not open test.txt\n";
while(my $line = <$again>){
	print "$line";
}
close($again);
