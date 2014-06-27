use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";
use Test::More;

use MyApp::Schema;

my $dbfile = "$Bin/../test.db";

if ( -x $dbfile ) {
  plan skip_all => "No database to test against, please run install script"
}

my $schema = MyApp::Schema->connect( "dbi:SQLite:$dbfile" );

ok (
  $schema,
  "Can connect to schema successfully"
);

my $author_rs = $schema->resultset('Author');

is (
  $author_rs->count,
  4,
  "Authors have 4 entries"
);

my $author = $author_rs->find( { name => 'Charles Dickens' } );

is (
  $author->books->count,
  2,
  "Charles Dickens has correct number of books"
);

my $book_rs = $schema->resultset('Book');

is (
  $book_rs->count,
  5,
  "Books have 5 entries"
);

my $book = $book_rs->find( { title => 'Hamlet' } );

is (
  $book->author->name,
  "William Shakespeare",
  "Hamlet has the correct author"
);

done_testing;
