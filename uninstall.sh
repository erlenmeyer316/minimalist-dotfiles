#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

# run the stow command for the passt in app config ($2) in the target directory ($1)
unstow_package() {
	tgt=$1
	app=$2
	# -v verbose
	# -R recursive
	# -t target
    	cd $SCRIPT_DIR
	stow -D -v -R -t ${tgt} ${app}
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

# determine setup path based on os information
SETUP_SCRIPT_FOLDER=$(echo "./__setup/${OS// /}")


if [ "$OS" == "Arch Linux" ]; then
    # run uninstall script
    cd $SETUP_SCRIPT_FOLDER
    ./uninstall_${ARCH}.sh

    # uninstall arch only configuration
    for app in ${archlinux_only[@]}; do
         unstow_package "${HOME}" "$app"
    done
fi

# uninstall base config
for app in ${base[@]}; do
	unstow_package "${HOME}" $app
done


# uninstall local user config
for app in ${user_only[@]}; do
	if [[ "$(whoami)" != *"root"* ]]; then
	    unstow_package "${HOME}" $app
	fi
done

echo "#### Done!"
