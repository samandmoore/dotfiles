#!/bin/bash
set -euo pipefail

# detect the linux distribution via /etc/os-release
DISTRO='unknown'
if [[ -r /etc/os-release ]]; then
  DISTRO=$(. /etc/os-release && echo "$ID")
fi

case "$DISTRO" in
arch)
  echo 'Arch detected'
  source "$DOTFILES/etc/arch/setup.sh"
  ;;
ubuntu)
  echo 'Ubuntu detected'
  source "$DOTFILES/etc/ubuntu/setup.sh"
  ;;
*)
  echo "Unsupported Linux distribution: '$DISTRO'"
  exit 1
  ;;
esac
