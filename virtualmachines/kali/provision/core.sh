#!/usr/bin/env bash

DEBIAN_FRONTEND=noninteractive sudo apt-get -y update
sudo apt install debconf-utils

DEBIAN_FRONTEND=noninteractive sudo apt-get -y upgrade
DEBIAN_FRONTEND=noninteractive sudo apt-get -y dist-upgrade

sudo apt-get install aptitude -y
sudo apt-get install build-essential bc libelf-dev  -y
sudo apt-get install linux-headers-`uname -r` -y
sudo apt install net-tools wireless-tools -y
