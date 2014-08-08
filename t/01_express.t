use strict;
use Test::More;
use Encode;

use WWW::Express::API;
use Data::Dumper;

subtest 'getlines' => sub{

my $express = new WWW::Express::API(area => '関東',pref => '神奈川県',get => 'getLines',format => 'json');

is($express->area,'関東');
is($express->pref,'神奈川県');
is($express->get,'getLines');
is($express->format,'json');

#print Encode::encode_utf8(${$express->retrieve_url->{response}->{line}}[1]),"\n";

};

subtest 'getStations by line or name' => sub{

my $station = new WWW::Express::API(line => 'JR山手線',name => '新宿',get => 'getStations',format => 'json',near => 0);

is($station->near,0);
is($station->name,'新宿');
is($station->get,'getStations');
is($station->format,'json');
 
print Dumper $station->retrieve_url;

};

subtest 'getStations by x or y' =>  sub {
  
  my $station = new WWW::Express::API(x => 135.0,y => 35.0,get => 'getStations',format => 'json',near => 1);
 
  is($station->near,1);
  is($station->x,135.0);
  is($station->y,35.0);
  is($station->get,'getStations');
  is($station->format,'json');
 
  is_deeply($station->retrieve_url->{response}->{station},[
                                         {
                                           'next' => "\x{9ed2}\x{7530}\x{5e84}",
                                           'distance' => '310m',
                                           'prev' => "\x{6bd4}\x{5ef6}",
                                           'name' => "\x{65e5}\x{672c}\x{3078}\x{305d}\x{516c}\x{5712}",
                                           'postal' => '6770039',
                                           'x' => '134.997666',
                                           'y' => '35.002054',
                                           'prefecture' => "\x{5175}\x{5eab}\x{770c}",
                                           'line' => "JR\x{52a0}\x{53e4}\x{5ddd}\x{7dda}"
                                         },
                                         {
                                           'next' => "\x{65e5}\x{672c}\x{3078}\x{305d}\x{516c}\x{5712}",
                                           'distance' => '1310m',
                                           'prev' => "\x{65b0}\x{897f}\x{8107}",
                                           'name' => "\x{6bd4}\x{5ef6}",
                                           'postal' => '6770033',
                                           'x' => '134.99574',
                                           'y' => '34.988777',
                                           'prefecture' => "\x{5175}\x{5eab}\x{770c}",
                                           'line' => "JR\x{52a0}\x{53e4}\x{5ddd}\x{7dda}"
                                         },
                                         {
                                           'next' => "\x{672c}\x{9ed2}\x{7530}",
                                           'distance' => '2620m',
                                           'prev' => "\x{65e5}\x{672c}\x{3078}\x{305d}\x{516c}\x{5712}",
                                           'name' => "\x{9ed2}\x{7530}\x{5e84}",
                                           'postal' => '6790313',
                                           'x' => '134.992545',
                                           'y' => '35.02274',
                                           'prefecture' => "\x{5175}\x{5eab}\x{770c}",
                                           'line' => "JR\x{52a0}\x{53e4}\x{5ddd}\x{7dda}"
                                         }
                                       ]);

};

subtest 'getPrefectures' => sub{

 my $express = new WWW::Express::API(get => 'getPrefectures');
 is($express->get,'getPrefectures');
 
 my $prefectures = $express->get_prefectures;

 $prefectures->{response}->{prefecture};
};

subtest 'getAreas' => sub{

  my $express = new WWW::Express::API(get => 'getAreas');
  is($express->get,'getAreas');
  
  my $areas = $express->get_areas;

  $areas->{response}->{area};
};

done_testing();
