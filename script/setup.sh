#!/bin/bash
set -euo pipefail

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
DOTFILES=~/.dotfiles

function setup_os() {
  if [[ $OS = 'linux' ]]; then
    echo 'Linux detected'
    source "$DOTFILES/script/setup_linux.sh"
  elif [[ $OS = 'darwin' ]]; then
    echo 'macOS detected'
    source "$DOTFILES/script/setup_macos.sh"
  else
    echo "Unsupported OS: '$OS'"
    exit 1
  fi
}

function setup_dotfiles() {
  echo 'Setting up dotfiles'
  "$DOTFILES"/bin/rcs --up
}

function setup_tools() {
  echo 'Installing tools'
  mise install --install-missing
}

function setup_theme() {
  "$DOTFILES"/bin/theme --change catppuccin-macchiato
}

setup_os
setup_dotfiles
setup_tools
setup_theme
