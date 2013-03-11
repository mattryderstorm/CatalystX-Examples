package Yardbird::Controller::Blog::Entries;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(1) {
  my ($self, $c, $bID) = @_;

  my $row = $c->model('DB::Blog')->specific($bID)->first;
  $c->stash(blog_entry => $row);
  $c->stash(blog_entries => [$c->model('DB::Blog')->all_user($row->userid->id)]);
  $c->detach($c->view("TT")); 
}

__PACKAGE__->meta->make_immutable;

1;
