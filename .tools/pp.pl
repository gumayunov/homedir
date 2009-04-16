#!/usr/bin/perl -w
use Data::Dumper;
no strict;
no warnings "all";
$cmd = shift @ARGV;
while(<STDIN>) {
    chomp;
    eval $cmd;
    chomp;
    print( $_, "\n" ) if defined;
}
