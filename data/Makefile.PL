use inc::Module::Install;

name '[% DIST_NAME %]';
all_from '[% MAIN_MODULE_PATH %]';

build_requires 'Catalyst::Runtime';
build_requires 'Test::WWW::Mechanize::Catalyst';
build_requires 'Test::More';
build_requires 'ok';

WriteAll();
