## Dotfiles

Welcome to my dotfiles 🎉 here you'll find (some of) the configuration I use in my personal dev env.
This is very personal, as it relies heavily on my preferences.
It is also ever-changing so don't expect this to be super up to date.

## Install

Clone this repo into `~/dev/dotfiles` and run:

```sh
./install.sh
```

The script will:

- Install Homebrew (if missing) and the packages/casks listed below
- Symlink every config folder into `~/.config` (and the non-standard paths for lazygit / lazydocker)
- Apply my macOS defaults (key repeat, trackpad, Dock, Finder, dark mode, etc.)
- Add fish to `/etc/shells` and set it as the default shell
- Set up `~/.gitconfig` to include this repo's gitconfig

The script is idempotent — re-running it will skip Homebrew if already installed, overwrite existing symlinks in place (no nested links), and skip `/etc/shells` entries that already exist.

### Brew packages

**Formulae:** `bat`, `eza`, `fish`, `fnm`, `fzf`, `git`, `git-delta`, `oh-my-posh`, `k9s`, `lazydocker`, `lazygit`, `neovim`, `ripgrep`, `tmux`, `tree-sitter-cli`, `zellij`

**Casks:** `ghostty`, `karabiner-elements`, `devtoys`

`tree-sitter-cli` is required by nvim-treesitter's `main` branch to compile parsers at runtime. `ripgrep` and `fzf` are required by Telescope and the fish git pickers.

### Manual steps

A few things can't be scripted. After the install script completes it prints a reminder for:

- **Keyboard Shortcuts** (System Settings > Keyboard > Keyboard Shortcuts): disable Spotlight and screenshot shortcuts
- **Raycast**: install from [raycast.com](https://raycast.com) and bind to `Cmd+Space`

Restart your Mac after the script finishes for all the defaults to take effect.

## What's configured

| Tool | Path |
| --- | --- |
| bat | `~/.config/bat` |
| fish | `~/.config/fish` |
| ghostty | `~/.config/ghostty` |
| k9s | `~/.config/k9s` |
| karabiner | `~/.config/karabiner` |
| kitty | `~/.config/kitty` |
| lazydocker | `~/Library/Application Support/lazydocker/config.yml` |
| lazygit | `~/Library/Application Support/lazygit/config.yml` |
| nvim | `~/.config/nvim` |
| oh-my-posh | `~/.config/oh-my-posh` |
| tmux | `~/.config/tmux` |
| wezterm | `~/.config/wezterm` |
| zellij | `~/.config/zellij` |

## Misc

Slack theme:

```
#11111B,#F8F8FA,#6C7086,#B4BEFE,#181825,#CDD6F4,#A6E3A1,#F38BA8,#11111B,#FAB387
```
