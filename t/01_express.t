use strict;
use Test::More;

use WWW::Express::API;

my $express = new WWW::Express::API(area => '関東',pref => '神奈川県',get => 'getLines',format => 'json');

is($express->area,'関東');
is($express->pref,'東京都');
is($express->get,'getLines');
is($express->format,'json');

use Data::Dumper;

print Dumper $express->retrieve_url;

done_testing();