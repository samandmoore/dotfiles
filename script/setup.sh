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
  "$DOTFILES"/bin/rcs up
}

function setup_tools() {
  echo 'Installing tools'
  mise settings add idiomatic_version_file_enable_tools java
  mise settings add idiomatic_version_file_enable_tools node
  mise settings add idiomatic_version_file_enable_tools python
  mise settings add idiomatic_version_file_enable_tools ruby

  # prefer to use temurin jdk
  mise alias add java 21 temurin-21.0.6+7.0.LTS

  # install preferred tool versions
  mise install --cd "$DOTFILES/etc"

  # set up global versions of common languages
  mise use --global node@latest
  mise use --global python@latest
  mise use --global ruby@latest

  # set up global versions of common tools
  mise use --global cargo:https://github.com/samandmoore/git-up@tag:v0.2.0
  mise use --global cargo:presenterm
}

function setup_theme() {
  "$DOTFILES"/bin/theme set "Catppuccin Macchiato"
}

setup_os
setup_dotfiles
setup_tools
setup_theme
