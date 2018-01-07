#!/usr/bin/perl

	use strict;
	use warnings;

	if($#ARGV < 2){
		print "Usage: bulkmv [path] [match] [replace] (c)\n";
		exit 1
  }

  my $res;
	my @lines;  
	
	$res = `find $ARGV[0] -mindepth 1 -maxdepth 1`;
	@lines = split /\n/, $res;
  foreach my $file (@lines) {
    my $dest = $file;
		$dest=~ s/$ARGV[1]/$ARGV[2]/g;    
  	print "$file -> $dest\n";

  	if($#ARGV > 2){
	    if($ARGV[3] == "c"){
				if(!($file =~ m/$dest/)){
					`mv $file $dest`;		
				}
			}
		}
	}

	print "$#ARGV, $ARGV[1]";
	
