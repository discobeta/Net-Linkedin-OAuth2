use inc::Module::Install;

name 'Joe-Hacker';
abstract 'An easy way to authenticate users via LinkedIn.';
author  'Asaf Klibansky <discobeta@gmail.com>';
include 'Module::AutoInstall';
version_from 'lib/Linkedin/OAuth2.pm';

# mandatory modules
requires 'XML::Hash';
requires 'JSON::Any';
requires 'Digest::MD5';
requires 'LWP::UserAgent';
requires 'Carp';

auto_install(
	#make_args   => '--hello',   # option(s) for CPAN::Config
	#force   => 1,   # pseudo-option to force install
	#do_once => 1,   # skip previously failed modules
);

WriteAll;


