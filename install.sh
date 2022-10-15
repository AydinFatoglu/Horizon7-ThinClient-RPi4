#!/bin/bash

#Download Bundleed Client
mkdir /home/pi/Downloads/HClients/ 
cd /home/pi/Downloads/HClients/
wget https://download3.vmware.com/software/view/viewclients/CART21FQ2/VMware-Horizon-Client-2006-8.0.0-16522670.x86.bundle -p /home/pi/Downloads/HClients/
cd /home/pi/Downloads/HClients/
sudo chmod +x ./VMware-Horizon-Client-2006-8.0.0-16522670.x86.bundle

#Download Tarball Client
cd /home/pi/Downloads/HClients/
wget https://download3.vmware.com/software/view/viewclients/CART21FQ2/vmware-view-client-linux-2006-8.0.0-16522670.tar.gz



#Download Install LXDE
sudo apt install -y lubuntu-desktop

