#!/bin/bash

sudo apt-get install raspberrypi-ui-mods


cd /home/pi/Downloads
wget https://download3.vmware.com/software/view/viewclients/CART22FQ2/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609.tar.gz -O /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609.tar.gz
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609.tar.gz -C /home/pi/Downloads/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-Client-2106.1-8.3.1-18435609.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-PCoIP-2106.1-8.3.1-18435609.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/
tar -xzf /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-USB-2106.1-8.3.1-18435609.armhf.tar.gz -C /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/

sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-Client-2106.1-8.3.1-18435609.armhf/bin/ /usr/bin/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-Client-2106.1-8.3.1-18435609.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-Client-2106.1-8.3.1-18435609.armhf/doc/ /usr/share/doc/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-Client-2106.1-8.3.1-18435609.armhf/share/locale/ /usr/share/locale/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-PCoIP-2106.1-8.3.1-18435609.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-PCoIP-2106.1-8.3.1-18435609.armhf/lib/vmware/view/client/ /usr/bin
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-USB-2106.1-8.3.1-18435609.armhf/bin/ /usr/bin/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-USB-2106.1-8.3.1-18435609.armhf/lib/ /usr/lib/
sudo cp -aRT /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-USB-2106.1-8.3.1-18435609.armhf/init.d/ /etc/init.d/

sudo ln -s /usr/bin/vmware-usbarbitrator /usr/lib/vmware/view/usb/vmware-usbarbitrator
sudo ln -s /usr/bin/vmware-view-usbdloader /usr/lib/vmware/view/usb/vmware-view-usbdloader
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc5.d/S50vmware-USBArbitrator
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc6.d/K08vmware-USBArbitrator

sudo sed -i '$i/etc/init.d/vmware-USBArbitrator start' /etc/rc.local

cp /home/pi/Downloads/VMware-Horizon-Client-Linux-2106.1-8.3.1-18435609/armhf/VMware-Horizon-Client-2106.1-8.3.1-18435609.armhf/share/icons/vmware-view.png /home/pi/Pictures/

sudo apt install libgtkmm-3.0-1v5 -y
sudo apt -y install libudev0

sudo nano /usr/share/applications/ximusicplayer.desktop

[Desktop Entry]
Name=XiMusicPlayer
GenericName=Music Player
Comment=Xi Music Player
Exec=/path/to/executable
Icon=qjackctl
Categories=Audio;AudioVideo;
Terminal=false
Type=Application









