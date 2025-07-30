#!/usr/bin/env bash
set -euo pipefail

systemctl --user enable --now waybar.service
systemctl --user enable --now mako.service
systemctl --user enable --now walker.service
systemctl --user enable --now swaybg.service
systemctl --user enable --now swayosd.service
systemctl --user enable --now polkit-gnome.service
systemctl --user enable --now clipboard.service
