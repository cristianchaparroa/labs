#!/usr/bin/env bash


sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade 

sudo apt-get install aptitude -y
sudo apt-get install build-essential bc libelf-dev linux-headers-`uname -r` -y

# wifi tools
sudo apt install net-tools wireless-tools -y 

# kali linux tools
sudo apt install kali-tools-802-11 -y
