package WWW::Express::API::Common;

use LWP::UserAgent;
use JSON;

sub call{
 my($self,$url) = @_;
 return $self->ua($url);
}

sub ua{
 my ($self,$url) = @_;
 my $ua = LWP::UserAgent->new;
 my $response = $ua->get($url);
 return $response;
 my $content = decode_json($response->{_content});
 return $content;
}

1;
