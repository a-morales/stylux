Stylux
======

A simple and lightweight tool for styling the status bar in tmux

Why
---
  - No external dependencies, written in bash
  - Status bar configuration can be within `.tmux.conf`
  - Easy to configure

Installation
------------
- Using [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
  - Add plugin to `.tmux.conf`: `set -g @plugin 'a-morales/stylux'`
  - Hit `prifix + I` to install the plugin and source it.
- Manual
  - Clone the repo:
  ```
  git clone https://github.com/a-morales/stylux ~/installation/path
  ```

  - Add the script to the bottom of `.tmux.conf`:
  ```
  run-shell ~/installation/path/stylux.tmux
  ```
  - Reload Tmux environment
