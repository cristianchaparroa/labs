#!/usr/bin/env bash


# Add insecure public key.
rm -Rf /home/vagrant/.ssh
mkdir /home/vagrant/.ssh
wget -O /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys

# enable the ssh service
sudo systemctl enable ssh
