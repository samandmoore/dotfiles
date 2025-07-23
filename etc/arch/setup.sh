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
# emoji support
paru -Sy --noconfirm --needed \
  ttf-font-awesome \
  noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra

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
  zoom \
  obsidian-bin \
  1password-beta 1password-cli gnome-keyring \
  pinta

# firewall stuff
if ! command -v ufw &>/dev/null; then
  paru -S --noconfirm --needed ufw ufw-docker

  # Allow nothing in, everything out
  sudo ufw default deny incoming
  sudo ufw default allow outgoing

  # Allow ports for LocalSend
  sudo ufw allow 53317/udp
  sudo ufw allow 53317/tcp

  # Allow SSH in
  sudo ufw allow 22/tcp

  # Allow Docker containers to use DNS on host
  sudo ufw allow in on docker0 to any port 53

  # Turn on the firewall
  sudo ufw enable

  # Turn on Docker protections
  sudo ufw-docker install
  sudo ufw reload
fi

mkdir -p ~/.local/share/applications
cp ~/.dotfiles/etc/arch/applications/*.desktop ~/.local/share/applications/
cp ~/.dotfiles/etc/arch/applications/hidden/*.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications

source ~/.dotfiles/config/bash/functions
web2app "YouTube" https://youtube.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube.png
web2app "GitHub" https://github.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/github-light.png
