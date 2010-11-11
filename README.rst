:Authors: 
	Daniel Kastl <daniel@georepublic.de>

===========================
 README - pgRouting Website
===========================

This readme describes how to setup the pgRouting website 
(http://www.pgrouting.org) on Debian/Ubuntu server.


Install
-------

- Install Sphinx/ReST

	sudo apt-get install python-sphinx texlive-latex-base


- Checkout source code from Git repository

	git clone git@github.com:pgRouting/website.git


- Build website in HTML 

	cd website
	make html
	
- Copy the website to the webserver

	scp -r _build/html/* <user>@<hostname>:/path/to/webroot


ToDo
----

- PDF/Latex build for documentation
- Script to automatically update the website on the webserver with every commit


Note
----

The pgRouting website is currently hosted on Georepublic server. 
Contact administrators via email: project@pgrouting.org


