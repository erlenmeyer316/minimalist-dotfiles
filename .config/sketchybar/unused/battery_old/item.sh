#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery/scripts/battery.sh"
  #icon.font="$FONT:Bold:13.0"
  #label.font="$FONT:Regular:19.0"
  padding_right=0
  padding_left=0
  update_freq=120
  updates=on
  click_script="open /System/Library/PreferencePanes/Battery.prefPane/"
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
