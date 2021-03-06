use utf8;
package Yardbird::Schema::Result::Role;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Yardbird::Schema::Result::Role

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<role>

=cut

__PACKAGE__->table("role");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 role

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "role",
  { data_type => "varchar", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user_roles

Type: has_many

Related object: L<Yardbird::Schema::Result::UserRole>

=cut

__PACKAGE__->has_many(
  "user_roles",
  "Yardbird::Schema::Result::UserRole",
  { "foreign.roleid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 userids

Type: many_to_many

Composing rels: L</user_roles> -> userid

=cut

__PACKAGE__->many_to_many("userids", "user_roles", "userid");


# Created by DBIx::Class::Schema::Loader v0.07031 @ 2013-03-13 19:50:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pvhMG1CO8c2p6WAbOeYAgQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
