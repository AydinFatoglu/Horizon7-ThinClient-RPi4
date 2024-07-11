#!/bin/bash

sudo apt-get update -y && 
sudo apt-get upgrade -y && 
sudo apt-get install lightdm openbox -y && 
sudo raspi-config nonint do_boot_behaviour B4 && 
sudo raspi-config nonint do_boot_wait 0 &&
sudo raspi-config nonint do_memory_split 256 &&
sudo apt-get install terminator -y && 

sudo systemctl disable hciuart.service && 
sudo systemctl disable bluetooth.service &&
sudo systemctl mask apt-daily-upgrade && 
sudo systemctl mask apt-daily && 
sudo systemctl disable apt-daily-upgrade.timer && 
sudo systemctl disable apt-daily.timer &&
sudo apt remove --purge avahi-daemon -y && 
sudo apt remove --purge bluez -y && 
sudo apt autoremove --purge -y && 

sudo mkdir /home/$USER/Downloads
sudo chown -R $USER:$USER /home/$USER/Downloads
chmod 755 /home/$USER/Downloads
cd /home/$USER/Downloads

wget https://download3.vmware.com/software/CART23FQ2_LIN_2206_TARBALL/VMware-Horizon-Client-Linux-2206-8.6.0-20094634.tar.gz -O /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634.tar.gz
tar -xzf /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634.tar.gz -C /home/$USER/Downloads/
tar -xzf /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf.tar.gz -C /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/
tar -xzf /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-PCoIP-2206-8.6.0-20094634.armhf.tar.gz -C /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/
tar -xzf /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf.tar.gz -C /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/

sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/bin/ /usr/bin/
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/lib/ /usr/lib/
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/doc/ /usr/share/doc/
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-Client-2206-8.6.0-20094634.armhf/share/locale/ /usr/share/locale/
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-PCoIP-2206-8.6.0-20094634.armhf/lib/ /usr/lib/
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-PCoIP-2206-8.6.0-20094634.armhf/lib/vmware/view/client/ /usr/bin
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf/bin/ /usr/bin/
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf/lib/ /usr/lib/
sudo cp -aRT /home/$USER/Downloads/VMware-Horizon-Client-Linux-2206-8.6.0-20094634/armhf/VMware-Horizon-USB-2206-8.6.0-20094634.armhf/init.d/ /etc/init.d/

sudo ln -s /usr/bin/vmware-usbarbitrator /usr/lib/vmware/view/usb/vmware-usbarbitrator
sudo ln -s /usr/bin/vmware-view-usbdloader /usr/lib/vmware/view/usb/vmware-view-usbdloader
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc5.d/S50vmware-USBArbitrator
sudo ln -s /etc/init.d/vmware-USBArbitrator /etc/rc6.d/K08vmware-USBArbitrator

sudo sed -i '$i/etc/init.d/vmware-USBArbitrator start' /etc/rc.local

sudo apt install libgtkmm-3.0-1v5 -y
sudo apt -y install libudev0
sudo apt install libxss1 -y

mkdir -p ~/.config/openbox && 

# Prompt the user for input
read -p "Enter the server URL: " server
read -p "Enter the username: " user
read -sp "Enter the password: " ebipass
echo
read -p "Enter the domain name: " domain
read -p "Enter the application name: " app




# Create the autostart file with the provided values
cat << EOF > ~/.config/openbox/autostart
# Disable DPMS and prevent screen blanking
xset -dpms s off s noblank s noexpose &

#setbgcolor
xsetroot -solid "#7393B3" &
#set display rez
#xrandr --output HDMI-1 --mode 1920x1080 &

# Loop to keep vmware-view running
while true; do
    vmware-view  --serverURL $server --useExisting --userName $user --password $ebipass --domainName $domain --nonInteractive --applicationName "$app" &
    wait \$!
done &
EOF

echo "File created at ~/.config/openbox/autostart"


sudo reboot



