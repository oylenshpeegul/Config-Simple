use strict;
use warnings;
use Test::More tests => 6;
use FindBin '$RealBin';
use File::Spec;

require_ok("Config::Simple");

my $ini_file = File::Spec->catfile($RealBin, 'simplified.ini');
my $cfg;
ok($cfg = Config::Simple->new, 'Config::Simple->new');
ok($cfg->read($ini_file));
is($cfg->param("Name"), "MPFCU", "config: Name");
ok($cfg->param('Library', 'Config::Simple'));
ok($cfg->write);

