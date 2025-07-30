#!/usr/bin/env bash
set -euo pipefail

sudo pacman -S --needed --noconfirm base-devel

if ! command -v paru &>/dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/paru-bin.git
  cd paru-bin
  makepkg -si --noconfirm
  cd -
  rm -rf paru-bin
  cd ~
fi
