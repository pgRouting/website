#!/usr/bin/perl -w

die "Usage:table_topo.pl <DB TableName> <Topo File>\n" if($#ARGV+1 != 2);
die "Can not open Topo File" unless open ($INFILE,$ARGV[1]);

$tabName = $ARGV[0];
$arcTab  = $tabName."_arc";
$nodeTab = $tabName."_node";

print "create table ".$arcTab ."(id int4,source int4,target int4);\n";
print "create table ".$nodeTab."(id int4,x float8,y float8);\n";

while (<$INFILE>) {
  chop;
  if ( /Nodes/) {
    @line = split /Nodes \(/ ;
    @line = split / /,$line[1];

    $numNodes = $line[0];

    for ($i=0;$i<$numNodes;$i++) {
      $linya = <$INFILE>;
      chop($linya);

      @line2  = split /,/,$linya;

      @temp   = split /node =/,$line2[0];
      $nodeID  = $temp[1];
   
      @temp       = split /n_lines = /,$line2[1];
      $numNodeLine = $temp[1];

      @temp = split /xy =/,$line2[2];
      $nodeX = $temp[1];

      $nodeY = $line2[3];

      print "insert into $nodeTab values ($nodeID,$nodeX,$nodeY);\n";

      for ($j=0;$j<$numNodeLine;$j++) {
	$linya = <$INFILE>; 
      }
    }
  }
  if ( /Lines/) {
    @line = split /Lines \(/ ;
    @line = split / /,$line[1];

    $numLines = $line[0];

    for ($i=0;$i<$numLines;$i++) {
      $linya =  <$INFILE>;
      chop($linya);

      if (/^line = /,$linya) {
	@line = split /,/,$linya;

	@temp   = split /line = /,$line[0];
	$lineNum = $temp[1];

	@temp   = split /n1 = /,$line[2];
	$startN  = $temp[1];

	@temp   = split /n2 = /,$line[3];
	$endN    = $temp[1];

	print "insert into $arcTab values ($lineNum,$startN,$endN);\n";

	$linya = <$INFILE>;
      }
    }
  }
}
