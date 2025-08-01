#!/usr/bin/env bash
set -euo pipefail

systemctl --user enable --now waybar.service
systemctl --user enable --now mako.service
# i have issues running walker as a service, so nope
# systemctl --user enable --now walker.service
systemctl --user enable --now swaybg.service
systemctl --user enable --now swayosd.service
systemctl --user enable --now polkit-gnome.service
systemctl --user enable --now hypridle.service

