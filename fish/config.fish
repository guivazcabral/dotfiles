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
source ~/.config/fish/custom/chrome.fish
source ~/.config/fish/custom/fnm.fish
source ~/.config/fish/custom/git.fish
source ~/.config/fish/custom/kitty.fish
source ~/.config/fish/custom/zellij.fish

source ~/.config/fish/custom/abbrs/misc.fish

if test -e ~/.config/fish/custom/secrets.fish
    source ~/.config/fish/custom/secrets.fish
end

status --is-interactive; and rbenv init - fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
