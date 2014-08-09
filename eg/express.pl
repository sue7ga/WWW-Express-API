use strict;
use warnings;
use utf8;
use Encode;
use Carp;
use FindBin;
use lib "$FindBin::Bin/../lib";
use WWW::Express::API;
use Data::Dumper;
use Mojolicious::Lite;

get '/' => 'index';

use Data::Dumper;

post '/create' => sub{
  my $self = shift;
   
  my $x = $self->param('x');
  my $y = $self->param('y');
  
  my $station = new WWW::Express::API(x => $x,y => $y,get => 'getStations',format => 'json',near => 1);
  my $next = $station->retrieve_url->{response}->{station}->[0]->{next};
  $self->render(text => "$next");
};

get '/line' => sub{
   my $self= shift;

   my $express = new WWW::Express::API(area => '関東',pref => '神奈川県',get => 'getLines',format => 'json');
   
   $self->render();

} => 'line';

app->start;

__DATA__

@@ index.html.ep
<html>
  <head><title>緯度・経度から最寄りの駅情報を求める</title></head>
  <body>
   <form method="post" action="<%= url_for '/create' %>" >
    <div> 緯度:<input type="text" name="x"></div> 
    <div> 緯度:<input type="text" name="y"></div>
    <input type="submit" value="Send">
   </form>
  </body>
</html>

@@ line.html.ep
<html>
  <head><title>関東の路線一覧を表示する</title></head>
  <body>
    hoge
  </body>
</html>



