package WWW::Express::API::Line;
use URI;
use URI::Escape;
use WWW::Express::API::Common;

use constant jsonUrl => 'http://express.heartrails.com/api/json?';

sub call{
 my($self,$area,$pref,$format) = @_;
 my $url = URI->new(jsonUrl);
 $url->query_form(method => 'getLines',prefecture => $pref,area => $area);
 return  WWW::Express::API::Common->call($url);
}

1;
