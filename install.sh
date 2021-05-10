#!/bin/bash
set -m #Set Job Control

echo -e "\n WARNING: Running as root might cause files to be write-protected, use chmod or "chown $(whoami)" to fix \n"

#Get tools
sudo apt-get -y install cmake
sudo apt-get -y install build-essential #Grabs make and other important things
sudo apt-get -y install nodejs #Used in Harrogate, Node.js
sudo apt-get -y install npm #Like PIP but for node.js

#Clear the Workspace
sudo mkdir ../tmp
sudo mv install.sh ../tmp/install.sh
sudo mv download.sh ../tmp/download.sh
sudo mv Docs ../tmp/Docs

sudo rm -r *

sudo mv ../tmp/install.sh install.sh
sudo mv ../tmp/download.sh download.sh
sudo mv ../tmp/Docs Docs
sudo rm -r ../tmp

#Pull from Github
( git clone https://github.com/kipr/Wombat-Firmware && echo -e "Finished Cloning Wombat Firmware \n" && fg ) &

( git clone https://github.com/kipr/libwallaby && echo -e "Finished Cloning Libwallaby! \n" && fg ) &
( git clone https://github.com/kipr/pcompiler && echo -e "Finished Cloning Pcompiler! \n" && fg ) &
( git clone https://github.com/kipr/libkar && echo -e "Finished Cloning Libkar! \n" && fg ) &
( git clone https://github.com/kipr/botui && echo -e "Finished Cloning Botui! \n" && fg ) &
git clone https://github.com/kipr/harrogate && echo -e "Finished Cloning Harrogate! \n" && fg

#Install Libwallaby
echo -e "\n Installing Libwallaby... \n"
cd libwallaby
sudo apt-get -y install libzbar-dev libopencv-dev libjpeg-dev python-dev doxygen swig
mkdir build
cd build
cmake ..
sudo make -j4
sudo make install libwallaby
cd ../..
echo -e "\n Finished Installing Libwallaby! \n"

#Install Pcompiler
echo -e "\n Installing Pcompiler... \n"
cd pcompiler
mkdir build
cd build
cmake ..
sudo make -j4
sudo make install pcompiler
cd ../..
echo -e "\n Finished Installing Pcompiler! \n"


#Install Libkar
echo -e "\n Installing Libkar... \n"
cd libkar
mkdir build
cd build
cmake ..
sudo make -j4
sudo make install libkar
cd ../..
echo -e "\n Finished Installing Libkar! \n"

#Install Botui
echo -e "\n Installing Botui... \n"
cd botui
mkdir build
cd build
cmake ..
sudo make -j4
sudo make install botui
cd ../..
echo -e "\n Finished Installing Botui! \n"


#Install Harrogate Dependancies
echo -e "\n Installing Harrogate Dependancies... \n"

#Node.js Setup
node -v
npm install npm@latest -g
npm -v

#Gulp Setup
npm install --global gulp-cli


#Install npm Dependancies
cd harrogate
npm install
cd ..

#Get Other Requirements
sudo apt-get -y install zliblg-dev libpng-dev libbson-1.0 libboost-all-dev

#Install libaurora
git clone https://github.com/kipr/libaurora
cd libaurora
mkdir build
cd build
cmake ..
sudo make -j4
sudo make install libaurora
cd ../..

#Install Bsonbind
git clone https://github.com/kipr/bsonbind
cd bsonbind
mkdir build
cd build
cmake ..
sudo make -j4
sudo make install bsonbind
cd ../..

#Install Daylight
git clone https://github.com/kipr/daylite
cd daylite
mkdir build
cd build
cmake ..
sudo make -j4
sudo make install daylite
cd ../..

echo -e "\n Finished Installing Harrogate Dependancies! \n"


echo -e "\n Attempting to Install Harrogate... \n"
git clone https://github.com/kipr/harrogate
mv harrogate /home/pi || sudo cp harrogate /home/pi/


echo -e "\n Finished Launching Harrogate! \n"


#Install Qt Creator
sudo apt-get -y install openjdk-8-jre qtcreator

echo

cat instructions.txt

echo -e "\n --------------------------------------------- \n"
echo -e "Your Development Toolkit is Now Complete. \n"
echo -e "--------------------------------------------- \n"
