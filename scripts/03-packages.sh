#!/bin/bash

set -euo pipefail

sudo pacman -S --needed - < packages/pacman.txt
yay -S --needed - packages/aur.txt
