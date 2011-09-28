:Author: Daniel Kastl
:License: Creative Commons

.. _home:

.. 
	**pgRouting got a new website!**
	
	It has been a long way but finally we made it: pgRouting got a new website!
	This also includes several other important changes:
	
	* The source repository moved to GitHub: https://github.com/pgRouting/ 
	* The mailing lists run on OSGeo mailing list server
	* The file downloads are hosted on OSGeo server
	* The forum was closed due to spam and we recommend http://gis.stackexchange.com instead (we kept a cached copy as a reference, see :doc:`support`)
	
	We hope the migration doesn't produce a lot of confusion but makes it easier 
	to participate in the project and make development faster and better!
	

pgRouting Project
=================

.. image:: _themes/pgrouting/static/img/pgrouting.png
	:scale: 100%
	:alt: pgRouting Project
	:align: right


pgRouting extends the `PostGIS <http://www.postgis.org>`_ / `PostgreSQL <http://www.postgresql.org>`_ geospatial database to provide geospatial routing functionality.

Advantages of the database routing approach are:

* Data and attributes can be modified by many clients, like `Quantum GIS <qgis_overview.html>`_ and `uDig <udig_overview.html>`_ through JDBC, ODBC, or directly using Pl/pgSQL. The clients can either be PCs or mobile devices.
* Data changes can be reflected instantaneously through the routing engine. There is no need for precalculation.
* The "cost" parameter can be dynamically calculated through SQL and its value can come from multiple fields or tables.

.. 
	.. image:: img/screenshot_pgadmin.png
	  :scale: 60%
	  :alt: pgRouting query in pgAdmin III
	  :align: center

Core Features
-------------

pgRouting provides functions for:

* Shortest Path Dijkstra: routing algorithm without heuristics
* Shortest Path A-Star: routing for large datasets (with heuristics)
* Shortest Path Shooting-Star: routing with turn restrictions (with heuristics)
* Traveling Salesperson Problem (TSP)
* Driving Distance calculation (Isolines)

Learn more about using pgRouting in your application by reading the :doc:`documentation <documentation>`.

pgRouting is Open Source
------------------------

pgRouting is available under the GPLv2 license and is supported by a growing
community of individuals, businesses and organizations.

.. toctree::
	:hidden:

	documentation
	download
	support
	development



