#!/usr/bin/env bash
xrdb -merge ~/.Xresources
urxvtd -o -q -f
exec i3
