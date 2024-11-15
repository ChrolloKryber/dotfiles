#!/usr/bin/env bash
location=~/Pictures/Screenshots/Screenshot_$(date +%Y%m%d-%H%M%S).png
grimblast save area "${location}" && swappy -f "${location}" && notify-send -a "Grimblast" "Screenshot saved" -t 5000 -u normal 
