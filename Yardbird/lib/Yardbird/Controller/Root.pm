package Yardbird::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');


sub index :Path :Args(0) {
  my ( $self, $c ) = @_;

  $c->stash(blog_entries => [$c->model('DB::Blog')->search({})]);

  $c->detach($c->view("TT")); 
}

sub blog :Path('blog') :Args(1) {
  my ( $self, $c, $id ) = @_;

  $c->stash(blog_entry => $c->model('DB::Blog')->search({id => $id}));

  $c->detach($c->view("TT"));
} 

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
