function gsb --description "fzf powered git branch search"
  git branch -vv --sort=-committerdate | fzf --header "Search recent local branches" --preview "git diff {1} --color=always" --pointer="" | xargs git checkout
end
