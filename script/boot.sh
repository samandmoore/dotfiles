#!/bin/bash
set -euo pipefail

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

function setup_git() {
  if [[ $OS = 'linux' ]]; then
    pacman -Q git &>/dev/null || sudo pacman -S --noconfirm --needed git
  elif [[ $OS = 'darwin' ]]; then
    # nothing to do, git comes pre-installed on macOS
    echo 'macOS detected (git pre-installed)'
  else
    echo "Unsupported OS: '$OS'"
    exit 1
  fi
}

function setup_dotfiles() {
  echo "Cloning dotfiles..."
  git clone https://github.com/samandmoore/dotfiles ~/.dotfiles >/dev/null
  ~/.dotfiles/script/setup.sh
}

setup_git
setup_dotfiles
