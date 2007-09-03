use inc::Module::Install;

name('CatalystX-Starter');
all_from('lib/CatalystX/Starter.pm');

requires 'Catalyst::Runtime';
requires 'Catalyst::Devel';
requires 'Test::More';
requires 'ok';
requires 'Test::Pod';
requires 'Test::Pod::Coverage';
requires 'File::ShareDir';
requires 'File::Copy::Recursive';
requires 'File::Slurp';
build_requires 'File::pushd';

build_requires 'Directory::Scratch';
build_requires 'Test::TableDriven';
build_requires 'Test::Exception';

install_script('bin/catalystx-starter');
install_share('data');

no_index directory => 'data';

WriteAll();
