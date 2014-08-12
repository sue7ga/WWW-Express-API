use strict;
use warnings;
use Test::More;
use Encode;
use utf8;
use WWW::Express::API;
use Data::Dumper;

subtest 'getlines' => sub{

  my $express = new WWW::Express::API(area => '関東',get => 'getLines',format => 'json');

  is($express->area,'関東');
  is($express->pref,'東京都');
  is($express->get,'getLines');
  is($express->format,'json');

  print Dumper $express->retrieve_url;

};

subtest 'getStations by line or name' => sub{

my $station = new WWW::Express::API(line => 'JR山手線',get => 'getStations',format => 'json',near => 0);

is($station->near,0);
is($station->name,'新宿');
is($station->line,'JR山手線');
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
 
 print Dumper $station->retrieve_url;

};

subtest 'getPrefectures' => sub{
 my $express = new WWW::Express::API(get => 'getPrefectures');
 is($express->get,'getPrefectures');
 $express->get_prefectures;
 print Dumper $express->prefectures;
};

subtest 'getAreas' => sub{
  my $express = new WWW::Express::API(get => 'getAreas');
  is($express->get,'getAreas');
};

subtest 'areas' => sub{
  my $express = new WWW::Express::API(get => 'getAreas');
  $express->get_areas;
  print Dumper $express->areas;
};


done_testing();
