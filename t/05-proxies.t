#!/usr/bin/env perl6

BEGIN { @*INC.unshift: './lib'; }

use Test;
use XML;

plan 7;

my $doc = from-xml(:file<./t/query.xml>);

ok $doc ~~ XML::Document, 'from-xml with :file works.';

my $xml = $doc.root;

is $xml[0][0].string, 'The title', 'Postcircumfix lookup of Text node works.';
is $xml[1][0]<name>, 'first', 'Postcircumfix lookup of Attribute works.';

is $doc.nodes[0].nodes[0].string, 'The title', '.nodes on doc works';
is $doc[1][1]<name>, 'second', 'Postcircumfix [] on doc works.';

$doc<id> = 'default';

is $xml.attribs<id>, 'default', 'Postcircumfix {} on doc works.';

is $doc.attribs<id>, 'default', '.attribs on doc works.';
