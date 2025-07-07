#!/bin/bash
set -euo pipefail

DISTRO=$(awk -F= '/^ID=/{print $2}' /etc/os-release)

if [[ $DISTRO = 'ubuntu' ]]; then
  echo 'Ubuntu detected'
  source "$DOTFILES/etc/ubuntu/setup.sh"
elif [[ $OS = 'arch' ]]; then
  source "$DOTFILES/etc/arch/setup.sh"
else
  echo "Unsupported OS: '$OS'"
  exit 1
fi
