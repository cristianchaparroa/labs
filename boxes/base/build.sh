#!/bin/bash 

#params
iso=${1?missing param - path iso}

# constants
satactl=SATA
idectl=IDE

# vars
vmname=kali-$(uuidgen)
disks=${HOME}/.virtualbox/harddisks/
hddname=${disks}/${vmname}.vdi

# create the virtual machine
echo "---> creating the virtual machine ..."
VBoxManage createvm --name ${vmname} --ostype Debian_64  --register


# create the disk 
echo "---> creating the disk ..."
VBoxManage createmedium disk --filename ${hddname} --size 32768

# Add bootable SATA controller
VBoxManage storagectl ${vmname} --name ${satactl} --add sata --controller IntelAHCI

# attach the disk created in the above step to the vm 
VBoxManage storageattach ${vmname} --storagectl ${satactl} --port 0 --device 0 --type hdd --medium ${hddname}

# adding a image
echo "---> adding the iso image"
VBoxManage storagectl ${vmname} --name ${idectl} --add ide
VBoxManage storageattach ${vmname} --storagectl ${idectl} --port 0 --device 0 --type dvddrive --medium ${iso}

# set the memory and network
echo "---> configuring the virtual machine ..."
VBoxManage modifyvm ${vmname} --ioapic on
VBoxManage modifyvm ${vmname} --memory 1024 --vram 128
VBoxManage modifyvm ${vmname} --nic1 nat
VBoxManage modifyvm ${vmname} --boot1 dvd --boot2 disk --boot3 none --boot4 none

echo "---> starting installation ..."
VBoxManage unattended install ${vmname} --iso=${iso} \
    --user=root \
    --password=vagrant 
    #--script-template=minimal-preseed.cfg #\
    # --type headless uncomment this line after everything has been tested
