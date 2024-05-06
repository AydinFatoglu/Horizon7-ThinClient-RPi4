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
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-PCoIP-2206-8.6.0-20094634.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/

sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/bin/ /usr/bin/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/doc/ /usr/share/doc/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/share/locale/ /usr/share/locale/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-PCoIP-2206-8.6.0-20094634.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-PCoIP-2206-8.6.0-20094634.armhf/lib/vmware/view/client/ /usr/bin
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf/bin/ /usr/bin/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf/init.d/ /etc/init.d/

sudo ln -s /usr/bin/vmware-usbarbitrator /usr/lib/vmware/view/usb/vmware-usbarbitrator
sudo ln -s /usr/bin/vmware-view-usbdloader /usr/lib/vmware/view/usb/vmware-view-usbdloader
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc5.d/S50vmware-USBArbitrator
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc6.d/K08vmware-USBArbitrator

sudo sed -i '$i/etc/init.d/vmware-USBArbitrator start' /etc/rc.local

sudo mkdir /home/pi/Pictures
cp /home/pi/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/share/icons/vmware-view.png /home/pi/Pictures/

sudo apt install libgtkmm-3.0-1v5 -y
sudo apt -y install libudev0
