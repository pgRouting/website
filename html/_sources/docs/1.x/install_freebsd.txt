.. 
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share  
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _install_freebsd:

Installation on FreeBSD
===============================================================================

.. important::

	Only valid for pgRouting v1.x. For pgRouting v2.0 or higher see http://docs.pgrouting.org


Here's how I managed to install pgrouting 1.0.3 on FreeBSD together with TSP and DD.

* FreeBSD version: 8.1 (amd64)
* PostgreSQL version: 9.0.1 (installed from FreeBSD ports)
* PostGIS version: 1.5.1 (installed from FreeBSD ports)

1. Install devel/cmake port if not already installed. I installed version 2.8.2.

2. Install devel/boost-libs port if not already installed. I installed version 1.43.0

3. Install (a modified) devel/gaul port. I installed version 0.1849.0_2.

pgRouting docs suggest installing gaul without slang support. So before you 
install the port, change the port Makefile, commenting out the LIB_DEPENDS line 
which pulls in libslang, and add a line to disable slang support:

.. code-block:: bash

	#LIB_DEPENDS=    slang.2:${PORTSDIR}/devel/libslang2
	CONFIGURE_ARGS+= --disable-slang


After installing gaul you need to modify one header file, otherwise you can't 
compile pgrouting later. In file /usr/local/include/gaul/gaul_util.h, add this 
line after line 177:

.. code-block:: bash

	typedef short _Bool;


End result should look like:

.. code-block:: bash

	175: #if HAVE__BOOL != 1
	176: typedef short _Bool;
	177: #endif
	178: typedef short _Bool;


This is certainly not a proper fix, but it seems that for some reason _Bool is 
not getting defined on FreeBSD and this band-aid fix allows pgrouting 
compilation to succeed. Someone more versed in software development on FreeBSD 
can probably suggest a proper fix.

4. Install the math/cgal port. I installed version 3.6.1. This pulls in a large chunk of x.org...

5. Make some modifications to the source.

	5.1. In following files:

.. code-block:: bash

	core/src/dijkstra.c 
	core/src/astar.c 
	core/src/shooting_star.c 
	extra/driving_distance/src/alpha.c
	extra/driving_distance/src/drivedist.c
	
	
you need to add a line '#include "catalog/pg_type.h"' after line 
'#include "executor/spi.h"'. This is probably only necessary with PostgreSQL 8.4
and newer.

	5.2. In following files:

.. code-block:: bash

	core/src/shooting_star_relax.hpp
	core/src/edge_visitors.hpp


you need to change the path to include file property_map.hpp so the line reads 
like this:

.. code-block:: bash

	#include <boost/property_map/property_map.hpp>


This is probably not necessary with older versions of boost-libs, but I'm not 
sure which version introduces the need for this change.

	5.3. In file core/src/shooting_star_boost_wrapper.cpp you need to change the path to include file vector_property_map.hpp in a way not unlike the previous change:

.. code-block:: bash

	#include <boost/property_map/vector_property_map.hpp>


	5.4. In file CMakeLists.txt, you need to add "-frounding-math" to variables CMAKE_C_FLAGS and CMAKE_CXX_FLAGS, otherwise you'll run into problems later when trying to add DD functions to the database. The end result should look like this:

.. code-block:: bash

	SET(CMAKE_C_FLAGS "-O2 -g -frounding-math")
	SET(CMAKE_CXX_FLAGS "-O2 -g -frounding-math")


This change is probably only necessary on 64bit systems, as discussed in ticket #204.

	5.5. Also in CMakeLists.txt, you might want to change the variable SQL_INSTALL_PATH to point to /usr/local/share/postlbs instead of /usr/share/postlbs, since the former is more in line with FreeBSD's standard directory layout.

6. After making all these changes you can proceed to compile pgRouting and create a routing-enabled database as discussed in the installation manual.
