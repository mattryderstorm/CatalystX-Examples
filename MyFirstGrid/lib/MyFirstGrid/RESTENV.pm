package MyFirstGrid::Controller::Restnv;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller::REST'}
with 'Catalyst::TraitFor::Controller::jQuery::jqGrid'; 

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MyFirstGrid::Controller::Restnv in Rest.');
}

sub getdata :Local :ActionClass('REST') {}

sub getdata_GET { 
  my ($self, $c) = @_;

  my $inv_rs = $c->model('DB::Inventory')->search({});
  $inv_rs = $self->jqgrid_page($c, $inv_rs);
  my @row_data;
  while (my $inv = $inv_rs->next) {
    my $single_row = {
      cell => [
        $inv->inv_id,
        $inv->client_id,
        $inv->amount,
        $inv->tax,
        $inv->total,
        $inv->note,
      ],
    };
    push @row_data, $single_row;
  }

  $self->status_ok($c, entity => {
    page => $c->stash->{json_data}{page},  
    records => $c->stash->{json_data}{records},  
    total => $c->stash->{json_data}{total},  
    rows => \@row_data,
  }); 
}

sub postrow :Local :ActionClass('REST') {}

sub postrow_POST {
  my ($self, $c) = @_;

  my $data = $c->request->parameters;
  if ($data->{oper} eq 'edit') { # save row 
    my $inv_rs = $c->model('DB::Inventory')->search({inv_id => $data->{id}});
    $inv_rs->update({
      client_id => $data->{client_id},
      amount => $data->{amount},
      tax => $data->{tax}, 
      total => $data->{total}, 
      note => $data->{note}, 
    });
    $c->response->status(204); 
  }
  elsif ($data->{oper} eq 'add') { # add new row
    my $inv_rs = $c->model('DB::Inventory');
    $inv_rs->create({
      client_id => $data->{client_id},
      amount => $data->{amount},
      tax => $data->{tax}, 
      total => $data->{total}, 
      note => $data->{note}, 
    });
    $c->response->status(204); 
  }  
  elsif ($data->{oper} eq 'del') { # delete row
    my $inv_rs = $c->model('DB::Inventory')->search({inv_id => $data->{id}});
    $inv_rs->delete();
    $c->response->status(204); 
  }
  else {
    $c->response->body('400 BAD REQUEST: Root/postrow');
    $c->response->status(400); # 400 BAD REQUEST 
  } 
} 

__PACKAGE__->meta->make_immutable;

1;
