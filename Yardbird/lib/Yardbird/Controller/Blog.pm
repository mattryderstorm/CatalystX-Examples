package Yardbird::Controller::Blog;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
  my ( $self, $c ) = @_;

  $c->stash(blog_entries => [$c->model('DB::Blog')->most_recent]);

  my @members;
  for my $user ($c->model('DB::User')->all) {
    my $blog_entry = $c->model('DB::Blog')->all_user($user->id)->first;
    push @members, { name => $user->name, bid => $blog_entry->id } if $blog_entry; 
  }
  my @sorted_members = sort { "\L$a->{name}" cmp "\L$b->{name}" } @members; 
  $c->stash(sorted_members => [@sorted_members]);

  $c->detach($c->view("TT")); 
}

__PACKAGE__->meta->make_immutable;

1;
