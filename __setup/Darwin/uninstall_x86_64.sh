#!/usr/bin/env bash

# Set default preferences
echo "Resetting default preferences..."

# finder defaults
defaults write com.apple.finder DisableAllAnimations -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.Finder AppleShowAllFiles -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCev"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder CreateDesktop true

# Network defaults
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 0

# NSGlobalDomain defaults
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool false
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool false
defaults write NSGlobalDomain WebKitDeveloperExtras -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool true

# sreencapture defaults
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"

# desktop, dock, and spaces defaults
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool false
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock "mru-spaces" -bool "true" && killall Dock

# additional defaults
defaults write com.apple.LaunchServices LSQuarantine -bool true
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool false
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Dump installed homebrew packages list
echo "A list of installed official packages has been written to ~/pacman.pkglist."
OFFICIAL_PACKAGES=$HOME/.config/homebrew/package_list/Brewfile
cp $OFFICIAL_PACKAGE ~/


