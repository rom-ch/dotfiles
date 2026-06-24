#!/bin/bash

set -euo pipefail

echo "Copying dotfiles"
cd ~/dotfiles/stow
stow -t ~ *
