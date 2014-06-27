#! /usr/bin/env perl

use strict;
use warnings;

use DBIx::Class::DeploymentHandler::DeployMethod::SQL::Translator::ScriptHelpers
'schema_from_schema_loader';

schema_from_schema_loader({ naming => 'v7' }, sub {
  my ( $schema, $versions ) = @_;

  $schema->resultset('Author')->populate([
    {
      name => 'Charles Dickens',
      books => [
        { title => 'Oliver Twist' },
        { title => 'A Christmas Carol' },
      ]  
    },
    {
      name => 'William Shakespeare',
      books => [
        { title => 'Hamlet' },
        { title => 'Julius Ceasar' },
      ]
    },
    {
      name => 'J.R.R. Tolkein',
      books => [
        { title => 'Lord of the Rings: The Fellowship of the Ring' },
      ]
    },
    {
      name => 'J.K. Rowling',
    },
  ]);
})
