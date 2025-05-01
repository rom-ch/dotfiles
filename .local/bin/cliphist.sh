#!/bin/bash

cliphist list | rofi -dmenu -p "Search Clipboard" \
    -theme-str 'window {width: 40%; height: 50%;} listview {lines: 10;} element {padding: 10px;} * {font: "Fira Code 14";} inputbar {enabled: true;}' |
    cliphist decode | wl-copy
