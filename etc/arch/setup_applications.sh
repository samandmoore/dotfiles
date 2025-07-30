#!/usr/bin/env bash
set -euo pipefail

mkdir -p ~/.local/share/applications
cp ~/.dotfiles/etc/arch/applications/*.desktop ~/.local/share/applications/
cp ~/.dotfiles/etc/arch/applications/hidden/*.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications

source ~/.dotfiles/config/bash/functions
web2app "YouTube" https://youtube.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube.png
web2app "GitHub" https://github.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/github-light.png
