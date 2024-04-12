#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# installable for all users 
base=(
	bash
	bashtop
	espanso
	i3
	lazygit
	neofetch
	ranger
	sketchybar
	skhd
	tmux
	w3m
	wttr
	yabai
)

# installable only for local user
useronly=(
	git
	isync
	khard
	msmtp
	neomutt
	ssh
	vdirsyncer
)

# run the stow command for the passt in app config ($2) in the target directory ($1)
unstowit() {
	tgt=$1
	app=$2
	# -v verbose
	# -R recursive
	# -t target
	stow -D -v -R -t ${tgt} ${app}
}
echo ""
echo "Unstowing apps for user: ${whoami}"

# install base config
for app in ${base[@]}; do
	unstowit "${HOME}" $app
done


# install local user config
for app in ${useronly[@]}; do
	if [[ "$(whoami)" != *"root"* ]]; then
		unstowit "${HOME}" $app
	fi
done

echo ""
echo "#### Finished"