package MyApp::Schema::Result::Author;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table( 'authors' );
__PACKAGE__->add_columns(
  id   => {
    data_type        => 'integer',
    is_auto_increment => 1,
  },
  name => {
    data_type        => 'varchar',
    size             => 255,
  },
);

__PACKAGE__->set_primary_key( 'id' );
__PACKAGE__->has_many(
  'books' => 'MyApp::Schema::Result::Book',
  'author_id'
);

1;
