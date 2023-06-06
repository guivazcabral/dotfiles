if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

export PATH="/opt/homebrew/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR="nvim"
export SHELL="/opt/homebrew/bin/fish"

# init startship
export STARSHIP_CONFIG=/Users/guilherme/dev/dotfiles/starship.toml
starship init fish | source

# auto load nvm version on pwd change
load_nvm >/dev/stderr

export EDITOR=/usr/local/bin/nvim

# source custom files
source ~/.config/fish/custom/gsb.fish
source ~/.config/fish/custom/zellij.fish
source ~/.config/fish/custom/abbrs/misc.fish
