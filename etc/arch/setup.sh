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

# fonts and such
mkdir -p ~/.local/share/fonts

if ! fc-list | grep -qi "CaskaydiaMono Nerd Font"; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip CascadiaMono.zip -d CascadiaFont
  cp CascadiaFont/*.ttf ~/.local/share/fonts
  rm -rf CascadiaMono.zip CascadiaFont
  fc-cache
  cd -
fi

if ! fc-list | grep -qi "IntoneMono Nerd Font"; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IntelOneMono.zip
  unzip IntelOneMono.zip -d IntelOneMono
  cp IntelOneMono/*.ttf ~/.local/share/fonts
  rm -rf IntelOneMono.zip IntelOneMono
  fc-cache
  cd -
fi

# mgmt things
paru -S --noconfirm --needed \
  brightnessctl playerctl power-profiles-daemon \
  blueberry \
  pamixer pavucontrol wireplumber \
  wl-clip-persist clipse

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

# gui / wm things
paru -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle polkit-gnome hyprland-qtutils \
  wofi waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# desktop things
paru -S --noconfirm --needed \
  chromium \
  signal-desktop \
  spotify \
  zoom \
  obsidian-bin \
  1password-beta 1password-cli gnome-keyring \
  pinta

mkdir -p ~/.local/share/applications
cp ~/.dotfiles/etc/arch/applications/*.desktop ~/.local/share/applications/
# cp ~/.dotfiles/etc/arch/applications/hidden/*.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
