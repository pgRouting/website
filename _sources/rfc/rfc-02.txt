.. 
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share  
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _rfc-02:

RFC 02: [done] Migrate pgRouting to OSGeo Infrastructure
===============================================================================

.. list-table::
   :widths: 15 85

   * - Date:
     - 2010/04/01
   * - Author:
     - Daniel Kastl
   * - Contact:
     - daniel at georepublic.de
   * - Last Edited:
     - 2010/11/20
   * - Status: 
     - Adopted (2010/04/18)

Motivation to migrate pgRouting infrastructure
********************************************************************************

* All maintenance work for mailing list, SVN repository, TRAC website is under the responsibility of Orkney at the moment.
* pgRouting would like to establish a new mailing list "pgrouting-dev" without the hassle of maintaining a mail server.
* TRAC website faces SPAM problems from time to time and there is a large number of invalid users that have been subscribed by spam bots.
* pgRouting has close relation to OSGeo and other OSGeo projects. It's part of OSGeo LiveDVD and OSGeo Labs and might aim for incubation someday.
* OSGeo infrastructure provides backups and file downloads (ie. for releases)
* Project team is small and wants to minimize work for administration and maintenance to have more time for the project

What is affected by the migration?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Mailing lists ( http://lists.postlbs.org/mailman/listinfo/pgrouting-users)
* SVN repository (http://pgrouting.postlbs.org/svn/pgrouting)
* TRAC website ( http://pgrouting.postlbs.org)
* File downloads ( http://files.postlbs.org/pgrouting)
* DNS settings ( http://[xyz].postlbs.org)

Migration steps
********************************************************************************

Mailing lists
^^^^^^^^^^^^^

Create a new mailing list "pgrouting-dev" and migrate existing list "pgrouting-users" to OSGeo mailing lists. Import existing mail archive and add current subscribers. Remove mailing list "announcements". 

http://wiki.osgeo.org/wiki/SAC:Mailing_Lists

SVN repository
^^^^^^^^^^^^^^

Migrate current pgRouting SVN repository to OSGeo infrastructure and keep Subversion history. Clearify committer list and discuss current repository structure (maybe other RFC?) 

http://wiki.osgeo.org/wiki/Subversion

TRAC website
^^^^^^^^^^^^

For now it should be enough to have TRAC as the main website, providing bug tracker, repository browser and wiki. Someday, if we see the need for more "advanced" solutions, we can build another project site. 
Create a new TRAC instance for pgRouting on OSGeo server and try to import as much content as possible. Create static pages of the current forum and keep them somewhere (where?) 

http://wiki.osgeo.org/wiki/Trac_Instances

Download server
^^^^^^^^^^^^^^^

Setup a directory for pgRouting related file downloads to provide source files and binaries, etc.. Copy current files there and adjust links.

http://wiki.osgeo.org/wiki/Download_Server

DNS settings
^^^^^^^^^^^^

Update DNS settings to comply with the new URL's, create redirects to avoid dead links. (Keep pgrouting.postlbs.org or take "pgrouting.org" domain?)

Possible issues
********************************************************************************

* OSGeo domain will be used for SVN, mailing lists, download server. How about TRAC?
* URL's might change and links might not be accessible anymore.
* Discussion forum will be closed (keep current forum as static HTML and reference?). Can we expect all users to use the mailing list for questions?

Remarks, Links
********************************************************************************

* http://lists.postlbs.org/pipermail/pgrouting-users/2010-March/000268.html
