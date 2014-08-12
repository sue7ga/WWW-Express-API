package WWW::Express::API::Line;
use URI;
use URI::Escape;
use Carp;
use WWW::Express::API::Common;

sub call{
 my($self,$area,$pref,$format) = @_;
 my $url = URI->new(WWW::Express::API::Common::jsonUrl);
 if(not defined $area and not defined $pref){
   croak("area and pref is both required");
 }elsif(not defined $area){
   $url->query_form(method => 'getLines',prefecture => $pref);
 }elsif(not defined $pref){
   $url->query_form(method => 'getLines',area => $area);
 }else{
   $url->query_form(method => 'getLines',prefecture => $pref,area => $area);
 }
 return  WWW::Express::API::Common->call($url);
}

1;


