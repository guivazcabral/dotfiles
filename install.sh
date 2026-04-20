#!/bin/bash
set -euo pipefail

XDG_CONFIG_HOME="$HOME/.config"
DOTFILES_DIR="$HOME/dev/dotfiles"

create_symlinks() {
  echo "Creating symlinks..."
  mkdir -p "$XDG_CONFIG_HOME"

  local config_dirs=(
    bat
    fish
    ghostty
    tmux
    oh-my-posh
    k9s
    kitty
    zellij
    nvim
    karabiner
    wezterm
  )
  for dir in "${config_dirs[@]}"; do
    echo "> Creating symlink for $dir"
    ln -sfn "$DOTFILES_DIR/$dir" "$XDG_CONFIG_HOME/$dir"
  done

  echo "> Creating symlink for lazygit"
  mkdir -p "$HOME/Library/Application Support/lazygit"
  ln -sfn "$DOTFILES_DIR/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
  echo "> Creating symlink for lazydocker"
  mkdir -p "$HOME/Library/Application Support/lazydocker"
  ln -sfn "$DOTFILES_DIR/lazydocker/config.yml" "$HOME/Library/Application Support/lazydocker/config.yml"
}

override_mac_defaults() {
  echo "Setting macOS defaults..."
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write -g KeyRepeat -int 1
  defaults write -g InitialKeyRepeat -int 10

  # Disable auto-capitalization
  defaults write -g NSAutomaticCapitalizationEnabled -bool false

  # Disable smart quotes and dashes
  defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

  # Only show scrollbars when scrolling
  defaults write -g AppleShowScrollBars -string "WhenScrolling"

  # Enable three-finger drag (Accessibility > Pointer Control > Trackpad Options)
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

  # Dark mode
  defaults write -g AppleInterfaceStyle -string "Dark"

  # Hide battery from menu bar
  defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool false

  # Dock
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock tilesize -int 52
  defaults write com.apple.dock minimize-to-application -bool true
  defaults write com.apple.dock show-recents -bool false
  defaults write com.apple.dock mineffect -string "scale"
  killall Dock

  # Finder
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  defaults write com.apple.finder NewWindowTarget -string "PfHm"
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  killall Finder
}

install_brew_packages() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew already installed, skipping."
  fi

  # Make brew available in the current shell session (installer only writes
  # the shellenv into ~/.zprofile, which doesn't apply until a new shell).
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "ERROR: brew not found on PATH after install. Aborting." >&2
    exit 1
  fi

  brew update
  echo "Installing Homebrew packages..."

  packages=(
    bat
    eza
    fish
    fnm
    fzf
    jandedobbeleer/oh-my-posh/oh-my-posh
    lazygit
    lazydocker
    neovim
    ripgrep
    tmux
    zellij
    k9s
    git-delta
  )
  brew install ${packages[@]}

  casks=(
    ghostty
    karabiner-elements
  )
  brew install --cask ${casks[@]}
}

change_shell_to_fish() {
  echo "Changing shell to fish..."
  local fish_path
  fish_path="$(command -v fish || true)"
  if [ -z "$fish_path" ] || [ ! -x "$fish_path" ]; then
    echo "ERROR: fish not found on PATH. Skipping shell change to avoid locking you out." >&2
    return 1
  fi
  if ! grep -qxF "$fish_path" /etc/shells; then
    echo "$fish_path" | sudo tee -a /etc/shells
  fi
  chsh -s "$fish_path"
}

setup_gitconfig() {
  echo "Setting up gitconfig..."
  git config --global user.name "Gui Cabral"
  sed '1,2s/^..//' $DOTFILES_DIR/.gitconfig | head -n 2 >> $HOME/.gitconfig
  echo "dotfiles/.gitconfig included successfully in global config"
}

print_manual_steps() {
  echo ""
  echo "========================================"
  echo " Manual steps (cannot be scripted)"
  echo "========================================"
  echo ""
  echo "Keyboard Shortcuts (System Settings > Keyboard > Keyboard Shortcuts):"
  echo "  - Spotlight: disable all Spotlight shortcuts (using Raycast instead)"
  echo "  - Screenshots: disable all screenshot shortcuts (using third-party app)"
  echo ""
  echo "Raycast:"
  echo "  - Install from https://raycast.com and set shortcut to Cmd+Space"
  echo ""
  echo "========================================"
}

# Main function to execute the bootstrap process
bootstrap() {
  install_brew_packages
  create_symlinks
  override_mac_defaults
  change_shell_to_fish
  setup_gitconfig
  print_manual_steps

  echo "Dotfiles bootstrapped successfully! Restart your Mac for the changes to take effect."
}

# Execute the bootstrap process
bootstrap
