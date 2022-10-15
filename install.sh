#!/bin/bash

#Download Bundleed Client

mkdir /home/pi/Downloads/HClients/ 
cd /home/pi/Downloads/HClients/
wget https://download3.vmware.com/software/view/viewclients/CART21FQ2/VMware-Horizon-Client-2006-8.0.0-16522670.x86.bundle
wget https://download3.vmware.com/software/view/viewclients/CART21FQ4/VMware-Horizon-Client-2012-8.1.0-17349998.x86.bundle

cd /home/pi/Downloads/HClients/
sudo chmod +x ./VMware-Horizon-Client-2006-8.0.0-16522670.x86.bundle
sudo chmod +x ./VMware-Horizon-Client-2012-8.1.0-17349998.x86.bundle

#Download Tarball Client
cd /home/pi/Downloads/HClients/
wget https://download3.vmware.com/software/view/viewclients/CART21FQ2/vmware-view-client-linux-2006-8.0.0-16522670.tar.gz
wget https://download3.vmware.com/software/view/viewclients/CART22FQ2/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609.tar.gz

#Setup Gui Needs
sudo apt-get install python-gtk2 -y


#Download Install LXDE
sudo apt install -y lubuntu-desktop

