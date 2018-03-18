#!/bin/sh
echo "\033[32m"Linux_etc.sh"\033[0m"

#install git
sudo apt-get install git
git config --global user.email "merrym4n@gmail.com"
git config --global user.name "merrym4n"

#install terminator
sudo apt-get install terminator

#up-to-date
sudo apt-get update
sudo apt-get upgrade
