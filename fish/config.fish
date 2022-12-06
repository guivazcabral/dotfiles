if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

# init startship
export STARSHIP_CONFIG=/Users/guilherme/dev/dotfiles/starship.toml
starship init fish | source

# auto load nvm version on pwd change
load_nvm >/dev/stderr

alias gpf="ggp --force-with-lease"
alias awswhoami="aws sts get-caller-identity"
alias nv=nvim
alias update-kitty="cd ~ && curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias lg="lazygit"
alias ld="lazydocker"

export EDITOR=/usr/local/bin/nvim

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
