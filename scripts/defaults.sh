#!/usr/bin/env bash

setDefaults() {
  tmux set-option -g message-command-style "fg=white,bg=black"
  tmux set-option -g message-style "fg=white,bg=black"
  tmux set-option -g status-style "fg=white,bg=black"
  tmux set-option -g window-status-current-style "fg=black,bg=green"
  tmux set-option -g window-style "fg=white,bg=black"
  tmux set-option -g window-status-bell-style "fg=black,bg=blue"
  tmux set-option -g window-status-activity-style "fg=black,bg=red"
}
