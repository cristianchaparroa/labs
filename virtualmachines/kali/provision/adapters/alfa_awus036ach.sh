#!/bin/bash 

sudo apt remove realtek-rtl88xxau-dkms 
sudo apt purge realtek-rtl88xxau-dkms
sudo apt autoremove && apt autoclean


mkdir drivers &&cd drivers
git clone https://github.com/aircrack-ng/rtl8812au
cd rtl8812au
make && make install
