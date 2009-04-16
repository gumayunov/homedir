#!/usr/bin/perl -w
use Data::Dumper;
no strict;
no warnings "all";
$cmd = shift @ARGV;
while(<>) {
    chomp;
    my $res = eval $cmd;
    chomp $res;
    print( $res, "\n" ) if defined $res;
}
