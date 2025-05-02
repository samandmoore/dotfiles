sudo apt install -y gnome-shell-extension-manager pipx
pipx install gnome-extensions-cli --system-site-packages

# Turn off default Ubuntu extensions
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

# Install new extensions
gext install tactile@lundal.io
gext install tophat@fflewddur.github.io
gext install clipboard-indicator@tudmoto.com

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com/schemas/org.gnome.shell.extensions.clipboard-indicator.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 8
gsettings set org.gnome.shell.extensions.tactile show-tiles "['<Control><Super>t']"

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons false
gsettings set org.gnome.shell.extensions.tophat show-cpu false
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-mem false
gsettings set org.gnome.shell.extensions.tophat show-fs false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

# Configure clipboard-indicator
gsettings set org.gnome.shell.extensions.clipboard-indicator history-size 20
gsettings set org.gnome.shell.extensions.clipboard-indicator display-mode 3
gsettings set org.gnome.shell.extensions.clipboard-indicator paste-on-select true
gsettings set org.gnome.shell.extensions.clipboard-indicator notify-on-cycle false
gsettings set org.gnome.shell.extensions.clipboard-indicator clear-history "@as []"
gsettings set org.gnome.shell.extensions.clipboard-indicator private-mode-binding "@as []"
gsettings set org.gnome.shell.extensions.clipboard-indicator toggle-menu "['<Shift><Super>v']"
