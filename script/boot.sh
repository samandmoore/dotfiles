#!/bin/bash
set -euo pipefail

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

function setup_git() {
  if [[ $OS = 'linux' ]]; then
    DISTRO=$(awk -F= '/^ID=/{print $2}' /etc/os-release)

    if [[ $DISTRO = 'ubuntu' ]]; then
      sudo apt install -y git
    elif [[ $DISTRO = 'arch' ]]; then
      pacman -Q git &>/dev/null || sudo pacman -S --noconfirm --needed git
    else
      echo "Unsupported OS: '$DISTRO'"
      exit 1
    fi
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
