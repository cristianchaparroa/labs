#!/bin/bash 

# Run https://blackarch.org/strap.sh as root and follow the instructions.
curl -O https://blackarch.org/strap.sh
# Verify the SHA1 sum
echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
# Set execute bit
chmod +x strap.sh
# Run strap.sh
sudo ./strap.sh
# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
sudo pacman -Syu

sudo pacman -Sy wget --noconfirm

