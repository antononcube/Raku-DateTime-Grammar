#!/usr/bin/env raku
use v6.d;

use lib './lib';
use lib '.';

use DateTime::Grammar;

#----------------------------------------------------------

#`[
say "=" x 120;

my @commands = [
    'Sun, 06 Nov 1994 08:49:37 GMT',
    'Bad, 06 Nov 1994 08:49:37 GMT',
    'Sunday, 06-Nov-94 08:49:37 GMT',
    'Sun 06-Nov-1994 08:49:37 GMT',
    'Sun 06-Nov-94 08:49:37 GMT',
    '1985-04-12T23:20:50.52Z',
    '1996-12-19T16:39:57-08:00',
    '2022-01-22',
    '4 Oct 2022',
    'October 12 2022'
];


for @commands -> $cmd {
    say '=' x 60;
    say $cmd;
    say '-' x 60;
    say datetime-parse($cmd, rule => 'TOP');
    say '-' x 60;
    say datetime-interpret($cmd).raku;
}
]

say '=' x 120;

my $rfc1123   = 'Sun, 06 Nov 1994 08:49:37 GMT';

say datetime-parse($rfc1123)<datetime-spec>;

say '-' x 120;
#say datetime-parse($rfc1123){'datetime-spec';'rfc1123-date'};
say datetime-parse($rfc1123)<datetime-spec rfc1123-date>;