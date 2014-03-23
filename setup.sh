#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

#Sort out locale errors in EC2 
cd $HOME
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

# Install python
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make

# install nodejs
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
sudo nvm install v0.10.12
sudo nvm use v0.10.12

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

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

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

#Install Grunt and Twitter Bootstrap for RWD, plus Bower as package manager
cd $HOME
sudo npm install -g grunt-cli
sudo npm install -g bower
git clone http://github.com/twbs/bootstrap.git
cd bootstrap/
sudo npm install
bower install bootstrap
# first time running bower have to answer log reporting questioncase 
