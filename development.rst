..
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share
    Alike 3.0 License: https://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

Development
===============================================================================

Project Steering Committee
-------------------------------------------------------------------------------

Current members of the the Project Steering Committee are:

* Ashish Kumar
  * OSGeo Charter member since 2021
  * Ex-Google summer of code student
  * Google summer of code mentor and administrator
  * Co-leader of vrpRouting (vrp = vehicle routing problems)

* Daniel Kastl

  * OSGeo Charter member since 2013
  * Google summer of code mentor
  * Founder of pgRouting organization
  * In charge of financial affairs

* Iosefa Percival

  * Google summer of code mentor
  * Co-leader of pgRouting Docker
  * Co-leader of vrpRouting

* Ko Nagase

  * OSGeo Charter member since 2015
  * Co-leader of pgRouting Docker
  * Co-leader of osm2pgRouting

* Rajat Shinde

  * OSGeo Charter member since 2018
  * Ex-Google summer of code student
  * Google summer of code mentor and administrator
  * Leader of pgRouting's workshop

* Regina Obe

  * OSGeo Charter member since 2009
  * Google summer of code mentor
  * Windows expert on pgRouting's products

* Vicky Vergara

  * OSGeo Charter member since 2015
  * Google summer of code mentor
  * Leader of pgRouting
  * Co-leader of osm2pgRouting

For the Project Steering Committee guideline, see :doc:`RFC 01 <rfc/rfc-01>`.

Git Repository
-------------------------------------------------------------------------------

pgRouting hosts its source code on Github: https://github.com/pgRouting

There you can find repositories for pgRouting library itself as well as source code of the project website, osm2pgrouting, the workshop and others.
pgRouting repositories are public, but write access is limited. Send an email to project@pgrouting.org if you want to make changes to the website our if you want to contribute to the project.
If you're new to Git, find more information here:

* https://help.github.com/

pgRouting Library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To checkout the latest `pgRouting Website <https://github.com/pgRouting/pgrouting>`_ code base:

::

  git clone git://github.com/pgRouting/website.git website


The pgRouting website is built with `Sphinx <https://www.sphinx-doc.org/>`_. If you want to make changes to the website, contribute content or make corrections, feel free to fork the repository and submit pull requests. Or send an email to project@pgrouting.org and we will give you commit rights to the repository.



Translations
-------------------------------------------------------------------------------

Translations of documentation and workshop are managed with Weblate:

https://weblate.osgeo.org/projects/pgrouting/

If you want to help with translations, `Create an account <https://id.osgeo.org/>`__.


How to contribute
-------------------------------------------------------------------------------

Find out more about how to contribute:

* :doc:`docs/howto/contribute`
* :doc:`donate`


Request for Comments (RFC)
-------------------------------------------------------------------------------

pgRouting :doc:`RFC's <rfc/index>` describes a major change in the technological underpinnings of pgRouting, major additions to functionality, or changes in the direction of the project.

Feedback
===============================================================================

Mailing Lists
-------------------------------------------------------------------------------

There are two mailing lists for pgRouting hosted on `OSGeo <https://www.osgeo.org>`_ mailing list server:

* **User** mailing list: https://lists.osgeo.org/mailman/listinfo/pgrouting-users
* **Developer** mailing list: https://lists.osgeo.org/mailman/listinfo/pgrouting-dev

For development and PSC related topics, please write to the developer mailing list.


Issue Tracker
-------------------------------------------------------------------------------

Each repository has its own issue tracker provided by GitHub:

* **pgRouting**: https://github.com/pgRouting/pgrouting/issues
* **Website**: https://github.com/pgRouting/website/issues

Please, use these issue trackers for bug reports, feature requests or similar issues.

Discussions
-------------------------------------------------------------------------------

Discussions take place at

* Live at **gittter** https://app.gitter.im/#/room/#pgrouting:osgeo.org
* **github** https://github.com/pgRouting/pgrouting/discussions
* Meetings at **OSGeo** https://meet.osgeo.org/pgrouting

.. toctree::
   :hidden:

   rfc/index

