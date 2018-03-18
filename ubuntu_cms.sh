#!/bin/sh
echo "\033[031m"install CMS"\033[0m"

#install require
echo "\033[032m"install require"\033[0m"
sudo apt-get install vim git

#because of nginx crash
sudo service apache2 stop

# Feel free to change OpenJDK packages with your preferred JDK.
echo "\033[032m"install OpenJDK"\033[0m"
sudo apt-get install build-essential openjdk-8-jre openjdk-8-jdk fpc \
    postgresql postgresql-client gettext python2.7 \
    iso-codes shared-mime-info stl-manual cgroup-lite libcap-dev

# Only if you are going to use pip/virtualenv to install python dependencies
echo "\033[032m"install virtualenv"\033[0m"
sudo apt-get install python-dev libpq-dev libcups2-dev libyaml-dev \
     libffi-dev python-pip

# Optional
echo "\033[032m"install nginx"\033[0m"
sudo apt-get install nginx-full php7.0-cli php7.0-fpm phppgadmin \
     texlive-latex-base a2ps gcj-jdk haskell-platform

#install cms
echo "\033[032m"install cms"\033[0m"
cd ~/Documents/
git clone --recursive "https://github.com/cms-dev/cms"

#prepare cms
echo "\033[032m"prepare cms"\033[0m"
cd cms
:<<'CHECK'
echo "Y" | sudo ./prerequisites.py install
CHECK
sudo ./prerequisites.py install
groups

#install dependencies
echo "\033[032m"install dependencies"\033[0m"
sudo pip2 install -r requirements.txt
sudo python2 setup.py install

#configure DB
echo "\033[032m"configure DB"\033[0m"
sudo su - postgres
createuser --username=postgres --pwprompt cmsuser
createdb --username=postgres --owner=cmsuser cmsdb
psql --username=postgres --dbname=cmsdb --command='ALTER SCHEMA public OWNER TO cmsuser'
psql --username=postgres --dbname=cmsdb --command='GRANT SELECT ON pg_largeobject TO cmsuser'
cmsInitDB