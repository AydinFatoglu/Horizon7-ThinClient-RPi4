# Horizon Client-ThinClient-RPi4

This solution will install a standard desktop environment on top of the official Lite image and fully install the VMware Horizon Client for Linux version 2206-8.6.0-20094634 for you.

Alternatively, you can use the pre-built image and flash it using Raspberry Pi Imager software. Please keep in mind to extend the file system using raspi-config after the first boot so that you can utilize your SD card's full capacity. 
    
![Description of GIF](https://raw.githubusercontent.com/AydinFatoglu/Horizon7-ThinClient-RPi4/918812e324e4ecfd996fc41592afc74bcefaa339/Screen%20Recording%20-%20Made%20with%20FlexClip.gif)


**Operatting System**

- Raspberry Pi OS Lite
- System: 32-bit
- Kernel version: 5.15
- Debian version: 11 (bullseye)

**Download**

https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2022-09-26/2022-09-22-raspios-bullseye-armhf-lite.img.xz

**Horizon Client Auto Installer (RASPBIAN MINIMAL DESKTOP)**


wget https://raw.githubusercontent.com/AydinFatoglu/Horizon7-ThinClient-RPi4/main/install.sh && chmod +x install.sh && ./install.sh

**Horizon Client Auto Installer (OPENBOX GUI)**

wget https://raw.githubusercontent.com/AydinFatoglu/Horizon7-ThinClient-RPi4/main/openbox_ver.sh && chmod +x openbox_ver.sh && ./openbox_ver.sh


