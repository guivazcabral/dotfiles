if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

# init startship
export STARSHIP_CONFIG=/Users/guilherme/dev/dotfiles/starship.toml
starship init fish | source

# auto load nvm version on pwd change
export NVM_DIR="$HOME/.nvm"
load_nvm > /dev/stderr

alias gpf="ggpush --force-with-lease"
alias awswhoami="aws sts get-caller-identity"
alias nv=nvim
alias update-kitty="cd ~ && curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias lg="lazygit"

export EDITOR=/usr/local/bin/nvim

