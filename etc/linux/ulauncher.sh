gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] http://ppa.launchpad.net/agornostal/ulauncher/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/ulauncher-noble.list

sudo apt update -y
sudo apt install -y ulauncher

# Start ulauncher to have it populate config before we overwrite
# mkdir -p ~/.config/autostart/
# cp ~/.dotfiles/etc/linux/applications/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
#
# [Desktop Entry]
# Name=Ulauncher
# Comment=Application launcher for Linux
# GenericName=Launcher
# Categories=GNOME;GTK;Utility;
# TryExec=/usr/bin/ulauncher
# Exec=env GDK_BACKEND=wayland /usr/bin/ulauncher --hide-window --hide-window
# Icon=ulauncher
# Terminal=false
# Type=Application
# X-GNOME-Autostart-enabled=true
#
# gtk-launch ulauncher.desktop >/dev/null 2>&1
# sleep 2 # ensure enough time for ulauncher to set defaults
# cp ~/.dotfiles/etc/linux/ulauncher.json ~/.config/ulauncher/settings.json
