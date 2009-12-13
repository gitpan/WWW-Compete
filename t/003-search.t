use strict;

use Test::More;

use constant TMP_KEY => "./blib/compete-api-key.txt";
use constant DOMAIN  => "cpan.org";

plan tests => 10;

my $api_key = "";

open(KEY, TMP_KEY) || BAIL_OUT("Can't get api key, unable to continue");
while(<KEY>) {
  chomp;
  $api_key = $_;
}
close(KEY);

ok($api_key, "Got my hands on the api key, proceeding....");
use_ok("WWW::Compete");
my $c = WWW::Compete->new( api_key => $api_key );
isa_ok($c, "WWW::Compete"); 

diag("Now fetching " . DOMAIN );
$c->fetch(DOMAIN);

is($c->get_domain(), DOMAIN,   ' get_domain()'         );
ok($c->get_measurement_yr(),   ' get_measurement_yr()' );
ok($c->get_measurement_mon(),  ' get_measurement_mon()');
ok($c->get_trust(),            ' get_trust()'          );
ok($c->get_visitors(),         ' get_visitors()'       );
ok($c->get_rank(),             ' get_rank()'           );
ok($c->get_summary_link(),     ' get_summary_link()'   );

