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
  brightnessctl playerctl power-profiles-daemon \
  blueberry \
  pamixer pavucontrol wireplumber wiremix \
  wl-clip-persist clipse \
  slurp satty

# setup bluetooth right away
sudo systemctl enable --now bluetooth.service

# set up power profiles
if ls /sys/class/power_supply/BAT* &>/dev/null; then
  # This computer runs on a battery
  powerprofilesctl set balanced || true
else
  # This computer runs on power outlet
  powerprofilesctl set performance || true
fi

# Login directly as user, rely on disk encryption + hyprlock for security
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --noclear %I \$TERM
EOF

tee -a ~/.bash_profile.local >/dev/null <<EOF
if uwsm check may-start; then
  exec uwsm start hyprland-uwsm.desktop
fi
EOF

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
  pinta

# firewall stuff
source ~/.dotfiles/etc/arch/setup_firewall.sh

# setup applications
source ~/.dotfiles/etc/arch/setup_applications.sh

# enable user services
source ~/.dotfiles/etc/arch/setup_services.sh

# disable power key off behavior in favor of menu binding
sudo sed -i 's/^#HandlePowerKey=poweroff$/HandlePowerKey=ignore/' /etc/systemd/logind.conf
sudo sed -i 's/^#PowerKeyIgnoreInhibited=no$/PowerKeyIgnoreInhibited=yes/' /etc/systemd/logind.conf
