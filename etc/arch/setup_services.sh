#!/usr/bin/env bash
set -euo pipefail

systemctl --user enable --now waybar.service
systemctl --user enable --now mako.service
systemctl --user enable --now swaybg.service
systemctl --user enable --now swayosd.service
systemctl --user enable --now polkit-gnome.service
systemctl --user enable --now hypridle.service
systemctl --user enable --now wl-clip-persist.service
systemctl --user enable --now clipse.service
