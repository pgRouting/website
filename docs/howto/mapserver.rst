:Author: Camptocamp/ pgDijkstra (edited by Daniel Kastl)
:License: Creative Commons

.. _route_mapserver:

================================================================
 How to show the route with Mapserver
================================================================

The shortest path function (i.e. "dijkstra_sp()") can be used inside 
`Mapserver <http://mapserver.org>`_ to draw the shortest path directly:

.. code-block:: bash

	LAYER
		NAME "europe"
		TYPE LINE

		STATUS DEFAULT
		CONNECTIONTYPE postgis
		    CONNECTION "user=postgres host=localhost dbname=geo"
		    DATA "the_geom from (SELECT the_geom, gid from
		      dijkstra_sp('bahnlinien_europa_polyline', 2629, 10171)) AS
		      foo using unique gid using srid=-1"

		TEMPLATE "t"
		CLASS
		  NAME "0"
		  STYLE
		    SYMBOL "circle"
		    SIZE 10
		    COLOR 50 50 100
		  END
		END
	END


Notice however, that this function will be called at each map display, 
computing the shortest path every time.

A better approach would be to generate the shortest path in a temporary table.
