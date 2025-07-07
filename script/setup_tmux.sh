#!/bin/bash
set -euo pipefail

function setup_tmux() {
  if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo 'Installing tmux tools'
    mkdir -p ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux start-server
    tmux new-session -d
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
  fi
}

setup_tmux
