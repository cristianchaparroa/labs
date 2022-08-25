#!/bin/bash 

sudo apt update --yes
sudo apt upgrade --yes

# install core 
# sudo apt install -y build-essential cmake gcc make subversion
sudo apt install -y libgsm1-dev libgusb-dev libusb-1.0-0 libusb-1.0-0-dev 
# sudo apt install -y autoconf pkg-config gawk mawk doxygen swig  
# sudo apt install -y qtbase5-dev pyqt5-dev-tools python3-qtpy zlib1g zlib1g-dev

# install BladeRF tools and libbladeRF
sudo add-apt-repository papa:nuand/bladerf 
sudo apt update --yes
sudo apt install libbladerf-dev --yes

