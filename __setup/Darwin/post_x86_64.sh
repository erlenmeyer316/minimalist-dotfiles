#!/usr/bin/env bash

# update sudoers file for yabai
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

# start yabai
echo "Starting yabai"

# start skhd
echo "Starting skhd"

# start sketchybar
echo "Starting sketchybar"


