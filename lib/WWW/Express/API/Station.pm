package WWW::Express::API::Station;
use URI;
use URI::Escape;
use WWW::Express::API::Common;

sub call{
  my $self = shift;
  my $near = shift; 
  my $format = shift;
  if($near){
    ($x,$y) = @_;
  }else{
    ($line,$name) = @_;
  }
  my $url = URI->new(WWW::Express::API::Common::jsonUrl);
  if($near){
   $url->query_form(method => 'getStations',x => $x,y => $y);
  }else{
   $url->query_form(method => 'getStations',line => $line);
  }
  return WWW::Express::API::Common->call($url);
}

1;


