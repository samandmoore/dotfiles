#!/usr/bin/env bash
set -euo pipefail

mkdir -p ~/.local/share/fonts

if ! fc-list | grep -qi "IntoneMono Nerd Font"; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IntelOneMono.zip
  unzip IntelOneMono.zip -d IntelOneMono
  cp IntelOneMono/*.ttf ~/.local/share/fonts
  rm -rf IntelOneMono.zip IntelOneMono
  fc-cache
  cd -
fi
