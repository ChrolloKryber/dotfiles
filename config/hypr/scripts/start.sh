#!/usr/bin/env bash

swww-daemon & disown
sleep 0.5
waybar & disown
~/.config/hypr/scripts/swww-random ~/Pictures/Ghibli

