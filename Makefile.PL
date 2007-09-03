use inc::Module::Install;

name('CatalystX-Starter');
all_from('lib/CatalystX/Starter.pm');

requires 'Catalyst::Runtime';
requires 'Catalyst::Devel';
requires 'Test::More';
requires 'ok';
requires 'Test::Pod';
requires 'Test::Pod::Coverage';

build_requires 'Directory::Scratch';
build_requires 'File::pushd';
build_requires 'Test::TableDriven';

install_share('data');

WriteAll();
