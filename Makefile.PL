# -*- perl -*-
use ExtUtils::MakeMaker;
use Config;

$VERSION = "1.02";

print "Writing Makefile for Devel::embed tests...\n";

system "$Config{perlpath} t/writetest.pl";
    
WriteMakefile(
	      VERSION   => $VERSION,
	      DISTNAME  => 'Devel-embed',
	      SKIP      => [qw(static dynamic)],
	      'dist'    => {COMPRESS=> 'gzip -9f', SUFFIX=>'gz', 
			     POSTOP => 'mv $(DISTNAME)-$(VERSION).tar.gz ../'
			     },
	      'linkext' => {LINKTYPE => '' }, 
	      'clean'   => {FILES => "*% *~"},
             );
