# Stylux

A simple and lightweight tool for styling tmux.

### Features
  - No external dependencies, written in bash
  - Status bar configuration is within `.tmux.conf`
  - Easy to configure
  - Support powerline fonts
  - Works with other `TPM` plugins for the status bar

### Usage

- Configuring Stylux is done by setting user variables in `.tmux.conf`. the list of variables and their defaults are:
  ```
    # use for separations of sections in status bars
    set -g @left-seperator "⮀"
    set -g @right-seperator "⮂"

    # use for subsections in status bar sections
    set -g @left-subseperator "⮁"
    set -g @right-subseperator "⮃"

    # main background and foreground colors
    set -g @bg-color "black"
    set -g @fg-color "white"

    # colors used for styling of status bar, window statuses, and pane divisions
    # primary color is used for current active window and highlight active pane
    # secondary color is used for activities in other windows
    set -g @primary-color "green"
    set -g @secondary-color "blue"

    # order of colors to display in status line
    set -g @color-list "green, blue"

    # Strings for what to display in left and right status-bar
    # If not set, corresponding status-bar will not be touched
    set -g @left-status ""
    set -g @right-status ""
  ```

- To configure the status bars either the `@status-left` or `@status-right` variables will need to be set
- Use `|` to specify new sections in the status-bar and `,` to specify subsections:
- basic usage:
  ```
  ## \ at end of line in tmux.conf denotes continue command on next line
  set -g @left-status "\
    #S.#I.#P |\
    foo , bar, baz |\
    #h \
  "
  ```

  will result in ![left status](./images/left-status.png)

- using tpm plugins (like [tmux-battery](https://github.com/tmux-plugins/tmux-battery))
  ```
  set -g @right-status "\
    #{battery_icon} #{battery_percentage} |\
    %d %b %Y - %H:%M %p \
  "
  ```

  will result in ![right status](./images/right-status.png)

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- Add plugin to list of TPM plugins in `.tmux.conf`:
  ```
  set -g @plugin 'a-morales/stylux'
  ```

- Hit `prifix + I` to install the plugin and source it.

### Manual installation
- Clone the repo:
  ```bash
  $ git clone https://github.com/a-morales/stylux ~/installation/path
  ```

- Add this line to the bottom of `.tmux.conf`:
  ```
  run-shell ~/installation/path/stylux.tmux
  ```

- Reload Tmux environment
  ```bash
  $ tmux source-file ~/.tmux.conf
  ```

### Why another powerline clone?
  - [powerline](https://github.com/powerline/powerline) is to complicated and bloated for my needs
    - I want something lightweight
    - I want something non-obtrusive
  - I prefer to be able to update/modify my tmux configuration as quickly as possible
  - I prefer to keep my configurations as compact as possible.
