#!/bin/env perl
use strict;
use warnings;
#use Data::Dumper;

# Episode 1 - In which I solve the simplest problem on Project Euler
# by asking the many faces of perl

my $method = $ARGV[0] || 'simple';
my $max = $ARGV[1] || 1000;

my ($begin, $end);

eval {
    require Time::HiRes;
    $begin = Time::HiRes::time();
};

my $sum = 0;

my %method = (

    # straightforward technnique
    'simple' => sub {
        for (my $i = 1; $i < $max; $i++) {
            if ($i % 3 == 0 || $i % 5 == 0) {
                $sum += $i;
            }
        }
    },

    # obfuscated to the delight of no one.  performs about the same
    # as the version that people can read.
    'oneliner' => sub {
        map { $sum += $_ } grep { !($_ % 3) || !($_ % 5) } (1 .. ($max - 1));
    },

    # solve it like a human. slowly.
    'string' => sub {
        for (my $i = 1; $i < $max; $i++) {
            if ($i =~ /(0|5)$/) {
                $sum += $i;
            }
            else {
                my @dig = split //, $i;
                my $s = 0;
                map { $s += $_ } @dig;
                if ($s % 3 == 0) {
                    $sum += $i;
                }
            }
        }
    },

    # How the solution documentation does it, much more clever
    # and scales with MAX.
    'euler' => sub {
        my $summer = sub {
            my $n = shift;
            my $p = int(($max - 1) / $n);
            return int($n * ($p * ($p + 1)) / 2);
        };
        $sum = $summer->(5) + $summer->(3) - $summer->(15);
    }
);

if (!defined $method{$method}) {
    die "method not defined: $method";
}

$method{$method}->();

eval {
    $end = Time::HiRes::time();
};

print "method: $method\n";
print "sum: $sum\n";
if (defined $begin && defined $end) {
    print "time (ms): " . (1000.0 * ($end - $begin)) . "\n";
}
