#!/bin/sh
echo "\033[32m"Linux_etc.sh"\033[0m"

#install git
sudo apt-get install git

#install terminator
sudo apt-get install terminator

#up-to-date
sudo apt-get update
sudo apt-get upgrade

echo "\033[31m"You should set information"\033[0m"
echo "\033[31m"git config --global user.email \"YourEmail\""\033[0m"
echo "\033[31m"git config --global user.name \"YourName\""\033[0m"