# Dotfiles

Eric's dotfiles for Arch Linux, managed with GNU Stow.

## Structure

Each top-level directory is a Stow package. Running `stow <package>` from `~/dotfiles/` creates symlinks in `~` that mirror the package's directory tree.

```
dotfiles/
├── zsh/
│   └── .zshrc              → ~/.zshrc
├── nvim/
│   └── .config/nvim/       → ~/.config/nvim/
│       └── init.lua
└── tmux/
    └── .tmux.conf          → ~/.tmux.conf
```

## Adding a new tool

1. Create a package directory: `mkdir -p ~/dotfiles/<tool>/`
2. Place config files inside it, mirroring where they live in `~`
3. Run `stow <tool>` from `~/dotfiles/`

## Managing existing configs

Edit files in `~/dotfiles/<package>/` directly — the symlinks mean changes are reflected immediately. Never edit the symlink targets in `~` directly (they're the same file, but editing in the dotfiles dir keeps intent clear).

## Stow tips

- `stow --simulate <package>` — dry run, shows what would be linked
- `stow -D <package>` — remove symlinks for a package (unstow)
- `stow -R <package>` — restow (unstow then stow again, useful after restructuring)

## Packages

| Package | Config | Notes |
|---------|--------|-------|
| `zsh` | `.zshrc` | oh-my-zsh, robbyrussell theme, eza/bat aliases, fzf integration |
| `nvim` | `.config/nvim/init.lua` | lazy.nvim plugin manager, greenfield config |
| `tmux` | `.tmux.conf` | Ctrl-b prefix, mouse on, vim-style pane nav |
