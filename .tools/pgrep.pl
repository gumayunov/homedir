#!/usr/bin/perl -w
use Data::Dumper;
no strict;
no warnings "all";
$cmd = shift @ARGV;
while(<>) {
    chomp;
    print( $_, "\n" ) if eval $cmd;
}
