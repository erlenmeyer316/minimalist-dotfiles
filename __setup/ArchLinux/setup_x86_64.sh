#!/usr/bin/env bash

# Include custom pacman configuration
PAC_BAK=$HOME/.config/pacman/pacman.conf.orig
if [ ! -f "$PAC_BAK" ]; then
   echo "Backing up /etc/pacman.conf..."
   sudo cp /etc/pacman.conf $PAC_BAK
   echo "Linking custom pacman config..."
   PAC_CONF=$HOME/.config/pacman/pacman.conf
   echo "Include = $PAC_CONF" | sudo tee -a /etc/pacman.conf
fi
#sudo sh -c 'echo "Include = ${PAC_CONF}"' >> /etc/pacman.conf
#sudo echo -e "Include = ${PAC_CONF}" >> /etc/pacman.conf

# Install official packages from list
echo "Installing official packages..."
OFFICIAL_PACKAGES=$HOME/.config/pacman/package_lists/pacman.pkglist 
sudo pacman -S --needed --noconfirm - < $OFFICIAL_PACKAGES

# Install yay AUR helper (https://github.com/Jguer/yay)
echo "Installing yay package manager..."
cd yay
makepkg -si --noconfirm

# Install native packages from list
echo "Installing AUR packages..."
AUR_PACKAGES=$HOME/.config/pacman/package_lists/yay.pkglist 
yay -S --needed --noconfirm - < $AUR_PACKAGES

