use strict;
use warnings;
use utf8;
use Encode;
use Carp;
use FindBin;
use lib "$FindBin::Bin/../lib";
use WWW::Express::API;
use Data::Dumper;

{
my $express = new WWW::Express::API(get => 'getPrefectures');
$express->get_prefectures;

my $prefs = $express->prefectures->[0];

for my $pref(@{$prefs}){
  print Encode::encode_utf8($pref),"\n";
}
}

{
my $express = new WWW::Express::API(get => 'getAreas');
$express->get_areas;
my $areas =  $express->areas->[0];
 for my $area (@{$areas}){
    print Encode::encode_utf8($area),"\n";
 }
}

print "lines","\n";
{
  my $express = new WWW::Express::API(area => '関東',pref => '東京都',get => 'getLines',format => 'json');
  for my $line (@{$express->retrieve_url->{response}->{line}}){
    print Encode::encode_utf8($line),"\n";
  }
}


print "stations","\n";
{
   my $express = new WWW::Express::API(line => 'JR山手線',get => 'getStations',format => 'json',near => 0);

   for my $station(@{$express->retrieve_url->{response}->{station}}){
         print "*-----------------------------------*","\n";
         print Encode::encode_utf8($station->{next}),"\n";
         print Encode::encode_utf8($station->{prev}),"\n";
         print Encode::encode_utf8($station->{name}),"\n";
         print Encode::encode_utf8($station->{postal}),"\n";
         print Encode::encode_utf8($station->{x}),"\n";
         print Encode::encode_utf8($station->{y}),"\n";
         print Encode::encode_utf8($station->{prefecture}),"\n";
         print Encode::encode_utf8($station->{line}),"\n";
   }

}
