#!/usr/bin/env bash

set -g pane-active-border-style fg=colour50

setw -g window-status-current-format '#[fg=colour81,bg=colour238] #I#[fg=colour250] #[fg=colour255]#W#[fg=colour81]#F '
setw -g window-status-format '#[fg=colour138,bg=colour237] #I #[fg=colour250]#W#[fg=colour244]#F '

set -g status-interval 5
set -g status-justify left
set -g status-left ''
set -g status-right '#[fg=colour215]#S #[fg=colour249,bg=colour240] %m/%d #[fg=colour240,bg=colour249] %H:%M '
set -g status-right-length 50
set -g status-left-length 20
