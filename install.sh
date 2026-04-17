#!/bin/bash

XDG_CONFIG_HOME="$HOME/.config"
DOTFILES_DIR="$HOME/dev/dotfiles"

create_symlinks() {
  echo "Creating symlinks..."
  echo "> Creating symlink for bat"
  ln -sf $DOTFILES_DIR/bat $XDG_CONFIG_HOME/bat
  echo "> Creating symlink for fish"
  ln -sf $DOTFILES_DIR/fish $XDG_CONFIG_HOME/fish
  echo "> Creating symlink for ghostty"
  ln -sf $DOTFILES_DIR/ghostty $XDG_CONFIG_HOME/ghostty
  echo "> Creating symlink for tmux"
  ln -sf $DOTFILES_DIR/tmux $XDG_CONFIG_HOME/tmux
  echo "> Creating symlink for oh-my-posh"
  ln -sf $DOTFILES_DIR/oh-my-posh $XDG_CONFIG_HOME/oh-my-posh
  echo "> Creating symlink for k9s"
  ln -sf $DOTFILES_DIR/k9s $XDG_CONFIG_HOME/k9s
  echo "> Creating symlink for kitty"
  ln -sf $DOTFILES_DIR/kitty $XDG_CONFIG_HOME/kitty
  echo "> Creating symlink for zellij"
  ln -sf $DOTFILES_DIR/zellij $XDG_CONFIG_HOME/zellij
  echo "> Creating symlink for nvim"
  ln -sf $DOTFILES_DIR/nvim $XDG_CONFIG_HOME/nvim
  echo "> Creating symlink for karabiner"
  ln -sf $DOTFILES_DIR/karabiner $XDG_CONFIG_HOME/karabiner
  echo "> Creating symlink for wezterm"
  ln -sf $DOTFILES_DIR/wezterm $XDG_CONFIG_HOME/wezterm
  echo "> Creating symlink for lazygit"
  mkdir -p "$HOME/Library/Application Support/lazygit"
  ln -sf $DOTFILES_DIR/lazygit/config.yml "$HOME/Library/Application Support/lazygit/config.yml"
  echo "> Creating symlink for lazydocker"
  mkdir -p "$HOME/Library/Application Support/lazydocker"
  ln -sf $DOTFILES_DIR/lazydocker/config.yml "$HOME/Library/Application Support/lazydocker/config.yml"
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
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
  echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/bin/fish
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
