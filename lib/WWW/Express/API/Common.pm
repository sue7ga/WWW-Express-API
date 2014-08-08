package WWW::Express::API::Common;

use LWP::UserAgent;
use JSON;

use constant jsonUrl => 'http://express.heartrails.com/api/json?';

sub call{
 my($self,$url) = @_;
 return $self->ua($url);
}

sub ua{
 my ($self,$url) = @_;
 my $ua = LWP::UserAgent->new;
 my $response = $ua->get($url);
 my $content = decode_json($response->{_content});
 return $content;
}

1;
