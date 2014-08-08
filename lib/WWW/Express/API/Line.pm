package WWW::Express::API::Line;
use URI;
use URI::Escape;
use WWW::Express::API::Common;

sub call{
 my($self,$area,$pref,$format) = @_;
 my $url = URI->new(WWW::Express::API::Common::jsonUrl);
 $url->query_form(method => 'getLines',prefecture => $pref,area => $area);
 return  WWW::Express::API::Common->call($url);
}

1;


