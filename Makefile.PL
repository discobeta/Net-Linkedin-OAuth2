use strict;
use warnings;

use inc::Module::Install;

name          'Net-Linkedin-OAuth2';
author        'Asaf Klibansky <discobeta@gmail.com>';
perl_version  '5.006';
all_from      'lib/Net/Linkedin/OAuth2.pm';

requires       'XML::Hash'  => '0';
requires       'JSON::Any'  => '0';
requires       'Digest::MD5'  => '0';
requires       'LWP::UserAgent'  => '0';
requires       'Carp'  => '0';

test_requires 'Test::Harness'       => '3.13';
test_requires 'Test::More'          => '0.86';
test_requires 'autodie'             => '0';

# Remove some extra test files
clean_files( qw{ t/Foo } );

# Test configure_requires support (also needed by WriteMyMeta)
configure_requires 'YAML::Tiny' => '1.33';

# Makes the recursive test script run
# (to test recursive test support)
tests_recursive;

# This is a normal CPAN module
install_as_cpan;

# Normally this shouldn't be done in here, it should be done
# by release automation. This is mostly for testing reasons.
repository 'https://github.com/discobeta/Net-Linkedin-OAuth2.git';

# All of our dependencies are the same on all platforms
dynamic_config 0;

add_metadata x_contributors => [ # manually added, from git shortlog -e -s -n
    'Asaf Klibansky <discobeta@gmail.com>'
];

WriteAll;






