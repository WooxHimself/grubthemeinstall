#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo bash $0 $*"
    exit 1
fi


echo -c "

 ▄▄ • ▄▄▄  ▄• ▄▌▄▄▄▄·   ▄• ▄▌ ▄▄▄··▄▄▄▄   ▄▄▄· ▄▄▄▄▄▄▄▄ .
▐█ ▀ ▪▀▄ █·█▪██▌▐█ ▀█▪  █▪██▌▐█ ▄███· ██ ▐█ ▀█ •██  ▀▄.▀·
▄█ ▀█▄▐▀▀▄ █▌▐█▌▐█▀▀█▄  █▌▐█▌ ██▀·▐█▪ ▐█▌▄█▀▀█  ▐█.▪▐▀▀▪▄
▐█▄▪▐█▐█•█▌▐█▄█▌██▄▪▐█  ▐█▄█▌▐█▪·•██. ██ ▐█▪ ▐▌ ▐█▌·▐█▄▄▌
·▀▀▀▀ .▀  ▀ ▀▀▀ ·▀▀▀▀    ▀▀▀ .▀   ▀▀▀▀▀•  ▀  ▀  ▀▀▀  ▀▀▀ 

"

echo "[INFO] Starting Script..."
mkdir ~/Gits
echo "[INFO] Created ~/Gits folder"
echo "[INFO] Downloading Theme..."
cd ~/Gits
echo "[INFO] Changed Directory to ~/Gits"
git clone https://github.com/catppuccin/grub
echo "[INFO] Cloned Theme"
cd grub
echo "[INFO] Changed Directory to grub"
echo "[INFO] Attempting to install the theme..."
sudo sudo cp -r catppuccin-grub-theme /usr/share/grub/themes/
echo 'GRUB_THEME="/usr/share/grub/themes/catppuccin-grub-theme/theme.txt"' >> /etc/default/grub
echo "[INFO] SUCCESS!"
echo "[INFO] Updating Grub Configuration"
sudo grub-mkconfig -o /boot/grub/grub.cfg

