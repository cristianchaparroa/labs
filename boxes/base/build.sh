#!/bin/bash 

# constants
satactl=SATA

# vars
vmname=kali-$(uuidgen)
disks=${HOME}/.virtualbox/harddisks/
hddname=${disks}/${vmname}.vdi

# create the virtual machine
echo "---> creating the virtual machine ..."
VBoxManage createvm --name ${vmname} --ostype Linux64  --register


# set the memory and network
echo "---> configuring the virtual machine ..."
VBoxManage modifyvm ${vmname} --ioapic on
VBoxManage modifyvm ${vmname} --memory 1024 --vram 128
VBoxManage modifyvm ${vmname} --nic1 nat


# create the disk 
echo "---> creating the disk ..."
VBoxManage createmedium disk --filename ${hddname} --size 32768

# Add bootable SATA controller
VBoxManage storagectl ${vmname} --name ${satactl} --add sata --controller IntelAHCI

# attach the disk created in the above step to the vm 
VBoxManage storageattach ${vmname} --storagectl ${satactl} --port 0 --device 0 --type hdd --medium ${hddname}

# adding a image
echo "---> adding the iso image"
