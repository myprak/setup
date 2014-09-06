#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 LTS EC2 instance
# for headless setup. 

# Get ready for update
sudo apt-get update

# -----Basic module----
# Git and curl
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y cmake

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install crawler
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get install -y python-dev libxml2-dev libxslt1-dev
sudo apt-get install -y --force-yes python-pip


#sudo apt-get install -y python-scrapy
#sudo apt-get install -y python-dev libxml2-dev libxslt1-dev libxslt1.1 libxml2 libssl-dev

#Install Postgres
sudo apt-get install -y postgresql postgresql-contrib

# Python SQL 
sudo pip install SQLAlchemy
sudo apt-get install -y python-psycopg2

# Install tesseract
sudo apt-get install -y tesseract-ocr tesseract-ocr-eng




#-------Basic Module End--------

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/myprak/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.jshintrc
ln -sf dotfiles/.emacs.d .
