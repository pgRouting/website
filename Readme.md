# pgRouting - Website

This readme describes how to setup the pgRouting website (http://www.pgrouting.org) on Debian/Ubuntu server.

## Installation

* Install Sphinx/ReST

```
sudo apt-get install python-sphinx texlive-latex-base
```

* Checkout source code from Git repository

```
git clone git://github.com/pgRouting/website.git website
```

* Build website in HTML 

```
cd website
make html
```

* Upload the website to gh-pages branch

```
git checkout gh-pages 
cp -r build/html . 
git add <new pages>
git commit -a -m "<commit message>" 
git push origin gh-pages
```

## License

Copyright(c) pgRouting Contributors

This documentation is licensed under a Creative Commons Attribution-Share Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/

