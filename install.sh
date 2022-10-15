#!/bin/bash

#Download Client
mkdir /home/pi/Downloads/HClients/ 
cd /home/pi/Downloads/HClients/
wget https://download3.vmware.com/software/view/viewclients/CART21FQ2/VMware-Horizon-Client-2006-8.0.0-16522670.x86.bundle -p /home/pi/Downloads/HClients/
cd /home/pi/Downloads/HClients/
sudo chmod +x ./VMware-Horizon-Client-2006-8.0.0-16522670.x86.bundle

#Download Install LXDE
sudo apt install -y lubuntu-desktop

