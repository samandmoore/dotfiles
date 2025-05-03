# command line utilities
sudo apt install -y \
  fzf \
  ripgrep \
  bat \
  eza \
  zoxide \
  plocate \
  btop \
  apache2-utils \
  fd-find \
  tldr \
  rcm \
  tmux \
  starship

# build libraries / tools
sudo apt install -y \
  build-essential pkg-config autoconf bison clang \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
  gir1.2-gtop-2.0 gir1.2-clutter-1.0 \
  libpq-dev postgresql-client postgresql-client-common

source app-github-cli.sh
source app-lazygit.sh
source app-alacritty.sh
source app-mise.sh

# Provides a system clipboard interface for Neovim under Wayland
sudo apt install wl-clipboard

source fonts.sh

# Gives you previews in the file manager when pressing space
sudo apt install -y gnome-sushi

# managing gnome settings
sudo apt install -y gnome-tweak-tool

source app-neovim.sh
source app-signal.sh
source app-vscode.sh
source ulauncher.sh
source set-gnome-extensions.sh
source set-gnome-hotkeys.sh
