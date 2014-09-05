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

# Install python
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get install -y python-dev libxml2-dev libxslt1-dev libxslt1.1 libxml2 libssl-dev
sudo apt-get install -y --force-yes python-pip


# Install crawler
sudo pip install lxml scrapy requests w3lib cssselect
sudo pip install Pillow



#Sort out locale errors in EC2 
cd $HOME
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales







# Install tesseract
sudo apt-get install -y tesseract-ocr tesseract-ocr-eng

#Install Postgres
sudo apt-get install -y postgresql postgresql-contrib

#Install Virtualenvwrapper
sudo apt-get install -y virtualenvwrapper

# Python SQL 
sudo pip install SQLAlchemy
sudo apt-get install -y python-psycopg2


# #-----Computer Vision Module-------


# # OpencCV
# cd $HOME
# git clone https://github.com/Itseez/opencv.git -b 2.4
# md opencv_bin
# cd opencv_bin
# cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_OPENCL=ON -DBUILD_NEW_PYTHON_SUPPORT=ON -DINSTALL_PYTHON_EXAMPLES=ON ~/opencv
# echo "Installing Dependenices"
# sudo apt-get -qq install -y libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils ffmpeg
# make
# sudo make install

# sudo pip install numpy


# # Install tesseract python wrapper
# cd $HOME
# wget http://python-tesseract.googlecode.com/files/python-tesseract_0.7-1.4_amd64.deb
# sudo dpkg -i python-tesseract*.deb
# sudo apt-get -f install


 


# -----Web server module------

# install nodejs
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
 
# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
sudo npm install -g jshint

#Install npm express web development framework
sudo npm install express

#Install new node libraries
sudo npm install cheerio
sudo npm install commander
sudo npm install restler
sudo npm install request
sudo npm install underscore

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap


# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
sudo wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#Install Grunt and Twitter Bootstrap for RWD, plus Bower as package manager
cd $HOME
sudo npm install -g grunt-cli
sudo npm install -g bower
git clone http://github.com/twbs/bootstrap.git
cd bootstrap/
sudo npm install
bower install --config.interactive=false bootstrap
#first time running bower have to answer log reporting question case 
 


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
