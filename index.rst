:Author: Daniel Kastl
:License: Creative Commons

.. _home:

Welcome to pgRouting Project
============================

pgRouting extends the `PostGIS <postgis_overview.html>`_/`PostgreSQL <http://www.postgresql.org>`_ geospatial database to provide geospatial routing functionality.

Advantages of the database routing approach are:

* Data and attributes can be modified by many clients, like `Quantum GIS <qgis_overview.html>`_ and `uDig <udig_overview.html>`_ through JDBC, ODBC, or directly using Pl/pgSQL. The clients can either be PCs or mobile devices.
* Data changes can be reflected instantaneously through the routing engine. There is no need for precalculation.
* The "cost" parameter can be dynamically calculated through SQL and its value can come from multiple fields or tables.

Core Features
-------------

pgRouting provides functions for:

* Shortest Path Dikstra: routing algorithm without heuristics
* Shortest Path A-Star: routing for large datasets (with heuristics)
* Shortest Path Shooting-Star: routing with turn restrictions (with heuristics)
* Traveling Salesperson Problem (TSP)
* Driving Distance calculation (Isolines)

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

..
	Indices and tables
	==================

	* :ref:`genindex`
	* :ref:`modindex`
	* :ref:`search`

