#!/usr/bin/env perl
use strict;
use warnings;

my $LINE_PER_RECORD = 5;
open(IN, "< gmt-chinese-users.dat") or die "Error in opening gmt-chinese-users.dat\n";
my @lines = <IN>; chomp(@lines);
close(IN);

open(OUT, "> gmt-chinese-users.json") or die "Error in opening gmt-chinese-users.json\n";
print OUT
'{
    "type": "FeatureCollection",
    "features": [
';

for (my $i=0; $i<@lines; $i += $LINE_PER_RECORD+1) {
    my (undef, $id) = split ":", $lines[$i];
    my (undef, $lat) = split ":", $lines[$i+1];
    my (undef, $lon) = split ":", $lines[$i+2];
    my (undef, $city) = split ":", $lines[$i+3];
    my (undef, $name) = split ":", $lines[$i+4];

    printf OUT '
        {
            "id": %d,
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [%f, %f]
            },
            "properties": {
                "city": "%s",
                "name": "%s"
            }
        }', $id, $lon, $lat, $city, join(" ", $name);
    print OUT "," if $#lines - $i > $LINE_PER_RECORD;
    print OUT "\n";
}
print OUT
'    ]
}
';
close(OUT);
