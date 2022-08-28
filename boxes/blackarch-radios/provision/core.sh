#!/bin/bash

# Add the vagrant user into the vboxsf group
# it allows to share folders between host and guest
sudo usermod -a -G vboxsf vagrant

sudo pacman -Syu --noconfirm
sudo pacman -S git --noconfirm
sudo pacman -S core/usbutils --noconfirm

sudo pacman -S community/stow --noconfirm
sudo pacman -S community/virtualbox-guest-iso --noconfirm
sudo pacman -S community/neovim --noconfirm

sudo pacman -S blackarch-radio --noconfirm
