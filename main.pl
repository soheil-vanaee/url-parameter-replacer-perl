#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;

# Check command line arguments
if (@ARGV != 4 || $ARGV[2] ne '-p') {
    die "Usage: $0 <URL> -p <filename>\n";
}

my $url = $ARGV[0];
my $filename = $ARGV[3];

# Read the contents of the file
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
my @lines = <$fh>;
close($fh);

# Create a user agent object
my $ua = LWP::UserAgent->new;

foreach my $line (@lines) {
    chomp $line;

    # Replace $ with the line content
    my $new_url = $url;
    $new_url =~ s/\$/$line/g;

    # Send HTTP request
    my $response = $ua->get($new_url);

    # Check if the request was successful
    if ($response->is_success) {
        print "Successfully fetched URL: $new_url\n";
        print $response->decoded_content, "\n";
    } else {
        print "Failed to fetch URL: $new_url\n";
        print $response->status_line, "\n";
    }
}
