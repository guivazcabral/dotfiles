function gsb --description "fzf powered git branch search"
    git branch -vv --sort=-committerdate | fzf --header "Search recent local branches" --preview "git diff --color=always {1}" --pointer="" | xargs git checkout
end

function fcommit --description "fzf powered git log and commit hash"
    set selected_commit (git log --oneline | fzf --preview "echo {} | awk '{print \$1}' | xargs -I % git show --stat %" --preview-window=up:30%:wrap)

    if test -n "$selected_commit"
        echo -n $selected_commit | awk '{print $1}' | pbcopy # Copy commit hash to clipboard
        echo "Copied commit hash to clipboard: $selected_commit"
    else
        echo "No commit selected"
    end
end
