:Author: unknown (edited Daniel Kastl)
:License: Creative Commons

.. _build_windows:

================================================================
 Build pgRouting for Windows
================================================================

.. warning:: 

	This manual page is a checklist of what is needed to build a Windows binary 
	for pgRouting. It was written some time ago, so it might be outdated.


* **Environment**

	* MinGW 5.0.3 (install to E:/Build/mingw)
	* MSYS-1.0.11 (install to E:/Build/msys) http://www.baldanders.info/spiegel/remark/archives/000209.shtml
	* pthread-win32-2.7.0

Download prebuild-dll-2-7-0-release from ftp://sources.redhat.com/pub/pthreads-win32/

.. code-block:: bash

	cp /include/*.h /mingw/include
	cp /lib/libpthreadGC2.a /mingw/lib/libpthread.a


* **CMake**

Use latest version(2.4.7)

.. code-block:: bash

	#./configure --prefix=E:/Build/msys/1.0/local
	#make
	#make install


Or you can use Windows installer. 

* **Boost**
 
Use previous version (1.33.1) because of v2 problem 

.. code-block:: bash

	#bjam -sTOOLS=mingw "-sBUILD=release <runtime-link>static <threading>multi <native-wchar_t>on" --prefix=/e/Build/msys/1.0/local install 
	#mv /usr/local/include/boost-1_33_1/boost /usr/local/include/boost 
	#rmdir /usr/local/include/boost-1_33_1 


If you don't need CGAL library (driving distance functionality), 
pgRouting uses only Boost headers. 
So you needs download Boost headers(1.33.1 or later), and extract it.

* **Gaul**

Use latest version(0.1849-0)

.. code-block:: bash

	#./configure --enable-slang=no
	edit /util/Makefile
		DEFS = -DHAVE_CONFIG_H
		 -> DEFS = -DHAVE_CONFIG_H -DBUILDING_DLL
	edit /src/Makefile
		DEFS = -DHAVE_CONFIG_H
		 -> DEFS = -DHAVE_CONFIG_H -DBUILDING_DLL
		INCLUDES = -I../util/ -I../../util/
		 -> INCLUDES = -I../util -I../../util
	edit /tests/Makefile
		DEFS = -DHAVE_CONFIG_H
		 -> DEFS = -DHAVE_CONFIG_H -DBUILDING_DLL
		INCLUDES = -I../util/ -I../../util/ -I../src/ -I../../src/ -I/usr/include/slang/
		 -> INCLUDES = -I../util -I../../util -I../src -I../../src -I/usr/include/slang/
	#make
	#make install


* **CGAL**

Use latest version(3.2.1)

.. code-block:: bash

	#./install_cgal --prefix=/usr/local/cgal  --with-BOOST --BOOST_INCL_DIR=/usr/local/include --BOOST_LIB_DIR=/usr/local/lib --without-autofind -ni /mingw/bin/g++
	#cp /usr/local/cgal/include/CGAL/config/i686_MINGW32NT-5.1_g++-3.4.2/CGAL/compiler_config.h /usr/local/cgal/include/CGAL/compiler_config.h
	#cp /usr/local/cgal/lib/i686_MINGW32NT-5.1_g++-3.4.2/libCGAL.a /usr/local/cgal/lib/libCGAL.a
	#cp /usr/local/cgal/lib/i686_MINGW32NT-5.1_g++-3.4.2/libCGAL.so /usr/local/cgal/lib/libCGAL.so


* **pgRouting**

.. code-block:: bash

	#cmake -G"MSYS Makefiles" -DWITH_TSP=ON -DWITH_DD=ON .


* **Edit CMakeCache.txt**

.. code-block:: bash

	Boost_INCLUDE_DIR:PATH=Boost_INCLUDE_DIR-NOTFOUND
	 -> Boost_INCLUDE_DIR:PATH=E:/Build/msys/1.0/local/include

	CGAL_INCLUDE_DIR:PATH=CGAL_INCLUDE_DIR-NOTFOUND
	 -> CGAL_INCLUDE_DIR:PATH=E:/Build/msys/1.0/local/cgal/include

	CGAL_LIBRARIES:FILEPATH=CGAL_LIBRARIES-NOTFOUND
	 -> CGAL_LIBRARIES:FILEPATH=E:/Build/msys/1.0/local/cgal/lib

	GAUL_LIBRARIES:FILEPATH=GAUL_LIBRARIES-NOTFOUND
	 -> GAUL_LIBRARIES:FILEPATH=E:/Build/msys/1.0/local/lib


* **Edit core\src\CMakeFiles\routing.dir\flags.make**

Adjust <drive> (ie. "C") and <my path> to your system environment!

.. code-block:: bash

	C_FLAGS = -Drouting_EXPORTS -O2 -g \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/. \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/core \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/core/src \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/tsp \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/tsp/src \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/driving_distance \
		      -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/driving_distance/src \
		      -I/boost \
		      -I/<drive>/<my path>/msys/1.0/local/include \
		      -IC:/PROGRA~1/PostgreSQL/8.2/include/server \
		      -IC:/PROGRA~1/PostgreSQL/8.2/include/server/port/win32
	CXX_FLAGS = -Drouting_EXPORTS -O2 -g 
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/. \
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/core \
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/core/src \
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra \
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/tsp \
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/tsp/src \
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/driving_distance \
		        -I/<drive>/<my path>/msys/1.0/local/src/pgrouting/pgrouting/extra/driving_distance/src \
		        -I/boost \
		        -I/<drive>/<my path>/msys/1.0/local/include \
		        -IC:/PROGRA~1/PostgreSQL/8.2/include/server \
		        -IC:/PROGRA~1/PostgreSQL/8.2/include/server/port/win32


* **Edit core\src\CMakeFiles\routing.dir\build.make**

Adjust <drive> (ie. "C") and <my path> to your system environment!

.. code-block:: bash

	routing_EXTERNAL_OBJECTS = \


Edit last line as follows (not make clean!!!)

.. code-block:: bash

	cd /<drive>/<my path>/pgrouting/core/src && /<drive>/<my path>/mingw/bin/g++.exe $(routing_OBJECTS) $(routing_EXTERNAL_OBJECTS) \
		       -L/<drive>/<my path>/msys/1.0/local/lib \
		       -LC:/PROGRA~1/PostgreSQL/8.2/lib \
		       -lpostgres -shared -o ../../lib/librouting.dll \
		       -Wl,--out-implib,../../lib/librouting.dll.a \
		       -Wl,--major-image-version,0,--minor-image-version,0


* **Edit extra\tsp\src\CMakeFiles\routing_tsp.dir\flags.make**

.. code-block:: bash

	C_FLAGS = -Drouting_tsp_EXPORTS -g -O2 -IE:/Build/msys/1.0/local/include -I/E/Build/msys/1.0/local/src/pgrouting/pgrouting/core/src -IC:/PROGRA~1/PostgreSQL/8.2/include/server -IC:/PROGRA~1/PostgreSQL/8.2/include/server/port/win32
	CXX_FLAGS = -Drouting_tsp_EXPORTS -g -O2 -IE:/Build/msys/1.0/local/include -I/E/Build/msys/1.0/local/src/pgrouting/pgrouting/core/src -IC:/PROGRA~1/PostgreSQL/8.2/include/server -IC:/PROGRA~1/PostgreSQL/8.2/include/server/port/win32 -DBUILDING_DLL


* **Edit extra\tsp\src\CMakeFiles\routing_tsp.dir\build.make**

.. code-block:: bash

	routing_tsp_EXTERNAL_OBJECTS = \


Edit last line as follows

.. code-block:: bash

	cd /E/Build/msys/1.0/local/src/pgrouting/pgrouting/extra/tsp/src && /e/Build/mingw/bin/g++.exe $(routing_tsp_OBJECTS) $(routing_tsp_EXTERNAL_OBJECTS) -LE:/Build/msys/1.0/local/lib -LC:/PROGRA~1/PostgreSQL/8.2/lib -lpostgres -lgaul -lgaul_util -lm -shared -o ../../../lib/librouting_tsp.dll -Wl,--out-implib,../../../lib/librouting_tsp.dll.a -Wl,--major-image-version,0,--minor-image-version,0 -Wl,--export-all-symbols


* **Edit extra\driving_distance\src\CMakeFiles\routing_dd.dir\flags.make**

.. code-block:: bash

	C_FLAGS = -Drouting_dd_EXPORTS -g -O2 -IE:/Build/msys/1.0/local/include -I/E/Build/msys/1.0/local/src/pgrouting/pgrouting/core/src -I/E/Build/msys/1.0/local/cgal/include -IC:/PROGRA~1/PostgreSQL/8.2/include/server -IC:/PROGRA~1/PostgreSQL/8.2/include/server/port/win32
	CXX_FLAGS = -Drouting_dd_EXPORTS -g -O2 -IE:/Build/msys/1.0/local/include -I/E/Build/msys/1.0/local/src/pgrouting/pgrouting/core/src -I/E/Build/msys/1.0/local/cgal/include -IC:/PROGRA~1/PostgreSQL/8.2/include/server -IC:/PROGRA~1/PostgreSQL/8.2/include/server/port/win32


* **Edit extra\driving_distance\src\CMakeFiles\routing_dd.dir\build.make**

.. code-block:: bash

	routing_dd_EXTERNAL_OBJECTS = \


Edit last line as follows

.. code-block:: bash

	cd /E/Build/msys/1.0/local/src/pgrouting/pgrouting/extra/driving_distance/src && /e/Build/mingw/bin/g++.exe $(routing_dd_OBJECTS) $(routing_dd_EXTERNAL_OBJECTS) -LE:/Build/msys/1.0/local/lib -LE:/Build/msys/1.0/local/cgal/lib -LC:/PROGRA~1/PostgreSQL/8.2/lib -lCGAL -lpostgres -shared -o ../../../lib/librouting_dd.dll -Wl,--out-implib,../../../lib/librouting_dd.dll.a -Wl,--major-image-version,0,--minor-image-version,0


* **Build pgRouting**

.. code-block:: bash

	#make


