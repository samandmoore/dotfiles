#!/bin/bash
set -euo pipefail

function setup_shell() {
  if [[ "$SHELL" != '/opt/homebrew/bin/bash' ]]; then
    echo 'Current shell is not homebrew bash, switching...'
    if ! grep -q '/opt/homebrew/bin/bash' /etc/shells; then
      echo 'Homebrew bash shell is not in shells list, adding...'
      echo '/opt/homebrew/bin/bash' | sudo tee -a /etc/shells
    fi
    chsh -s /opt/homebrew/bin/bash
  fi
}

function setup_homebrew() {
  if ! type brew >/dev/null 2>&1; then
    echo 'Installing brew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  if [[ -f ~/.Brewfile ]]; then
    echo 'Installing brew dependencies'
    brew update
    brew bundle --global
  elif [[ -f "$DOTFILES/tag-darwin/Brewfile" ]]; then
    echo 'Installing brew dependencies'
    # on first run, rcup hasn't run yet, so
    # let's brew bundle from a special location
    brew update
    brew bundle --file="$DOTFILES/tag-darwin/Brewfile" || true
  fi
}

function setup_defaults() {
  source "$DOTFILES/etc/macos/defaults.sh"
}

setup_homebrew
setup_shell
