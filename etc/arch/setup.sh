#!/usr/bin/env bash
set -euo pipefail

source ~/.dotfiles/etc/arch/setup_paru.sh

# useful for adding confirms and collecting input
paru -S --noconfirm --needed gum

# command line things
paru -S --noconfirm --needed \
  wget curl unzip inetutils impala \
  fd eza fzf ripgrep zoxide bat \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate bash-completion \
  mise github-cli lazygit \
  starship rcm yazi \
  kitty

# editor things
paru -S --noconfirm --needed \
  nvim luarocks tree-sitter-cli

# setup fonts
source ~/.dotfiles/etc/arch/setup_fonts.sh

# mgmt things
paru -S --noconfirm --needed \
  brightnessctl playerctl \
  blueberry bluetui \
  pamixer pavucontrol wireplumber wiremix \
  wl-clip-persist clipse \
  slurp satty

source ~/.dotfiles/etc/arch/setup_power.sh
# login stuff
source ~/.dotfiles/etc/arch/setup_login.sh

# gui / wm things
paru -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle polkit-gnome hyprland-qtutils \
  walker-bin libqalculate waybar mako swaybg swayosd \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  uwsm \
  gnome-themes-extra kvantum-qt5

# desktop things
paru -S --noconfirm --needed \
  chromium \
  signal-desktop \
  spotify \
  spotify-player \
  zoom \
  obsidian-bin \
  1password-beta 1password-cli gnome-keyring \
  pinta \
  imv mpv evince

# firewall stuff
source ~/.dotfiles/etc/arch/setup_firewall.sh

# setup applications
source ~/.dotfiles/etc/arch/setup_applications.sh

# enable user services
source ~/.dotfiles/etc/arch/setup_services.sh
