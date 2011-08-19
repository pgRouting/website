:Author: Daniel Kastl
:License: Creative Commons

.. _sql:

================================================================
 Collection of useful SQL commands
================================================================

JOIN two tables
---------------

.. code-block:: sql

	SELECT 
		count(gid) AS links, 
		sum(a.cost) AS cost, 
		sum(length) AS length

	FROM shortest_path(
		'SELECT gid AS id, 
			source::integer, 
			target::integer, 
			length::double precision AS cost 
		FROM <TABLE A> 
		WHERE <...>, 
		false, 
		false
	) AS a LEFT JOIN <TABLE B> ON (a.gid = gid)


.. note::

	If you have some SQL commands to share, that are useful for pgRouting, 
	send an email to project@pgrouting.org for further informations.


