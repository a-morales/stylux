#!/usr/bin/env bash

setDefaults() {
  tmux set-option -g message-command-style "fg=white,bg=black"
  tmux set-option -g message-style "fg=white,bg=black"
  tmux set-option -g status-style "fg=white,bg=black"
  tmux set-option -g window-status-current-style "fg=green,bg=black"
  tmux set-option -g window-style "fg=white,bg=black"
  tmux set-option -g window-status-bell-style "fg=blue,bg=black"
  tmux set-option -g window-status-activity-style "fg=red,bg=black"
}
