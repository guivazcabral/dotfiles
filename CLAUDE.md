# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a macOS development environment. Configs are symlinked into `~/.config/` (or tool-specific locations). No build system or tests — changes take effect after relinking or reloading the relevant tool.

## Installation

`./install.sh` handles brew packages (see `Readme.md`), symlinks, macOS defaults, the input-device LaunchAgent, the shell change, and gitconfig include. Re-runnable / idempotent.

For manual symlinks, mirror what `create_symlinks` does in `install.sh`. Lazygit / lazydocker use non-standard paths (`~/Library/Application Support/...`).

Neovim deps that aren't part of the dotfiles tree: `tree-sitter-cli` (required by nvim-treesitter's `main` branch), `ripgrep`, `fzf` — all in the brew package list. `jsonlint` is installed separately via `npm install -g jsonlint`.

## Architecture

**Terminal:** Ghostty is the primary terminal (Wezterm and Kitty configs are kept). Both Ghostty and Wezterm launch plain Fish — the tmux / Zellij autostart lines are commented out. Tmux (plugins via TPM, not tracked) and Zellij are both configured.

**Window management:** AeroSpace (tiling WM) with Karabiner-Elements for key remapping. `install.sh` remaps the macOS ctrl-cmd-F fullscreen shortcut to avoid AeroSpace conflicts.

**Fish custom modules** (`fish/custom/`), sourced explicitly from `fish/config.fish` — add a `source` line when creating a new one:
- `abbrs/misc.fish` — command abbreviations (e.g. `lg`→lazygit, `nv`→nvim, `ls`→eza)
- `zellij.fish` — Zellij abbreviations + auto-renaming of tabs by git repo name
- `git.fish` — fzf-powered branch search (`gfsb`) and commit picker (`fcommit`)
- `fnm.fish` — FNM (Fast Node Manager) init; no NVM
- `chrome.fish` — `xchrome`, launches Chrome with web security disabled
- `secrets.fish` — gitignored env vars

**macOS helpers** (`macos/`): `force-input-device.swift` is compiled by `install.sh` to `~/.local/bin/force-input-device` and run by the `com.gui.force-input-device` LaunchAgent (symlinked into `~/Library/LaunchAgents`). It keeps the QuadCast as default input unless AirPods are active.

**Neovim** uses Lazy.nvim with configs split across:
- `lua/custom/plugins/` — individual plugin configs
- `lua/after/plugins/` — autocmds and keymappings
- `lua/options.lua` — core settings

## Theme

All visual tools use **Catppuccin Mocha** for consistency: Ghostty, Wezterm, Tmux, Zellij, Oh-My-Posh, Lazygit, Bat, Hunk. When adding new tool configs, follow this theme.

## Prompt Engine

Oh-My-Posh (not Starship). The `starship.toml` at root is kept but unused — Oh-My-Posh is initialized in `fish/config.fish`.
