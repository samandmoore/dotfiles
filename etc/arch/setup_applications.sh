#!/usr/bin/env bash
set -euo pipefail

mkdir -p ~/.local/share/applications
cp ~/.dotfiles/etc/arch/applications/*.desktop ~/.local/share/applications/
cp ~/.dotfiles/etc/arch/applications/hidden/*.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications

~/.dotfiles/bin/arch-webapp-install "YouTube" https://youtube.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube.png
~/.dotfiles/bin/arch-webapp-install "GitHub" https://github.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/github-light.png
~/.dotfiles/bin/arch-webapp-install "Claude" https://claude.ai/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/claude-ai-light.png
