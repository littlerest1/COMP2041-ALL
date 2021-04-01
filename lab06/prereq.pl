#!/usr/bin/perl -w

@ARGV >=1 or die "Usage:./prereq.pl + [COURSE CODE]+";

my @urls;
my @url;
my $urlP = "http://www.handbook.unsw.edu.au/postgraduate/courses/2018/";
my $urlU = "http://legacy.handbook.unsw.edu.au/undergraduate/courses/2018/";
my $html = ".html";

foreach my $course(@ARGV){
	($course =~ /^[A-Z]{4}[0-9]{4}$/) or die "$course is not a valid course code.";
	(my $subject) = ($course =~ /^([A-Z]{4})/);
	(my $PorU) = ($course =~ /([0-9]{1})/);
	#print "$subject $PorU\n";
	
	
	@url = $urlU.$course.$html;
	push @urls,@url;
	@url = $urlP.$course.$html;
	push @urls,@url;
	
	foreach my $link(@urls){
		open F,"-|","wget -q -O- $link" or die "Could not dowload $link";
		while ($line = <F>) {
			$line = $line =~ s/^\s+//gr;
			$line = $line =~ s/\s+$/\n/gr;

			if($line =~ /Prerequisite:/ or $line =~ /Prerequisites:/){
				$line = $line =~ s/<p>//gr;
				$line = $line =~ s/<.*p>/ /gr;
				#print"$line\n";
				$line = $line =~ s/Prerequisite: //gr;
				$line = $line =~ s/\.//gr;
				$line = $line =~ s/\s/:/gr;
				#print "$line";
				
				my @info=split(/:/,$line);  
				#print "10 : $info[10]\n";
				foreach my $data(@info){
					if(($data =~ /^[A-Z]{4}[0-9]{4}$/)){
						print $data."\n";
					}
				}

			}
		}
	}
}
#print "$url\n";
