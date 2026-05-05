# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a macOS development environment. Configs are symlinked into `~/.config/` (or tool-specific locations). No build system or tests — changes take effect after relinking or reloading the relevant tool.

## Installation

`./install.sh` handles brew packages (see `Readme.md`), symlinks, macOS defaults, and the shell change. Re-runnable / idempotent.

For manual symlinks, mirror what `create_symlinks` does in `install.sh`. Lazygit / lazydocker use non-standard paths (`~/Library/Application Support/...`).

Neovim deps that aren't part of the dotfiles tree: `tree-sitter-cli` (required by nvim-treesitter's `main` branch), `ripgrep`, `fzf` — all in the brew package list. `jsonlint` is installed separately via `npm install -g jsonlint`.

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
