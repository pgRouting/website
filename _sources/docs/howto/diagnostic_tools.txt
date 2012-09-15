:Author: Stephen Woodbrifdge (edited by Daniel Kastl)
:License: Creative Commons

.. _diagnostics:

================================================================
 Diagnostic Tools
================================================================

pgRouting is a large black box to most users. When things are working nobody has 
a problem, but when it is not working as expected what do you do? One of the 
most common problems is issues with the routing data. I built the following 
tools that aew easy to implement and use and can reveal a lot about your data. 
I assume that you are working with OpenLayers as you map viewer and we will 
build two visualization tools.

#. View just the streets in the routing database
#. View intersections and detect deadends
  
You can see these tools in action at http://imaptools.com/leaddog/routing/dd.html
Zoom into a city, open the layerswitcher and select "Just the Streets" and "Dead Ends".

1. View just the streets in the routing database
------------------------------------------------

Create a mapfile that displays the street segments from the routing 
database and add this as an optional base layer. You might want to add 
color oneway streets a different color, but in general keep the display 
simple and probably single pixel lines. You might label the segments 
with their UID so you can go back to the database and query them in detail.

.. code-block:: bash

	LAYER
		NAME "Streets"
		STATUS DEFAULT
		TYPE LINE
		CONNECTIONTYPE postgis
		CONNECTION "user=postgres dbname=routing host=centos port=5432"
		DATA "the_geom from (select gid, the_geom from st) as foo
			  using SRID=4326 using unique gid"
		LABELITEM "gid"
		MAXLABELSCALEDENOM 25000
		CLASS
		  STYLE
			COLOR 87 87 87
			WIDTH 1
		  END
		  LABEL
			FONT "arial"
			TYPE TRUETYPE
			ANGLE AUTO
			SIZE 7
			COLOR 1 1 1
		  END
		END
		END

		symbol
		name "one_way_from"
		type truetype
		font arial-bold
		character ">"
		gap -40
		end

		symbol
		name "one_way_to"
		type truetype
		font arial-bold
		character "<"
		gap -40
		end


		LAYER
		NAME "One_Way_Arrows"
		STATUS DEFAULT
		TYPE LINE
		MAXSCALEDENOM 25000
		CONNECTIONTYPE postgis
		CONNECTION "user=postgres dbname=routing host=centos port=5432"
		DATA "the_geom from (select gid, one_way, the_geom from st
			  where one_way is not null and length(one_way)>0) as foo
			  using SRID=4326 using unique gid"
		CLASSITEM 'one_way'
		CLASS
		  NAME 'From'
		  EXPRESSION "FT"
		  STYLE
			SYMBOL "one_way_from"
			COLOR 80 80 80
			SIZE 8
		  END
		END
		CLASS
		  NAME 'To'
		  EXPRESSION "TF"
		  STYLE
			SYMBOL "one_way_to"
			COLOR 80 80 80
			SIZE 8
		  END
		END
	END


2. View intersections and detect deadends
-----------------------------------------

Add a column cnt integer to the vertices_tmp table and update it with the count 
of segments that reference that node. Maybe something like this:

.. code-block:: sql

	alter table vertices_tmp add column cnt integer;
	update vertices_tmp set cnt=0;
	update vertices_tmp set cnt=cnt+1 where streets.source=id;
	update vertices_tmp set cnt=cnt+1 where streets.target=id;


Now create a mapfile layer for points and display the vertices_tmp

.. code-block:: bash

	LAYER
	   NAME "deadends"
	   TYPE POINT
	   CONNECTIONTYPE "postgis"
	   CONNECTION ...
	   DATA ...
	   CLASSEXPRESSION "cnt"
	   CLASS
		 EXPRESSION "cnt=1"
		 STYLE
		   SYMBOL "circle"
		   SIZE 5
		   COLOR 255 0 0
		 END
	   END
	   CLASS
		 EXPRESSION "cnt>2"
		 STYLE
		   SYMBOL "circle"
		   SIZE 3
		   COLOR 0 255 0
		 END
	   END
	END


This will display red dots at dead ends and green dots as good connections be 
segments. If you have a lot of red dots between segments that should be joined, 
you probably need to rebuild your vertices_tmp table with a larger tolerance.

It is very hard to debug a large black box like a router without having some 
tools that can give you some better insight as to what is going on.

