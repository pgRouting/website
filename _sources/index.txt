.. 
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share  
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _home:

pgRouting Project
===============================================================================

.. image:: _themes/pgrouting/static/img/pgrouting.png
	:alt: pgRouting Project
	:align: right


pgRouting extends the `PostGIS <http://www.postgis.net>`_ / `PostgreSQL <http://www.postgresql.org>`_ geospatial database to provide geospatial routing functionality.

Advantages of the database routing approach are:

* Data and attributes can be modified by many clients, like `QGIS <http://www.qgis.org>`_ and `uDig <http://udig.refractions.net>`_ through JDBC, ODBC, or directly using Pl/pgSQL. The clients can either be PCs or mobile devices.
* Data changes can be reflected instantaneously through the routing engine. There is no need for precalculation.
* The "cost" parameter can be dynamically calculated through SQL and its value can come from multiple fields or tables.

.. note::

	It has been a long way but finally we made it: **pgRouting got on a new version!**
	For more details see:

	* New documentation: http://docs.pgrouting.org
	* New workshop: http://workshop.pgrouting.org

	Thanks to everyone who makes the new release possible!	
	If you want to contribute to the project financially, any :doc:`sponsorship or donation <donate>` is of great help. 


Core Features
-------------------------------------------------------------------------------

pgRouting provides functions for:

* All Pairs Shortest Path, Johnson’s Algorithm :sup:`[1]`
* All Pairs Shortest Path, Floyd-Warshall Algorithm :sup:`[1]`
* Shortest Path A*
* Bi-directional Dijkstra Shortest Path :sup:`[1]`
* Bi-directional A* Shortest Path :sup:`[1]`
* Shortest Path Dijkstra
* Driving Distance
* K-Shortest Path, Multiple Alternative Paths :sup:`[1]`
* K-Dijkstra, One to Many Shortest Path :sup:`[1]`
* Traveling Sales Person
* Turn Restriction Shortest Path (TRSP) :sup:`[1]`
* Shortest Path Shooting Star :sup:`[2]`

Learn more about using pgRouting in your application by reading the :doc:`documentation <documentation>`.

| :sup:`[1]` **New** in pgRouting 2.0.0
| :sup:`[2]` Discontinued in pgRouting 2.0.0


pgRouting is Open Source
-------------------------------------------------------------------------------

pgRouting is available under the GPLv2 license and is supported by a growing community of individuals, businesses and organizations.

.. toctree::
	:hidden:

	documentation
	download
	support
	development

