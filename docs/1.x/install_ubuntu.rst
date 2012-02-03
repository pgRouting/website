:Author: Daniel Kastl
:License: Creative Commons

.. _install_ubuntu:

================================================================
 Installation on Ubuntu
================================================================

.. note::
	
	Installation on Ubuntu 9.04 (with PostgreSQL 8.3) with TSP and Driving 
	Distance (Extras). (After had some troubles to install pgRouting on Ubuntu 
	8.10, it works again with Ubuntu 9.04.)


Install required packages
-------------------------

.. code-block:: bash

	sudo apt-get install build-essential git-core cmake
	sudo apt-get install postgresql-8.3-postgis postgresql-server-dev-8.3


If you're **not** planning to install CGAL from Ubuntu multiverse, you can use 
default Boost library from the repository. This will be version 1.34 at the moment. 

.. code-block:: bash

	sudo apt-get install libboost-graph-dev


* For Driving Distance

.. code-block:: bash

	sudo apt-get install libcgal*


.. note::

	If you install CGAL later from Ubuntu multiverse it will upgrade to Boost 
	1.35. This might cause troubles if you compiled pgRouting core already with 
	Boost 1.34.


* For TSP 

.. code-block:: bash

	wget http://downloads.sourceforge.net/gaul/gaul-devel-0.1849-0.tar.gz
	tar -xzf gaul-devel-0.1849-0.tar.gz
	cd gaul-devel-0.1849-0/
	./configure --disable-slang
	make
	sudo make install
	sudo ldconfig


Compile pgRouting core (with TSP and DD flag on)
------------------------------------------------

.. code-block:: bash

	git clone git://github.com/pgRouting/pgrouting.git pgrouting

	cd pgrouting/
	cmake -DWITH_TSP=ON -DWITH_DD=ON .
	make
	sudo make install


Setup PostgreSQL
----------------

Set local database connections to "trust" in "pg_hba.conf" to be able to work 
with PostgreSQL as user "postgres". Then restart PostgreSQL.

.. code-block:: bash

	sudo gedit /etc/postgresql/8.3/main/pg_hba.conf 
	sudo /etc/init.d/postgresql-8.3 restart


Create routing database
-----------------------

.. code-block:: bash

	createdb -U postgres routing
	createlang -U postgres plpgsql routing


* Add PostGIS functions

.. code-block:: bash

	psql -U postgres -f /usr/share/postgresql-8.3-postgis/lwpostgis.sql routing
	psql -U postgres -f /usr/share/postgresql-8.3-postgis/spatial_ref_sys.sql routing


* Add pgRouting functions

.. code-block:: bash

	psql -U postgres -f /usr/share/postlbs/routing_core.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_core_wrappers.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_topology.sql routing


* Add TSP functions

.. code-block:: bash

	psql -U postgres -f /usr/share/postlbs/routing_tsp.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_tsp_wrappers.sql routing


* Add Driving Distance functions

.. code-block:: bash

	psql -U postgres -f /usr/share/postlbs/routing_dd.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_dd_wrappers.sql routing




