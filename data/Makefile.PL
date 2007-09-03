use inc::Module::Install;

my $module = '[% __YOUR_MODULE__ %]';

my $dist   = $module;
$dist =~ s/::/-/g;
name($dist);

my @path = split '::', $module;
all_from('lib/'. (join '/',@path). '.pm');


build_requires 'Catalyst::Runtime';
build_requires 'Test::More';
build_requires 'ok';

WriteAll();
