#!/bin/sh
###############################################################
# 
# Purpose: Automated build and update of pgRouting website
# Authors: Daniel Kastl <daniel@georepublic.de>
#
###############################################################
# Copyright (c) 2010 Georepublic UG
#
# Licensed under the GNU LGPL.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 2.1 of the License,
# or any later version.  This library is distributed in the hope that
# it will be useful, but WITHOUT ANY WARRANTY, without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Lesser General Public License for more details, either
# in the "LICENSE.LGPL.txt" file distributed with this software or at
# web page "http://www.fsf.org/licenses/lgpl.html".
#

# About:
# =====
# This script will run the following tasks
#       - Update to the latest changes of the website repository 
#       - Build documentation with Sphinx
#
# NOTE: This script was written to run on Ubuntu server. 
#		It requires an existing
#		clone of pgRouting website repository

# Running:
# =======
# This script can run as cron job for example
# ./checkout.sh

REPDIR="/opt/Github/pgrouting/website/"
WEBDIR="/var/www/pgrouting-www/"

cd $REPDIR

# Update to latest version
#git pull -q origin
git fetch -q origin

# Create HTML
sphinx-build -b html -Q $REPDIR $WEBDIR

# Copy robots.txt and Google WTK verification
cp $REPDIR"robots.txt" $WEBDIR
cp $REPDIR"googlec45579aabecbde29.html" $WEBDIR

