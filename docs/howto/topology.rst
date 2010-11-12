:Author: Daniel Kastl
:License: Creative Commons

.. _topology:

================================================================
 Creating Data for Routing Applications
================================================================

Routing Engines always require the source and target nodes for every line in 
order to create a search for the shortest path. Creating this data on line 
networks involves creating a topology on that network. 

Graphs, Directed, unDirected, Reverse Costs
-------------------------------------------

The follow will hopefully explain a little bit about graphs and and how to use 
the directed and reverse cost arguments in the pgRouting function calls. If you 
use assign_vertex_id() to build your graph, it builds an undirected graph. Now 
you might have some oneway streets and you can create a reverse_cost column and 
start by populating it with the cost column values. Now you can treat you graph 
as a directed graph using the forward cost and reverse_cost for the cost to 
traverse an edge from A-B or B-A respectively. Since these values are all the 
same it is not very interesting, but if you have oneway streets you can now edit 
the cost or the reverse_cost values so that the wrong way has a very high cost. 
Many of the pgRouting function have boolean arguments '''directed''' and 
'''has_reverse_cost'''. If you set '''has_reverse_cost=true''', you should also 
set '''directed=true''' or it will ignore your reverse costs.

pgRouting
---------

pgRouting gives the ability to create the source-target (start-end nodes) 
information within PostgreSQL using assign_vertex_id():

.. code-block:: sql

	SELECT assign_vertex_id(table_name, snapping_range, geometry_column_name, edge_id_column_name);


where table_name is the name of the edges table, nodes within snapping_range 
(value is in your current projection units) will be snapped, geometry_column_name 
is the name of the geometry column (usually 'the_geom'), edge_id_column_name is 
the name of the edge id column (usually gid).

This function requires 'source' and 'target' integer fields.

.. code-block:: sql

	ALTER TABLE ways ADD COLUMN source integer;
	ALTER TABLE ways ADD COLUMN target integer;
	SELECT assign_vertex_id('ways', 0.00001, 'the_geom', 'gid');


There is other software, that can be used to create a topology:

PostGIS
-------

As of this writing, the latest `PostGIS <http://www.postgis.org>`_ 1.1.2, has 
started adding a topology functionality. But it is still in a very alpha stage 
and there are very little documentation yet on how to create the topology. This 
page will be updated once the topology functionality becomes stable enough to use.

ArcInfo
-------

For those with an !ArcInfo license, creating a topology is done by just issuing 
the BUILD command:

.. code-block:: bash

	build line {Coverage Name}


and then exporting the coverage to a shape file, which can then be imported into 
PostGIS. The BUILD command will build fnode, tnode, length columns which can 
be renamed in PostgreSQL into source and target, and the length can be set as 
the intial cost.

GRASS
-----

`GRASS <http://grass.itc.it>`_ can be used also to create a topology, but 
extracting the topology information and bringing it into PostgreSQL is not as 
simple as that of !ArcInfo's since the topolgy information is not included into 
with the data set when it is exported to a shape file.

The topolgy creation command "v.build" has a dump option though that will output 
the information into the stream which in turn can be piped into to a file. 
For example:

.. code-block:: bash

	v.build map=dourol option=build,dump > dourokukan.txt 


The output will be like this;

.. code-block:: bash

	---------- TOPOLOGY DUMP ----------
	N,S,E,W,T,B: 35.897887, 24.281578, 153.985841, 138.943042, 0.000000, 0.000000
	Nodes (148304 nodes, alive + dead ):
	node = 1, n_lines = 3, xy = 139.756532, 35.67451
	line = 1, type = 2, angle = -2.265356
	line = -20, type = 2, angle = -0.055499
	line = 8, type = 2, angle = 1.281166
	node = 2, n_lines = 3, xy = 139.756261, 35.674216
	line = -9, type = 2, angle = -2.827622
	line = 2, type = 2, angle = -1.878154
	...
	...
	...
	Lines (220672 lines, alive + dead ):
	line = 1, type = 2, offset = 14 n1 = 1, n2 = 2, left/area = 0, right = 0
	N,S,E,W,T,B: 35.674510, 35.674216, 139.756532, 139.756261, 0.000000, 0.000000
	line = 2, type = 2, offset = 79 n1 = 2, n2 = 3, left/area = 0, right = 0
	N,S,E,W,T,B: 35.674216, 35.672010, 139.756261, 139.755285, 0.000000, 0.000000
	line = 3, type = 2, offset = 160 n1 = 3, n2 = 4, left/area = 0, right = 0
	N,S,E,W,T,B: 35.672010, 35.671649, 139.755285, 139.755014, 0.000000, 0.000000

 
A perl program like `table_topo.pl <http://download.osgeo.org/pgrouting/tools/table_topo.pl>`_ 
can be used to convert GRASS output into SQL files that will create node and 
line tables containing the topological information. These tables can then be 
linked into the PostGIS network table to create the source-target node 
information.

