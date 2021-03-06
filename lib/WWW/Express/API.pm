package WWW::Express::API;
use WWW::Express::API::Line;
use WWW::Express::API::Station;
use 5.008005;
use strict;
use utf8;
use warnings;
use Mouse;
use URI;

our $VERSION = "0.01";

has area => (
  is => 'rw',
  isa => 'Str'
);

has pref => (
  is => 'rw',
 isa => 'Str'
);

has name => (
  is => 'rw',
 isa => 'Str'
);

has line => (
  is => 'rw',
 isa => 'Str'
);

has x => (
  is => 'rw',
  isa => 'Num'
);

has y => (
  is => 'rw',
  isa => 'Num'
);

has get => (
  is => 'rw',
  isa => 'Str',
  required => 1
);

has format => (
  is => 'rw',
  isa => 'Str'
);

has near => (
  is => 'rw',
 isa => 'Num'
);

has areas => (
  is => 'rw',
  isa => 'ArrayRef',
  default => sub{[]}
);

has prefectures => (
  is => 'rw',
  isa => 'ArrayRef',
  default => sub{[]}
);

# API get
sub retrieve_url{
 my $self = shift;
 my $type = $self->get;
 my $near = $self->near;
 if($type eq 'getLines'){
   my $url = WWW::Express::API::Line->call($self->area,$self->pref,$self->format);
   return $url;
 }elsif($type eq 'getStations' and $near == 1){
   my $url = WWW::Express::API::Station->call($self->near,$self->format,$self->x,$self->y);
   return $url;
 }elsif($type eq 'getStations' and $near == 0){
   my $url = WWW::Express::API::Station->call($self->near,$self->format,$self->line,$self->name);
   return $url;
 }
}

# pref areas list get
our $baseURL = WWW::Express::API::Common::jsonUrl;

sub get_areas{
  my $self = shift;
  my $get = $self->get;
  my $url = URI->new($baseURL);
  $url->query_form(method => $get);
  my $areas = WWW::Express::API::Common->call($url);
  push @{$self->areas},$areas->{response}->{area};
}

sub get_prefectures{
  my $self = shift;
  my $get = $self->get;
  my $url = URI->new($baseURL);
  $url->query_form(method => $get);
  my $prefectures = WWW::Express::API::Common->call($url);
  push @{$self->prefectures},$prefectures->{response}->{prefecture};
}

1;

__END__

=encoding utf-8

=head1 NAME

WWW::Express::API - It's new $module

=head1 SYNOPSIS

    use WWW::Express::API;

=head1 DESCRIPTION

WWW::Express::API is ...

=head1 LICENSE

Copyright (C) sue7ga.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sue7ga E<lt>sue77ga@gmail.comE<gt>

=cut

