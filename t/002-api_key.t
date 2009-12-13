use strict;
use Test::More;

plan tests => 3;

use constant TMP_KEY => "./blib/compete-api-key.txt";

diag("\n\nPlease enter your www.compete.com API key: ");

my $api_key = <STDIN>;
chomp($api_key);
ok($api_key, "Thanks for the key, proceeding....");

open(TMP, ">". TMP_KEY) || die "$!\n";
my $fh = -f TMP;
ok($fh, "Got handle to write key");
print TMP $api_key;
close(TMP);
my $size = -s TMP_KEY;
ok($size, "Was able to write key");
