#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

# pull and update any submodules
git submodule init
git submodule update

# base packages  
base=(
	bash
	neofetch
	ranger
	tmux
	w3m
	wttr
	bashtop
	espanso
	lazygit
	git
	isync
	kard
	msmtp
	neomutt
	ssh
	vdirsyncer
)

# macos specific packages
darwin=(
	skhd
	sketchybar
	yabai
)

# arch linux specific packages
archlinux=(
	i3
	bin
	pacman
)


# gather os and version information
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
	VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	OS=$(lsb_release -si)
	VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# for some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	OS=$DISTRIB_ID
	VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Old Debian/Ubuntu/etc.
	OS=Debian
	VER=$(cat /etc/debian_version)
else
	# Fallback to uname
	OS=$(uname -s)
	VER=$(uname -r)
fi

# gather system architecture
ARCH=$(uname -m)

# determine setup path and script
SETUP_SCRIPT_FOLDER=$(echo "./__setup/${OS// /}")

if [ "$OS" == "Arch Linux" ]; then
    # Link package pacman to $HOME
    stow -v -R -t $HOME pacman
    # run setup script
    cd $SETUP_SCRIPT_FOLDER
    ./setup_${ARCH}.sh
    cd $SCRIPT_PATH
fi

echo "#### Done!"
