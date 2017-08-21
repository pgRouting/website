.. 
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share  
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _darp:

Dial-a-ride Problem Solver (DARP)
===============================================================================

.. important::

	Only valid for pgRouting v1.x. For pgRouting v2.0 or higher see http://docs.pgrouting.org


.. warning::

	DARP function is currently only available in `"darp" branch 
	<https://github.com/pgRouting/pgrouting/tree/darp>`_ 
	

In the Dial-a-Ride problem (DARP), customers request transportation from an 
operator. A request consists of a specified pickup location and destination 
location along with a desired departure or arrival time and capacity demand. 
The aim of DARP is to minimize transportation cost while satisfying customer 
service level constraints (Quality of Service). 


Function:
-------------------------------------------------------------------------------

The darp function has the following declaration:

.. code-block:: sql

	CREATE OR REPLACE FUNCTION darp(
						orders_sql text, 
						vehicles_sql text, 
						distance_sql text, 
						depot_id integer, 
						depot_point_id integer, 
						penalties_sql text)
        RETURNS SETOF itinerary


Where itinerary is:

.. code-block:: sql

	CREATE TYPE itinerary AS (id integer, order_id integer, 
			vehicle_id integer, point integer, at timestamp with time zone);
			
			
Itinerary is used to represent a schedule entry and contains the following columns:

* id: id used for sorting
* order_id: id of visited order
* vehicle_id: vehicle to serve this order
* point: pick up or drop off point of order to visit
* at: estimated time


Arguments:
-------------------------------------------------------------------------------

**orders_sql**: see "Orders query"

**vehicles_sql**: see "Vehicles query"

**distance_sql**: see "Distances query"

**depot_id**: unique depot id

**depot_point_id**: depot location id (same as in distances)

**penalties_sql**: see "Penalties query"

The function requires 4 queries with data selected in a proper way and it
returns a set of itineraries.


Orders query
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Orders query must return the following fields:

* order_id (integer): unique order id
* size (double precision): order size
* pu_time (timestamp with time zone): desired pick up time
* do_time (timestamp with time zone): desired drop off time
* pu_lt (interval): lower boundary of pick up time window
* do_lt (interval): lower boundary of drop off window
* pu_ut (interval): upper boundary of pick up time window
* do_ut (interval): upper boundary of drop off time window
* from_point (integer): pick up location id (same as in distances)
* to_point (integer): drop off location id (same as in distances)


Vehicles query
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Vehicles query must return the following fields:

* vehicle_id (integer): unique vehicle id
* capacity (double precision): vehicle capacity
* depot (integer): depot id


Distances query
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Distances query must return the following fields:

* from_order (integer): unique order id
* to_order (integer): unique order id
* from_point (integer): pick up location id
* to_point (integer): drop off location id
* value (double precision): distance (in time units)


Penalties query 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Penalties query is optional and can be null. The query must return 1 row with 
8 fields, w1 through w8 with integer values.

Penalties have following meanings:

* w1: driving time violation
* w2: car capacity violation
* w3: excess passenger ride time violation
* w4: passanger waiting time violation
* w5: route duration violation
* w6: time window violation
* w7: passenger ride time violation
* w8: route time violation

Output:
------------------------------------------------------------------------------- 

.. note::

	TBD
	

Examples:
-------------------------------------------------------------------------------

.. note::

	TBD
	



