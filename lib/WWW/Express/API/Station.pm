package WWW::Express::API::Station;
use URI;
use URI::Escape;
use WWW::Express::API::Common;
use Carp;

sub call{
  my $self = shift;
  my $near = shift; 
  my $format = shift;
  if($near){
    ($x,$y) = @_;
    if(not defined $x or not defined $y){
      croak("x,y is both required");
    }
  }else{
    ($line,$name) = @_;
    if(not defined $line and not defined $name){
     croak("line or name is required");
    }
  }
  my $url = URI->new(WWW::Express::API::Common::jsonUrl);
  if($near){
   $url->query_form(method => 'getStations',x => $x,y => $y);
  }else{
   if(not defined $name){
     $url->query_form(method => 'getStations',line => $line);
   }elsif(not defined $line){
    $url->query_form(method => 'getStations',name => $name);
   }else{
    $url->query_form(method => 'getStations',line => $line,name => $name);
   } 
  }
  return WWW::Express::API::Common->call($url);
}

1;


