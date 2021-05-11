#!/bin/bash
set -m              #Set Job Control

# ---------------------------------------------------------------------------- #
#                                    Web UI                                    #
# ---------------------------------------------------------------------------- #
sudo apt-get dist-upgrade -y nodejs     # Install node.js
sudo apt-get dist-upgrade -y npm        # Updating npm
sudo npm install npm –global            # Install npm
sudo npm install harrogate              # Install harrogate dependencies
sudo npm install --global gulp-cli      # Gulp Setup
sudo gulp                               # Compiles with gulp

cd harrogate
npm install
gulp

# Starts server
#
# sudo node server.js


# ---------------------------------------------------------------------------- #
#                           Install Compiler Utility                           #
# ---------------------------------------------------------------------------- #
sudo apt-get dist-upgrade -y cmake
sudo apt-get dist-upgrade -y qt5-default
sudo mkdir pcompiler/build
cd pcompiler/build
sudo cmake ..


# ---------------------------------------------------------------------------- #
#                                   Device UI                                  #
# ---------------------------------------------------------------------------- #

sudo mkdir botui/build
cd botui/build
sudo cmake ..
