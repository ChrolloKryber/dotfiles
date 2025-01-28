#!/usr/bin/env bash
location=~/Pictures/Screenshots/Screenshot_$(date +%Y%m%d-%H%M%S).png
grimblast save area "${location}" && swappy -f "${location}" && notify-send -a "Grimblast" "Screenshot saved" -t 2000 -u low -r 85
