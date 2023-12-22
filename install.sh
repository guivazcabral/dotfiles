#!/bin/bash

XDG_CONFIG_HOME="$HOME/.config"
DOTFILES_DIR="$HOME/dev/dotfiles"

create_symlinks() {
  echo "Creating symlinks..."
  echo "Creating symlink for kitty"
  ln -sf $DOTFILES_DIR/kitty $XDG_CONFIG_HOME/kitty
  echo "Creating symlink for fish"
  ln -sf $DOTFILES_DIR/fish $XDG_CONFIG_HOME/fish
  echo "Creating symlink for omf"
  ln -sf $DOTFILES_DIR/omf $XDG_CONFIG_HOME/omf
  echo "Creating symlink for zellij"
  ln -sf $DOTFILES_DIR/zellij $XDG_CONFIG_HOME/zellij
  echo "Creating symlink for nvim"
  ln -sf $DOTFILES_DIR/nvim $XDG_CONFIG_HOME/nvim
  echo "Creating symlink for lazygit"
  ln -sf $DOTFILES_DIR/lazygit/config.yml $HOME/Library/Application\ Support/lazygit/config.yml
}

override_mac_defaults() {
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write -g KeyRepeat -int 1
  defaults write -g InitialKeyRepeat -int 10

  # Disable natural scrolling
  # defaults write -g com.apple.swipescrolldirection -bool false

  # Disable auto-correct
  # defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

  # Disable auto-capitalization
  defaults write -g NSAutomaticCapitalizationEnabled -bool false

  # Disable smart quotes and dashes
  # defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
  # defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

  # Only show scrollbars when scrolling
  defaults write -g AppleShowScrollBars -string "WhenScrolling"

  # Show all filename extensions
  defaults write -g AppleShowAllExtensions -bool true

  # Show hidden files in Finder
  # defaults write com.apple.finder AppleShowAllFiles -bool true
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
    fzf
    lazygit
    ripgrep
    zellij
  )
  brew install ${packages[@]}
}

change_shell_to_fish() {
  echo "Changing shell to fish..."
  echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/bin/fish
}

# Main function to execute the bootstrap process
bootstrap() {
  install_brew_packages
  create_symlinks
  override_mac_defaults
  change_shell_to_fish

  echo "Dotfiles bootstrapped successfully! Restart your Mac for the changes to take effect."
}

# Execute the bootstrap process
bootstrap
