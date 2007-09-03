# Copyright (c) 2007 Jonathan Rockway <jrockway@cpan.org>

package CatalystX::Starter;
use strict;
use warnings;

use File::ShareDir 'dist_dir';
use File::Copy::Recursive qw/dircopy/;

# don't use any of these subroutines.

sub _boilerplate {
    return dist_dir('CatalystX-Starter');
}

sub _module2dist {
    my $module = shift;
    $module =~ s/::/-/g;
    return $module;
}

sub _copy_files {
    my $dest = shift;
    my $src  = _boilerplate();
    dircopy($src, $dest) or die "Failed to install boilerplate: $!";
}

1;

__END__

=head1 NAME

CatalystX::Starter - bootstrap a CPAN-able Catalyst component

=head1 SYNOPSIS

Like C<module-starter>, but sane:

  $ catalystx-starter 'Module::Name'
  $ cd Module-Name
  $ git init
  $ mv gitignore .gitignore
  $ git add .gitignore *
  $ git ci -m 'Start my component'

Then edit Changes and README to taste
  
  $ mg README
  $ mg Changes
  $ git ci -a -m 'update Changes and README'

Then you're ready to work:

  $ make test
  00load.............ok
  live...............ok
  All tests successful.

  $ prove --lib t/author # don't want users running these
  pod................ok
  pod-coverage.......ok
  All tests successful.

=head1 DESCRIPTION

Recently, I've stopped using C<Module::Starter>, because it generates
way too much boilerplate and not enough of stuff I actually need.  I
find it easier to just start with nothing and manually write what I
need.

C<CatalystX::Starter> automates this minimalism for me.  It will
create everything you need to start developing a Catalyst component or
plugin, but won't create useless crap that you just have to delete.

Here's what you get:

=over 4

=item C<t/lib/TestApp>

A live app that can be run from tests (including C<t/live-test.t>).
It also comes with the C<testapp_server.pl> and C<testapp_test.pl>, so
you can try our your TestApp from the command line.  Yay for never
having to write this again.

So far, I've wasted more than an hour of my life typing this exact
TestApp code in again and again.  Now it's automatic.  FINALLY.

=item Makefile.PL

C<Module::Install>-based Makefile.PL with C<build_requires> set up to
run the default tests.

=item gitignore

Save yourself the effort of setting up a C<.gitignore>.  You can of
course import this as C<svn:ignore> or C<.cvsignore>.  I use git, so
that's what you get by default.

Note that you have to rename this yourself, because I want git to
track it, not treat it as an ignore file.

=item MANIFEST.SKIP

A useful MANIFEST.SKIP that ignores stuff that C<make> leaves lying
around, and my C<.git> directory.

=item Changes / README

No text in here.  Change it to what you want it to look like.

=item C<lib/Your/Module.pm>

Almost nothing:

   package Your::Module;
   use strict;
   use warnings;

   1;

Write the POD yourself.  You're smart enough to remember that the
sequence is NAME, SYNOPSIS, DESCRIPTION, METHODS, BUGS, AUTHOR,
COPYRIGHT.  If not... now you are :)

=back

That's about it.  Enjoy.

=head1 SEE ALSO

C<catalyst.pl>, for creating Catalyst applications.

L<Module::Starter|Module::Starter>, if you like deleting code more
than writing it.

=head1 AUTHOR

Jonathan Rockway C<< <jrockway@cpan.org> >>.

=head1 COPYRIGHT

I don't assert any copyright over the generated files.  This module
itself is copyright (c) 2007 Jonathan Rockway and is licensed under
the same terms as Perl itself.
