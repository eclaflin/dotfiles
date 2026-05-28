# dotfiles

My personal Arch Linux dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Tooling

| Tool | Purpose |
|------|---------|
| [Zsh](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/) | Shell, `robbyrussell` theme |
| [Neovim](https://neovim.io/) | Editor, configured in Lua with [lazy.nvim](https://github.com/folke/lazy.nvim) |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [eza](https://github.com/eza-community/eza) | Modern `ls` replacement |
| [bat](https://github.com/sharkdp/bat) | Modern `cat` replacement |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder with shell integration |

## Structure

Each top-level directory is a Stow package. `stow <package>` creates symlinks in `~` mirroring the package's directory tree.

```
dotfiles/
├── zsh/
│   └── .zshrc
├── nvim/
│   └── .config/nvim/
│       └── init.lua
└── tmux/
    └── .tmux.conf
```

## Installation

**Prerequisites:** `git`, `stow`, and the tools listed above installed on an Arch system.

```bash
git clone https://github.com/ericclaflin/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow individual packages
stow zsh
stow nvim
stow tmux

# Or stow everything at once
stow */
```

> **Note:** If a config file already exists at the symlink target (e.g. `~/.zshrc`), Stow will error. Back up or remove the existing file first.

## Highlights

### Zsh

- `ls` → `eza --icons`, `ll` → `eza -lah --icons`, `lt` → `eza --tree --icons`
- `cat` → `bat`
- `fzf` shell integration (Ctrl+R history search, Ctrl+T file search, Alt+C cd)
- `$EDITOR` set to `nvim`

### Neovim

- [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager, bootstrapped automatically on first launch
- Space as leader key
- Relative line numbers, 2-space indentation, persistent undo, no swap files

### tmux

- Windows and panes indexed from 1
- `|` / `-` to split horizontally / vertically (preserves current path)
- Vim-style pane navigation: `prefix + h/j/k/l`
- Mouse support, 10k line scrollback
- `prefix + r` to reload config live

## Adding a new package

```bash
mkdir -p ~/dotfiles/<tool>/
# Mirror the config path relative to ~
# e.g. for ~/.config/foo/config.toml:
mkdir -p ~/dotfiles/<tool>/.config/foo/
mv ~/.config/foo/config.toml ~/dotfiles/<tool>/.config/foo/
stow <tool>
```

## License

[MIT](LICENSE)
