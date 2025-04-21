if status is-interactive
    # Commands to run in interactive sessions can go here
    rbenv init - fish | source
    pyenv init - | source
end

function fish_greeting
end

export PATH="/opt/homebrew/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export SHELL="/opt/homebrew/bin/fish"
export K9S_CONFIG_DIR="$HOME/.config/k9s"
oh-my-posh init fish --config ~/.config/oh-my-posh/config.yaml | source
oh-my-posh completion fish | source
k9s completion fish | source

export EDITOR=/usr/local/bin/nvim

# source custom files
source ~/.config/fish/custom/chrome.fish
source ~/.config/fish/custom/fnm.fish
source ~/.config/fish/custom/git.fish
source ~/.config/fish/custom/zellij.fish

source ~/.config/fish/custom/abbrs/misc.fish

if test -e ~/.config/fish/custom/secrets.fish # checks if file exists because it's gitignored
    source ~/.config/fish/custom/secrets.fish
end

# auto load nvm version on pwd change
load_nvm >/dev/stderr
