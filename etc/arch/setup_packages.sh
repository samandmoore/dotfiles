#!/usr/bin/env bash
set -euo pipefail

paru -S --noconfirm --needed \
  gum \
  wget curl unzip inetutils impala \
  fd eza fzf ripgrep zoxide bat \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate bash-completion \
  mise github-cli lazygit \
  starship rcm yazi \
  kitty \
  nvim luarocks tree-sitter-cli \
  ttf-font-awesome \
  noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra \
  ttf-cascadia-mono-nerd \
  brightnessctl playerctl \
  blueberry bluetui \
  pamixer pavucontrol wireplumber wiremix \
  wl-clip-persist clipse \
  slurp satty \
  power-profiles-daemon \
  hyprland hyprshot hyprpicker hyprlock hypridle polkit-gnome hyprland-qtutils \
  walker-bin libqalculate waybar mako swaybg swayosd \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  uwsm plymouth \
  gnome-themes-extra kvantum-qt5 \
  chromium \
  signal-desktop \
  spotify \
  spotify-player \
  zoom \
  obsidian-bin \
  1password-beta 1password-cli gnome-keyring \
  pinta \
  imv mpv evince \
  ufw ufw-docker \
  docker \
  docker-compose \
  docker-buildx \
  lazydocker
