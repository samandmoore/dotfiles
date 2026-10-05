#!/bin/bash
set -euo pipefail

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
DOTFILES=~/.dotfiles

trap on_script_error ERR

function on_script_error() {
  local exit_code="$?"
  say_error "Command '$BASH_COMMAND' failed at ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
  exit "$exit_code"
}

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
  "$DOTFILES"/bin/robot dotfiles up
}

# Shared git config lives in config/git/config (linked to ~/.config/git/config).
# ~/.gitconfig is a plain, untracked file for machine-specific settings; git
# reads it after the XDG config (so it wins) and `git config --global` writes
# to it, keeping tool-driven edits out of this repo.
function setup_gitconfig() {
  # remove the legacy symlink into this repo
  if [[ -L ~/.gitconfig ]]; then
    echo 'Removing legacy ~/.gitconfig symlink'
    rm ~/.gitconfig
  fi

  if [[ ! -e ~/.gitconfig ]]; then
    if [[ -f ~/.gitconfig.local ]]; then
      echo 'Migrating ~/.gitconfig.local to ~/.gitconfig'
      mv ~/.gitconfig.local ~/.gitconfig
    else
      echo 'Creating empty ~/.gitconfig'
      touch ~/.gitconfig
    fi
  fi
}

function setup_claude() {
  echo 'Setting up Claude'
  "$DOTFILES"/bin/claude-setup
}

function setup_tools() {
  echo 'Installing tools'
  mise settings add idiomatic_version_file_enable_tools java
  mise settings add idiomatic_version_file_enable_tools node
  mise settings add idiomatic_version_file_enable_tools python
  mise settings add idiomatic_version_file_enable_tools ruby

  # install preferred tool versions
  mise use --global \
    usage@latest \
    node@latest \
    python@latest \
    ruby@latest \
    rust@latest

  # set up global versions of common tools
  mise use --global \
    cargo:https://github.com/samandmoore/git-up@tag:v0.2.0 \
    cargo:presenterm
}

function setup_theme() {
  "$DOTFILES"/bin/robot theme set "Catppuccin Macchiato"
}

function setup_gh_extensions() {
  echo 'Installing gh extensions'
  if ! gh extension list | grep --quiet 'github/gh-stack'; then
    gh extension install github/gh-stack
  fi
}

setup_os
setup_dotfiles
setup_gitconfig
setup_claude
setup_tools
setup_theme
setup_gh_extensions
