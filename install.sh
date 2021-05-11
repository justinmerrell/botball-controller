#!/bin/bash
set -m              #Set Job Control

# ---------------------------------------------------------------------------- #
#                                    Web UI                                    #
# ---------------------------------------------------------------------------- #
sudo apt-get dist-upgrade -y nodejs
sudo apt-get dist-upgrade -y npm
sudo npm install npm –global
sudo npm install harrogate
