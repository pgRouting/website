:Author: Daniel Kastl
:License: Creative Commons

.. _oneway:

================================================================
 How to handle one-way streets
================================================================

Both Dijkstra and A-Star algorithms have the ability to compute the cost for 
both sides of an edge of a graph, which can be very useful when finding a route 
with a road network that has one-way streets.

This little example will illustrate how this is done. The sample data was 
created using `OpenJump <http://openjump.org>`_ and then was saved in a 
`PostGIS <http://www.postgis.net>`_ database where pgRouting was also installed.

The graph looks like this; note that edge !#2 was digitized from right to left, 
unlike most of the edges which was digitized left to right. This was done to 
simulate a one way street.

.. image:: img/howto_onewaystreets_1.png
  :scale: 100%
  :align: center


When computing for the cost of both sides of the edge, a reverse_cost field is 
necessary to be passed to the routing algorithm.

Initially, both the cost and the reverse_cost values set to the length of the edge.

.. code-block:: sql

	routing=# UPDATE rtest SET cost=length(the_geom), rcost=length(the_geom); 
	UPDATE 5


Then, to increase the reverse_cost of edge !#2, a value of 1,000,000 was added 
to the value of the reverse_cost field.

.. code-block:: sql

	routing=# UPDATE rtest SET rcost=rcost + 1000000 WHERE gid = 2;


.. code-block:: sql

	routing=# SELECT gid,cost,rcost,source,target FROM rtest ORDER BY gid;  

	gid |        cost      |         rcost       | source | target 
	----+------------------+---------------------+--------+--------
	 1  | 90.4777391240398 | 90.4777391240398    |      1 |      2
	 2  | 266.663211021467 | 000266.663211021467 |      3 |      2
	 3  | 74.7975644284963 | 74.7975644284963    |      2 |      4
	 4  | 264.887335603738 | 264.887335603738    |      4 |      5
	 5  | 49.0618009646755 | 49.0618009646755    |      3 |      5
	(5 rows)


The last parameter of both Dijkstra and A-Star algorithms determines whether 
the reverse cost will also be computed when finding a route through the graph.

When set to false, both algorithms will search using only the cost parameter, 
which in this case is just the length of each edge. For this example, we'll find 
a route between node #1 until node #3.

.. code-block:: sql

	routing=# SELECT * FROM shortest_path_astar('SELECT gid AS id,source::int4,
		target::int4, cost::double precision, rcost::double precision AS reverse_cost,
		x1,y1,x2,y2 FROM rtest',1,3,false,false);

	 vertex_id | edge_id |      cost
	-----------+---------+------------------
		   1   |     1   | 90.4777391240398
		   2   |     2   | 266.663211021467 
		   3   |    -1   |  0
	(3 rows)


.. image:: img/howto_onewaystreets_2.png
  :scale: 100%
  :align: center


Now, if the reverse parameter is set to true, the algorithms will use the 
reverse_cost and see that node 2 of edge #2 has a very hight cost and will look 
for another route.

.. code-block:: sql

	routing=# SELECT * FROM shortest_path_astar('SELECT gid AS id, source::int4,
		 target::int4, cost::double precision, rcost::double precision AS reverse_cost,
		 x1,y1,x2,y2 FROM rtest',1,3,false,true);

	vertex_id | edge_id |       cost
	----------+---------+------------------
		   1  |      1  |  90.4777391240398           
		   2  |      3  |  74.7975644284963           
		   4  |      4  |  264.887335603738
		   5  |      5  |  49.0618009646755
		   3  |     -1  |   0
	(5 rows)


.. image:: img/howto_onewaystreets_3.png
  :scale: 100%
  :align: center


Although having the ability to compute the cost of both sides of the edge is a 
very nifty feature, it come with a heavy price since it will impact performance 
quite a bit and thus should be used only when it is really necessary.

.. code-block:: sql

	routing=# EXPLAIN ANALYZE SELECT * FROM shortest_path_astar('SELECT gid
		AS id,source::int4, target::int4, cost::double precision, rcost::double
		precision AS reverse_cost,x1,y1,x2,y2 FROM rtest',1,3,false,false);

		                           QUERY PLAN 
	--------------------------------------------------------------------------------
	Function Scan on shortest_path_astar  (cost=0.00..12.50 rows=1000 width=16) 
	(actual time=0.954..0.958 rows=3 loops=1)  Total runtime: 1.020 ms
	(2 rows)


.. code-block:: sql

	routing=# EXPLAIN ANALYZE SELECT * FROM shortest_path_astar('SELECT gid
		AS id, source::int4, target::int4, cost::double precision, rcost::double
		precision AS reverse_cost,x1,y1,x2,y2 FROM rtest',1,3,false,true);

		                           QUERY PLAN 
	--------------------------------------------------------------------------------
	Function Scan on shortest_path_astar  (cost=0.00..12.50 rows=1000 width=16) 
	(actual time=11.088..11.093 rows=5 loops=1)  Total runtime: 11.155 ms(2 rows)


the end.
