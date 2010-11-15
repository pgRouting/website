:Author: Daniel Kastl
:License: Creative Commons

.. _development:

===============
 Development
===============

.. toctree::
	:hidden:

	rfc/index
	
Mailing Lists
-------------

There are two mailing lists for pgRouting hosted on 
`OSGeo <http://www.osgeo.org>`_ mailing list server:

* **User** mailing list: http://lists.osgeo.org/mailman/listinfo/pgrouting-users
* **Developer** mailing list: http://lists.osgeo.org/mailman/listinfo/pgrouting-dev

For development and PSC related topics, please write to the developer mailing list.


Issue Tracker
--------------

Each repository has its own issue tracker provided by GitHub:

* **pgRouting**: https://github.com/pgRouting/pgrouting/issues
* **Website**: https://github.com/pgRouting/website/issues

Please, use these issue trackers for bug reports, feature requests or similar 
issues.
	

Git Repository
--------------

pgRouting hosts its source code on Github: https://github.com/pgRouting

There you can find repositories for pgRouting library itself as well as source 
code of the project website, osm2pgrouting, the workshop and others.

pgRouting repositories are public, but write access is limited. Send an email to 
project@pgrouting.org if you want to make changes to the website our if you want 
to contribute to the project.

If you're new to Git, find more information here:

* http://progit.org/book/
* http://www.kernel.org/pub/software/scm/git/docs/
* http://gitref.org/
* http://help.github.com/


pgRouting Library
^^^^^^^^^^^^^^^^^

To checkout the latest `pgRouting Library <https://github.com/pgRouting/pgrouting>`_ code base:

.. code-block:: bash

	git clone git://github.com/pgRouting/pgrouting.git pgrouting
	

If you plan to submit patches or changes, make a **fork** of the repository:

#. Make sure you've got a GitHub account and that you're logged in. 
#. Go to: https://github.com/pgRouting/pgrouting,  click the "fork" button. Now you should have your own version of the repository. 
#. Use the same commands as above, but you'll substitute your username like this:

.. code-block:: bash

	git clone git://github.com/<username>/pgrouting.git pgrouting
	
	
pgRouting Website
^^^^^^^^^^^^^^^^^

To checkout the latest `pgRouting Website <https://github.com/pgRouting/pgrouting>`_ code base:

.. code-block:: bash
 
	git clone git://github.com/pgRouting/website.git website
	

The pgRouting website is built with `Sphinx <http://sphinx.pocoo.org>`_. 	
If 	you want to make changes to the website, contribute content or make 
corrections, feel free to fork the repository and submit pull requests. Or 
send an email to project@pgrouting.org and we will give you commit rights
to the repository. 


How to contribute
-----------------

Find out more about how to contribute:

.. toctree::
	:maxdepth: 1

	docs/howto/contribute
	contributor

	
Request for Comments (RFC)
--------------------------

pgRouting :doc:`RFC's <rfc/index>` describes a major change in the technological 
underpinnings of pgRouting, major additions to functionality, or changes in the 
direction of the project.


.. _development-psc:

Project Steering Committe
-------------------------

Current members of the the Project Steering Committe are:

* Anton Patrushev (chair)
* Christian Gonzalez
* Ema Miyawaki
* Frédéric Junod
* Stephen Woodbridge
* Venkatesh Raghavan

For Project Steering Committe guideline see :doc:`RFC 01 <rfc/rfc-01>`.

 
