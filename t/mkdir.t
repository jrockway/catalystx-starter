#!/usr/bin/env perl
# Copyright (c) 2007 Jonathan Rockway <jrockway@cpan.org>

use strict;
use warnings;
use File::pushd;
use Directory::Scratch;
use CatalystX::Starter;

use Test::TableDriven (
    mk_dist => { 'Foo::Bar'  => 'Foo-Bar',
                 'a::plugin' => 'a-plugin',
               },
);

runtests;

sub mk_dist {
    my $module = shift;
    my $dir    = Directory::Scratch->new;
    my $push   = pushd("$dir");
    
    CatalystX::Starter::_make_destination($module);
    my $dist = CatalystX::Starter::_module2dist($module);
    
    if ($dir->exists($dist))  {
        return $dist;
    }

    return [$dir->ls];
}
