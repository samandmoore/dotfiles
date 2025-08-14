#!/usr/bin/env bash
set -euo pipefail

paru -S --noconfirm --needed \
  docker \
  docker-compose \
  docker-buildx \
  lazydocker

# Limit log size to avoid running out of disk
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Give this user privileged Docker access
sudo usermod --append --groups docker "$USER"

# Prevent Docker from preventing boot for network-online.target
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/no-block-boot.conf <<'EOF'
[Unit]
DefaultDependencies=no
EOF
