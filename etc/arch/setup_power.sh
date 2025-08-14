#!/usr/bin/env bash

paru -S --noconfirm --needed power-profiles-daemon

# set up power profiles
if ls /sys/class/power_supply/BAT* &>/dev/null; then
  # This computer runs on a battery
  powerprofilesctl set balanced || true
else
  # This computer runs on power outlet
  powerprofilesctl set performance || true
fi

# disable power key off behavior in favor of menu binding
sudo sed -i 's/^#HandlePowerKey=poweroff$/HandlePowerKey=ignore/' /etc/systemd/logind.conf
sudo sed -i 's/^#PowerKeyIgnoreInhibited=no$/PowerKeyIgnoreInhibited=yes/' /etc/systemd/logind.conf
