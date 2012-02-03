:Author: Kai Behncke (edited by Daniel Kastl)
:License: Creative Commons

.. _shapefiles:

================================================================
 Working with Shapefiles
================================================================

Nearly a standard are the well-known ESRI-Shapefiles that consist of -at least - 
a .dbf-File, a .shp-File and a .shx-File.

These files mostly have already a topology.

If you have installed postgresql a tool called "shp2pgsql" will exist on your 
computer. You can transform your data into the sql-format doing:

.. code-block:: bash 

	shp2pgsql /home/mydata/roads.shp newtable >/home/mydata/roads.sql“


For test-purposes you can take data from British Columbia (nrn_rrn_bc_shp_en.zip).
You get it from the `GeoBase <http://geobase.ca/geobase/en/data/nrn/index.html>`_ 
"National Road Network" dataset.

Please be aware: Don`t use OpenStreetMap-Shapefiles, as thew will create some 
problems because of their structure.

That sql-file that was created by shp2pgsql you need to bring in your routing-database.

