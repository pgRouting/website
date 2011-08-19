:Author: Daniel Kastl
:License: Creative Commons

.. _install_centos:

================================================================
 Installation on CentOS
================================================================

.. note::
	
	This install manual was written for CentOS 5.1
	
	
Install required packages
-------------------------

.. code-block:: bash

	sudo yum install git-core boost-devel gcc-c++
	sudo yum install postgresql-server postgresql-devel flex


Compile proj4 & geos
--------------------

* proj4

.. code-block:: bash

	wget ftp://ftp.remotesensing.org/proj/proj-4.6.0.tar.gz
	tar -zxvf proj-4.6.0.tar.gz
	cd proj-4.6.0
	./configure
	sudo make install


* geos

.. code-block:: bash

	cd ..
	wget http://geos.refractions.net/downloads/geos-3.0.0.tar.bz2
	tar -jxvf geos-3.0.0.tar.bz2
	cd geos-3.0.0
	./configure
	sudo make install


* Add lib path to ld.so.conf file

.. code-block:: bash

	sudo vi /etc/ld.so.conf


.. code-block:: bash

	# add this line
	/usr/local/lib


.. code-block:: bash

	sudo /sbin/ldconfig


Compile PostGIS
---------------

.. code-block:: bash

	cd ..
	Wget http://www.postgis.org/download/postgis-1.3.3.tar.gz
	tar -zxvf postgis-1.3.3.tar.gz
	cd postgis-1.3.3
	./configure
	sudo make install


Setup PostgreSQL
----------------

Set local database connections to "trust" in "pg_hba.conf" to be able to work 
with PostgreSQL as user "postgres". Then restart PostgreSQL. 

.. code-block:: bash

	sudo vi /var/lib/pgsql/data/pg_hba.conf


.. code-block:: bash

	# "local" is for Unix domain socket connections only
	#local   all         all                               ident sameuser
	local   all     all                                     trust


.. code-block:: bash

	sudo /etc/init.d/postgresql restart


Compile cmake
-------------

.. code-block:: bash

	cd ..
	wget http://www.cmake.org/files/v2.4/cmake-2.4.8.tar.gz
	tar -zxvf cmake-2.4.8.tar.gz
	cd cmake-2.4.8
	./configure
	gmake


Compile pgRouting
-----------------

.. code-block:: bash

	git clone git://github.com/pgRouting/pgrouting.git pgrouting
	cd pgrouting/
	sudo [cmake_dir]/bin/cmake .
	sudo make install


Please replace [cmake_dir] with the path which cmake is installed ex)/home/hoge/cmake-2.4.8


Create routing database
-----------------------

.. code-block:: bash

	createdb -U postgres routing
	createlang -U postgres plpgsql routing

	# Add PostGIS functions
	psql -U postgres -f /usr/share/lwpostgis.sql routing
	psql -U postgres -f /usr/share/spatial_ref_sys.sql routing

	# Add core pgRouting functions
	psql -U postgres -f /usr/share/postlbs/routing_core.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_core_wrappers.sql routing
	psql -U postgres -f /usr/share/postlbs/routing_topology.sql routing


