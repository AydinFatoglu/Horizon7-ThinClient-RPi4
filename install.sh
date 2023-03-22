#!/bin/bash

sudo apt-get install raspberrypi-ui-mods -y


cd /home/pi/Downloads
wget https://download3.vmware.com/software/CART23FQ4_LIN_2212.1_TARBALL/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348.tar.gz
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348.tar.gz -C /home/pi/Downloads/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-Client-2212.1-8.8.1-21219348.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-PCoIP-2212.1-8.8.1-21219348.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-USB-2212.1-8.8.1-21219348.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/

sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-Client-2212.1-8.8.1-21219348.armhf/bin/ /usr/bin/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-Client-2212.1-8.8.1-21219348.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-Client-2212.1-8.8.1-21219348.armhf/doc/ /usr/share/doc/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-Client-2212.1-8.8.1-21219348.armhf/share/locale/ /usr/share/locale/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-PCoIP-2212.1-8.8.1-21219348.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-PCoIP-2212.1-8.8.1-21219348.armhf/lib/vmware/view/client/ /usr/bin
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-USB-2212.1-8.8.1-21219348.armhf/bin/ /usr/bin/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-USB-2212.1-8.8.1-21219348.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-USB-2212.1-8.8.1-21219348.armhf/init.d/ /etc/init.d/

sudo ln -s /usr/bin/vmware-usbarbitrator /usr/lib/vmware/view/usb/vmware-usbarbitrator
sudo ln -s /usr/bin/vmware-view-usbdloader /usr/lib/vmware/view/usb/vmware-view-usbdloader
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc5.d/S50vmware-USBArbitrator
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc6.d/K08vmware-USBArbitrator

sudo sed -i '$i/etc/init.d/vmware-USBArbitrator start' /etc/rc.local

cp /home/pi/Downloads/VMware-Horizon-Client-Linux-2212.1-8.8.1-21219348/armhf/VMware-Horizon-Client-2212.1-8.8.1-21219348.armhf/share/icons/vmware-view.png /home/pi/Pictures/

sudo apt install libgtkmm-3.0-1v5 -y
sudo apt -y install libudev0

cat > /usr/share/applications/vmware-view.desktop <<EOL
[Desktop Entry]
Name=HorizonClient
GenericName=Horizon Client
Comment=Horizon Client
Exec=/usr/bin/vmware-view
Icon=/home/pi/Pictures/vmware-view.png
Categories=Office;
Terminal=false
Type=Application
EOL
