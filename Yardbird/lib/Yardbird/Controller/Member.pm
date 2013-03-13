package Yardbird::Controller::Member;
use Moose;
use namespace::autoclean;
use Yardbird::Form::User; 

BEGIN { extends 'Catalyst::Controller'; }

has 'form' => (
  isa => 'Yardbird::Form::User',
  is => 'rw',
  lazy => 1,
  default => sub { Yardbird::Form::User->new }
);

sub create :Local {
  my ( $self, $c, $user_id ) = @_;

  $c->stash(template => 'member/create.tt', form => $self->form );

  # Validate and insert data into database
  return unless $self->form->process(
    item_id => $user_id,
    params => $c->req->parameters,
    schema => $c->model('DB')->schema
  );

  # Form validated, return to home
  $c->res->redirect($c->uri_for_action('/index'));
}

1;
