
use strict;
use warnings;
use CPAN;

my @required = qw(XML::Hash JSON::Any Digest::MD5 LWP::UserAgent Carp);
for (@required) {
	CPAN::install($_);
}

use 5.008008;

use ExtUtils::MakeMaker 6.30;

my %WriteMakefileArgs = (
  "ABSTRACT" => "An easy way to authenticate users via LinkedIn",
  "AUTHOR" => "Asaf Klibansky <discobeta\@gmail.com>",
  "BUILD_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.42",
    #"Test::More" => "0.47"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.42"
  },
  "DISTNAME" => "Net-Linkedin-OAuth2",
  "LICENSE" => "perl",
  "NAME" => "Net::Linkedin::OAuth2",
  "PREREQ_PM" => {
    'XML::Hash' => 0,
    'JSON::Any'	=>	0,
    'Digest::MD5'	=>	0,
    'LWP::UserAgent'	=>	0,
    'Carp'	=>	0,
  },
  "VERSION" => "0.03",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);





