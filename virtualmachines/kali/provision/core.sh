#!/usr/bin/env bash

echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee -a /etc/apt/sources.list
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade 

sudo apt install aptitude -y
sudo apt install build-essential bc libelf-dev linux-headers-`uname -r` -y

