#!/usr/bin/env bash

# Directory of adi1090x themes
dir="$HOME/.config/rofi/launchers/type-2/"
theme="style-1"  # same theme as your launcher

# Show clipboard history in rofi
cliphist list | rofi -dmenu -theme "${dir}/${theme}.rasi" | cliphist decode | wl-copy
