sub name {
  my ($self) = @_;
  my $bestname;

  if ($self->firstname) {
    $bestname = $self->firstname;
    if ($self->lastname) {
      $bestname .= ' ' . $self->lastname;
    }
  }
  elsif ($self->lastname) {
    $bestname = $self->lastname;
  }
  else {
    $bestname = $self->username;
  }
  return $bestname;
}
