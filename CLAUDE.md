# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a macOS development environment. Configs are symlinked into `~/.config/` (or tool-specific locations). No build system or tests — changes take effect after relinking or reloading the relevant tool.

## Installation

Manual symlinks only (no install script):

```sh
ln -s ~/dev/dotfiles/fish ~/.config/fish
ln -s ~/dev/dotfiles/nvim ~/.config/nvim
ln -s ~/dev/dotfiles/zellij ~/.config/zellij
ln -s ~/dev/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dev/dotfiles/karabiner ~/.config/karabiner
```

Lazygit uses a non-standard path:
```sh
ln -s ~/dev/dotfiles/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
```

Neovim requires separate utilities: `brew install ripgrep fzf` and `npm install jsonlint -g`.

## Architecture

**Launch chain:** Wezterm → Fish → Zellij → (Neovim, Lazygit, etc.)

Wezterm's `default_prog` launches Fish with Zellij, so the terminal always starts inside Zellij. Fish sources all custom modules from `~/.config/fish/custom/` at startup.

**Fish custom modules** (`fish/custom/`):
- `abbrs/` — command abbreviations (e.g. `lg`→lazygit, `nv`→nvim, `ls`→eza)
- `zellij.fish` — Zellij abbreviations + auto-renaming of tabs by git repo name
- `git.fish` — fzf-powered branch search (`gfsb`) and commit picker (`fcommit`)
- `fnm.fish` — FNM (Fast Node Manager) init; no NVM
- `secrets.fish` — gitignored env vars

**Neovim** uses Lazy.nvim with configs split across:
- `lua/custom/plugins/` — individual plugin configs
- `lua/after/plugins/` — autocmds and keymappings
- `lua/options.lua` — core settings

## Theme

All visual tools use **Catppuccin Mocha** for consistency: Wezterm, Zellij, Oh-My-Posh, Lazygit, Bat. When adding new tool configs, follow this theme.

## Prompt Engine

Oh-My-Posh (not Starship). The `starship.toml` at root is kept but unused — Oh-My-Posh is initialized in `fish/config.fish`.
