#!/usr/bin/perl -w
$cmd = shift @ARGV;
while(<>) {
    $res = eval $cmd;
    chomp $res;
    print $res, "\n";
}
