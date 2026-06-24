#!/bin/bash

set -euo pipefail

echo "Downloading pacman packages..."
sudo pacman -S --needed - < packages/pacman.txt

echo "Downloading AUR packages"
yay -S --needed - packages/aur.txt

cpu_vendor=$(grep -m1 'vendor_id' /proc/cpuinfo | awk '{print $3}'})

case "$cpu_vendor" in
  GenuineIntel)
    echo "Intel CPU detected"
    sudo pacman -S --needed intel-ucode
    ;;

  AuthenticAMD)
    echo "AMD CPU detected"
    sudo pacman -S --needed amd-ucode
    ;;

  *)
    echo "Unknown CPU vendor": $cpu_vendor
    exit 1
    ;;
  esac
