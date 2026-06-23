#1/bin/bash

set -euo pipefail

run() {
  echo
  echo "==> Running $1..."
  bash "scripts/$1.sh"
}

run "02-yay"
run "03-packages"

echo
echo "Setup complete"
