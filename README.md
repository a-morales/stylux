# Stylux

A simple and lightweight tool for styling tmux.

### Features
  - No external dependencies, written in bash
  - Status bar configuration is within `.tmux.conf`
  - Easy to configure
  - Support powerline fonts
  - Works with other `TPM` plugins

### Usage

- Configuring Stylux is done by setting variables in `.tmux.conf`. the list of variables and their defaults are:
  ```
    # seperators to use for the status bar
    # powerline will use the powerline seperators
    @seperators "powerline"
    @seperators "block"
    @seperators "dithered"

    # main background and foreground colors
    @bg-color "black"
    @fg-color "white"

    # colors used for styling of status bar, window statuses, and pane divisions
    # primary color is used for current active window and highlight active pane
    # secondary color is used for activities in other windows
    @primary-color "green"
    @secondary-color "blue"

    # order of colors to display in status line, ordered by outermost to inmost
    @left-bg-list "green, blue"
    @left-fg-list "black, black"
    @right-bg-list "green, blue"
    @right-fg-list "black, black"
  ```

- Use `|` to specify new sections in the status-bar and `,` to specify subsections:
- basic usage:
  ```
  ## \ at end of line in tmux.conf denotes continue command on next line
  set -g status-left "#S.#I.#P | foo , bar, baz | #h"
  ```

  will result in ![left status](./images/left-status.png)

- using tpm plugins (like [tmux-battery](https://github.com/tmux-plugins/tmux-battery))
  ```
  set -g status-right "#{battery_icon} #{battery_percentage} | %d %b %Y - %H:%M %p"
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

### Testing

The code is tested using the [bats](https://github.com/sstephenson/bats) testing framework.
To run the test suite, just run the following command once `bats` in installed:
  ```bash
  $ bats test
  ```

### Why another powerline clone?
  - [powerline](https://github.com/powerline/powerline) is to complicated and bloated for my needs
    - I want something lightweight
    - I want something non-obtrusive
  - I prefer to be able to update/modify my tmux configuration as quickly as possible
  - I prefer to keep my configurations as compact as possible.
