#!/bin/bash
set -euo pipefail

function setup_shell() {
  chsh -s /bin/bash
}

function setup_shell_after_homebrew() {
  if grep -q '/opt/homebrew/bin/bash' /etc/shells; then
    echo '/opt/homebrew/bin/bash' | sudo tee -a /etc/shells
  fi
  chsh -s /opt/homebrew/bin/bash
}

function setup_homebrew() {
  if ! type brew 2>/dev/null; then
    echo 'Installing brew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  if [ -f ~/.Brewfile ]; then
    echo 'Installing brew dependencies'
    brew update
    brew bundle --global
  elif [ -f "$DOTFILES/Brewfile" ]; then
    echo 'Installing brew dependencies'
    # on first run, rcup hasn't run yet, so
    # let's brew bundle from a special location
    brew update
    brew bundle --file="$DOTFILES/Brewfile" || true
  fi
}

function setup_defaults() {
  source "$DOTFILES/etc/macos/defaults.sh"
}

setup_shell
setup_homebrew
setup_shell_after_homebrew
