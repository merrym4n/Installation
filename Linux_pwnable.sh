#install pwndbg
cd ~/Documents
wget https://github.com/pwndbg/pwndbg/archive/dev/pwndbg.zip
unzip pwndbg.zip
rm pwndbg.zip
cd pwndbg-dev/
./setup.sh

#install pwntools
sudo apt-get install python-pip
pip install pwntools

#up-to-date
sudo apt-get update
sudo apt-get upgrade

