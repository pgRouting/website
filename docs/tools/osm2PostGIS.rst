:Author: Daniel Kastl
:License: Creative Commons

.. _osm2postgis:

================================================
 OSM2PostGIS - Import OSM data to PostGIS
================================================

OSM2PostGIS is a new tool for importing data from the OpenStreetMap XML (.osm) 
files to a PostgreSQL database with the correct geometry projection, spatial 
reference (PostGIS), and directed topology for routing (pgRouting). Routing cost 
calculation is aware of one-way roads, speed limits, etc.

The project is currently at an early development phase. It's best suited for 
Java developers who want to experiment with pgRouting, and who can modify the 
immature code to their needs:

http://osm2postgis.sourceforge.net/

There is more information in the README file inside the package.

You can leave your feature requests in the project tracker on the SourceForge 
site. Here's a direct link: http://sourceforge.net/tracker/?group_id=300868&atid=1268843
