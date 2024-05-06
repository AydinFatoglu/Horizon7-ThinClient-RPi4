#!/bin/bash

sudo apt-get update -y && 
sudo apt-get upgrade -y && 
sudo apt-get install lightdm openbox -y && 
sudo raspi-config nonint do_boot_behaviour B4 && 
sudo raspi-config nonint do_boot_wait 0 && 
sudo apt-get install terminator -y && 
sudo systemctl disable hciuart.service && 
sudo systemctl disable bluetooth.service && 

sudo mkdir /home/pi/Downloads
sudo chown -R pi:pi /home/pi/Downloads
chmod 755 /home/pi/Downloads
cd /home/pi/Downloads
wget https://download3.vmware.com/software/CART23FQ2_LIN_2206_TARBALL/VMware-Horizon-Client-Linux-2206-8.6.0-20094634.tar.gz -O /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634.tar.gz
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634.tar.gz -C /home/pi/Downloads/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/

sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/bin/ /usr/bin/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/doc/ /usr/share/doc/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/share/locale/ /usr/share/locale/



sudo apt install libgtkmm-3.0-1v5 -y
sudo apt -y install libudev0
sudo apt install libxss1 -y

mkdir -p ~/.config/openbox && 

cat << EOF > ~/.config/openbox/autostart
# Add commands to start VMware Horizon automatically
vmware-view &
EOF
 
 
sudo reboot


