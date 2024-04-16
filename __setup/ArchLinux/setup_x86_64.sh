#!/usr/bin/env bash


# Install official packages from list
OFFICIAL_PACKAGES=$HOME/.config/pacman/package_lists/pacman.pkglist 
sudo pacman -S --needed --noconfirm - < $OFFICIAL_PACKAGES

# Install yay AUR helper (https://github.com/Jguer/yay)
cd yay
makepkg -si --noconfirm

# Install native packages from list
AUR_PACKAGES=$HOME/.config/pacman/package_lists/yay.pkglist 
yay -S --needed --noconfirm - < $AUR_PACKAGES

