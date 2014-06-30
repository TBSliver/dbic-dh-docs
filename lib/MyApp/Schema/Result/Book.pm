package MyApp::Schema::Result::Book;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components( qw/ InflateColumn::DateTime / );
__PACKAGE__->table( 'books' );
__PACKAGE__->add_columns(
  id        => {
    data_type         => 'integer',
    is_auto_increment => 1,
  },
  author_id => {
    data_type         => 'integer',
  },
  title     => {
    data_type         => 'text',
  },
  purchase_date => {
    data_type         => 'datetime',
  },
);

__PACKAGE__->set_primary_key( 'id' );
__PACKAGE__->belongs_to(
  'author' => 'MyApp::Schema::Result::Author',
  'author_id'
);
