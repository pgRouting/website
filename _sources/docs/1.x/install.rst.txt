.. 
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share  
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _install:

Installation
===============================================================================

.. important::

	Only valid for pgRouting v1.x. For pgRouting v2.0 or higher see http://docs.pgrouting.org


.. note::

	For pgRouting version >= 1.0 RC1
	(Previous versions cannot be compiled without TSP and Driving Distance 
	functionality)
	
Requirements
-------------------------------------------------------------------------------

pgRouting Core - Shortest-Path algorithms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* C and C++ compilers
* Postgresql version >= 8.0
* PostGIS version >= 1.0
* The Boost Graph Library (BGL). Version >= 1.33 which contains the astar.hpp. 

pgRouting Extra - with TSP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* The Genetic Algorithm Utility Library (GAUL). See http://gaul.sourceforge.net

pgRouting Extra - with Driving Distance
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Computational Geometry Algorithms Library (CGAL) version >= 3.2. See http://www.cgal.org


Installation Instructions
-------------------------------------------------------------------------------

Step 1: Libraries installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compile and install PostgreSQL, PostGIS, Proj, GEOS, BGL and GAUL. Usually it is 
sufficient to run:

.. code-block:: bash

	# ./configure 
	# make 
	# make install


in corresponding directory.

If you have BGL installed but the version is less than 1.33.0, just download 
the astar.hpp file from http://www.boost.org/boost/graph/astar_search.hpp and 
copy it to ''BOOST_PATH/graph'' directory.

.. rubric:: For Traveling Salesperson Problem (optional)

The GAUL library should be compiled with --enable-slang=no option. Otherwise 
make sure you have slang.h installed in ''/usr/include''. For more details 
please refer to corresponding ''README'' or ''INSTALL'' file.

.. code-block:: bash

	# ./configure --disable-slang


.. rubric:: For Driving Distance (optional)

For CGAL, the compile option below can be used to create the library:

.. code-block:: bash

	# ./install_cgal --prefix=/usr --with-boost=n --without-autofind -ni /usr/bin/g++


**CGAL needs special treatment!**

After you install CGAL, you need to locate the directory with CGAL header files. 
In that directory you need to find ''config'' subdirectory.
This directory contains one or more subdirectories with platform-dependent information.

It may look like this, for example:

.. code-block:: bash

	/
	|
	+- usr
	  |
	  +- include
		 |
		 +- CGAL
		    |
		    +- config
		       |
		       +- i686_Linux-2.6_g++4.1.1
		       |  |
		       |  +- CGAL
		       |     |
		       |     +- compiler_config.h   <<< this is the file you need
		       |
		       +- msvc7
		       |  |
		       |  +- CGAL
		       |     |
		       |     +- compiler_config.h
		       |
		      etc...

 
All you need to do is to choose ''compiler_config.h'' for your platform and make 
a symlink or copy it to the main headers directory.

For example:

.. code-block:: bash

	# ln -s /usr/include/CGAL/config/i686_Linux-2.6_g++4.1.1/compiler_config.h /usr/include/CGAL/compiler_config.h


Step 2: Compiling the pgRouting library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. :ref:`Get pgRouting source <download>`
2. Change to pgRouting directory
3. Compile and install pgRouting

.. rubric:: For pgRouting core (required)

.. code-block:: bash

	cmake .
	make
	make install


.. rubric:: For pgRouting extras (optional)

.. code-block:: bash

	# Add Traveling Salesperson functionality:  -DWITH_TSP=ON
	# Add Driving Distance functionality     :  -DWITH_DD=ON

	cmake -DWITH_TSP=ON -DWITH_DD=ON .
	make
	make install


If your program compiles but you get an error like the following one:

.. code-block:: bash

	error while loading shared libraries: libgaul.so.0: cannot open 
	shared object file: No such file or directory


1. Add the library path (ie. /usr/local/pgsql/lib) to /etc/ld.co.conf
2. Run ldconfig


Maybe you installed PostgreSQL from Source-code, while compiling pgRouting you might get an error like

.. code-block:: bash

	Output directory for libraries is set to sh: pg_config: command not found 
	....
	....
	ERROR: could not access file "$libdir/librouting


Then you need to type at the shell-console:

.. code-block:: bash

	export PATH="$PATH:/usr/local/pgsql/bin"


presuming you installed PostgreSQL at /usr/local/pgsql/bin


Step 3: Create a routing database and load PostGIS and pgRouting functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Create a routing database and load PostGIS

.. code-block:: bash

	createdb -U postgres -E UNICODE routing
	createlang -U postgres plpgsql routing

	psql -U postgres -f /path/to/postgis/lwpostgis.sql routing
	psql -U postgres -f /path/to/postgis/spatial_ref_sys.sql routing


2. Add pgRouting core functions (required)

.. code-block:: bash

	psql -U postgres -f /usr/share/postlbs/routing_core.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_core_wrappers.sql routing


3. Add pgRouting extra functions (optional)

.. code-block:: bash

	# With TSP
	psql -U postgres -f /usr/share/postlbs/routing_tsp.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_tsp_wrappers.sql routing

	# With Driving Distance
	psql -U postgres -f /usr/share/postlbs/routing_dd.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_dd_wrappers.sql routing



