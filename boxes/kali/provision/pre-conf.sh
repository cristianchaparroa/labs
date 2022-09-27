#!/usr/bin/env bash

touch ~/.hushlogin

export DEBIAN_FRONTEND=noninteractive
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure --frontend=noninteractive locales

sudo sed -i '/^FONTFACE/s/^/#/' /etc/default/console-setup # comment out the old value
sudo sed -i '/^FONTSIZE/s/^/#/' /etc/default/console-setup # comment out the old value
echo 'FONTFACE="TER"' | sudo tee -a /etc/default/console-setup # Set font to Terminus
echo 'FONTSIZE="16x32"' | sudo tee -a /etc/default/console-setup # Set font: size

sudo update-initramfs -u

echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections
echo 'grub-pc	grub-pc/install_devices	multiselect /dev/sda' | sudo debconf-set-selections

sudo grub-install /dev/sda
sudo update-grub
