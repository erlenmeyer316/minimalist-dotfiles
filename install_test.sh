#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

# run the stow command for the passt in app config ($2) in the target directory ($1)
stow_package() {
	tgt=$1
	app=$2
	# -v verbose
	# -R recursive
	# -t target
    	cd $SCRIPT_DIR
	stow -v -R -t ${tgt} ${app}
}

# base packages  
base=(
	bash
	neofetch
	ranger
	tmux
	w3m
	wttr
	bashtop
	lazygit
	bin
	i3
	espanso
)

user_only=(
	git
	isync
	kard
	msmtp
	neomutt
	ssh
	vdirsyncer
)

# macos specific packages
darwin_only=(
	skhd
	sketchybar
	yabai
)

# arch linux specific packages
archlinux_only=(
	pacman
)


# pull and update any submodules
git submodule init
git submodule update

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


# pull and update any submodules
git submodule init
git submodule update

if [ "$OS" == "Arch Linux" ]; then
    for app in ${archlinux_only[@]}; do
       stow_package "${HOME}" "$app"
    done

    # run setup script
    cd $SETUP_SCRIPT_FOLDER
    ./setup_${ARCH}.sh
fi

# install base config
for app in ${base[@]}; do
	stow_package "${HOME}" $app
done


# install local user config
for app in ${user_only[@]}; do
	if [[ "$(whoami)" != *"root"* ]]; then
	    stow_package "${HOME}" $app
	fi
done

echo "#### Done!"
