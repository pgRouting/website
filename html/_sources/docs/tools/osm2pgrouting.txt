.. 
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share  
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _osm2pgrouting:

osm2pgrouting - Import OSM data into pgRouting Database
===============================================================================

.. important::

	osm2pgrouting currently doesn't support pgRouting v2.0.0


Easily import OpenStreetMap data into a pgRouting database using osm2pgrouting tool.

osm2pgrouting was primarily written by Daniel Wendt and is now hosted on the pgRouting project site.


Features
-------------------------------------------------------------------------------

* Uses XML configuration file to select road types and classes to import
* Creates types and classes tables, which can help to create sophisticated cost functions


Requirements
-------------------------------------------------------------------------------

If you already [wiki:1.x/InstallationManual installed pgRouting], you should have all required libraries/packages.

* PostgreSQL
* PostGIS
* pgRouting

Currently osm2pgrouting is only tested on Linux distributions. 


How to install
-------------------------------------------------------------------------------

Download the latest version from `osm2pgrouting GitHub repository <https://github.com/pgRouting/osm2pgrouting>`_ and extract the file:

Then compile:

.. code-block:: bash 

	cd /path/to/osm2pgrouting
	make


If you get an error like

.. code-block:: bash 

	src/Export2DB.h:25:22: error: libpq-fe.h: Datei oder Verzeichnis nicht gefunden
	src/Export2DB.h:84: error: ISO C++ forbids declaration of ‘PGconn’ with no type
	src/Export2DB.h:84: error: expected ‘;’ before ‘*’ token
	src/Export2DB.cpp: In constructor ‘Export2DB::Export2DB(std::string,
	std::string, std::string, std::string, std::string)’: 
	... etc etc.

just change src/Export2DB.h and set the path to libpq-fe.h statically.


How to use
-------------------------------------------------------------------------------

Start the program like this:

.. code-block:: bash 

	./osm2pgrouting -file your-OSM-XML-File.osm \
					-conf mapconfig.xml \
					-dbname routing \
					-user postgres \
					-clean


all available parameters are:

.. code-block:: bash 

	required: 
	-file <file>  -- name of your osm xml file
	-dbname <dbname> -- name of your database
	-user <user> -- name of the user, which have write access to the database
	-conf <file> -- name of your configuration xml file
	optional:
	-host <host>  -- host of your postgresql database (default: 127.0.0.1)
	-port <port> -- port of your database (default: 5432)
	-passwd <passwd> --  password for database access
	-clean -- drop peviously created tables


.. note::

	There was a patch attached to some Wiki page on the previous TRAC website. 	You can download the patch from here: :download:`osm2pgrouting.patch`
