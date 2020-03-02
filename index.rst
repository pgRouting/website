..
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share
    Alike 3.0 License: https://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _home:

pgRouting Project
===============================================================================

.. image:: _themes/pgrouting/static/img/pgrouting.png
	:alt: pgRouting Project
	:align: right


pgRouting extends the `PostGIS <https://www.postgis.net>`_ / `PostgreSQL <https://www.postgresql.org>`_ geospatial database to provide geospatial routing functionality.

Advantages of the database routing approach are:

* Data and attributes can be modified by many clients, like `QGIS <https://www.qgis.org>`_ through JDBC, ODBC, or directly using Pl/pgSQL. The clients can either be PCs or mobile devices.
* Data changes can be reflected instantaneously through the routing engine. There is no need for precalculation.
* The "cost" parameter can be dynamically calculated through SQL and its value can come from multiple fields or tables.

..
	.. note::

		It has been a long way but finally we made it: **pgRouting got on a new version!**
		For more details see:

		* New documentation: https://docs.pgrouting.org
		* New workshop: https://workshop.pgrouting.org

		Thanks to everyone who makes the new release possible!
		If you want to contribute to the project financially, any :doc:`sponsorship or donation <donate>` is of great help.


Core Features
-------------------------------------------------------------------------------

pgRouting library contains following features:

* All Pairs Shortest Path, Johnson’s Algorithm
* All Pairs Shortest Path, Floyd-Warshall Algorithm
* Shortest Path A*
* Bi-directional Dijkstra Shortest Path
* Bi-directional A* Shortest Path
* Shortest Path Dijkstra
* Driving Distance
* K-Shortest Path, Multiple Alternative Paths
* K-Dijkstra, One to Many Shortest Path
* Traveling Sales Person
* Turn Restriction Shortest Path (TRSP)

Learn more about using pgRouting in your application by reading the :doc:`documentation <documentation>`.


pgRouting is Open Source
-------------------------------------------------------------------------------

pgRouting is available under the GPLv2 license and is supported by a growing community of individuals, businesses and organizations.

.. toctree::
    :hidden:

    documentation
    download
    support
    development
    gallery
    docs/tutorials
    404
