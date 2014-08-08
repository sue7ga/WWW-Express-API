package WWW::Express::API::Station;
use URI;
use URI::Escape;
use WWW::Express::API::Common;

sub call{
  my $self = shift;
  my $near = shift; 
  my $format = shift;
  my($x,$y,$line,$name);
  if($near){
    ($x,$y) = @_;
  }else{
    ($line,$name) = @_;
  }
  my($self,$line,$name,$format) = @_;
  my $url = URI->new(WWW::Express::API::Common::jsonUrl);
  #my $line = uri_escape($line);
  if($near){
   $url->query_form(method => 'getStations',x => $x,y => $y);
  }else{
   $url->query_form(method => 'getStations',line => $line);
  }
  #return $url;
  return WWW::Express::API::Common->call($url);
}

1;


