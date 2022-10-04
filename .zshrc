#####
# WITH THE ADDITION OF FISH, THIS BECAME DEPRECATED
# KEEP IT HERE IF WE MOVE BACK TO ohmyzsh
#####

export ZSH="/Users/guilherme/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH="$PATH:/Users/guilherme/dev/tools/flutter/bin"

alias db="npm run dev"
alias dbs="npm run storybook"
alias cz="git cz"
alias amend="gc --amend --no-edit"
alias amend-edit="gc --amend"
alias gpf="ggpush --force-with-lease"
alias gap="ga -p"
alias awswhoami="aws sts get-caller-identity"
alias nv=nvim
alias update-kitty="cd ~ && curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias update-zsh="source ~/.zshrc"

eval "$(rbenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias lg='lazygit'

setopt auto_cd
cdpath=($HOME/dev)
export EDITOR=/usr/local/bin/nvim
