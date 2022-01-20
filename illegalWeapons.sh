#!/bin/bash

#set -x

# The purpose of this script is to systematically grab information from 
# various tor based sites, collectively wget suck the site to a local dir
# and then archive it by a date/time stamp for analysis at a later date. 
# This site and links should be made relative in the wget command. 
# This script should run daily.

# Script variables here
DATE=$(date +%Y%m%d)
DATE2=$(date +"%d %b %Y")
# Variable testing for output
echo $DATE
echo $DATE2
FILE="/home/pi/illegalWeapons/siteList.txt"
PAGE="proliferation-of-illegal-weapons-on-the-dark-web.xml"

#This section grabs the tor site list and feeds it to wget
mkdir /home/pi/illegalWeapons/$DATE
cd /home/pi/illegalWeapons/$DATE

for i in $(cat $FILE);
	do
	usewithtor wget --mirror -e robots=off -k -i $i 
	done
sudo sed -i "4 a &lt;li&gt;&lt;a href=&quot;http://10.242.5.92/$DATE&quot;&gt;$DATE2&lt;/a&gt;&lt;/li&gt;" /var/www/data/pages/$PAGE
sudo mv /home/pi/illegalWeapons/$DATE /var/www/


