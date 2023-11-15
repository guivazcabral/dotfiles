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

function gbra --description "prompt lead git branch creation"
    if not string length --quiet $JIRA_DOMAIN || not string length --quiet $JIRA_TOKEN
        echo "Missing JIRA env vars. Check if JIRA_DOMAIN and JIRA_TOKEN are set"
        return
    end

    set prefix gui
    set backstage (read -n 1 -f -P "Needs backstage? [y/N]: ")

    if test -z $backstage
        echo Aborting
        return
    end

    if string match $backstage y
        set prefix backstage/gui
    else
        echo "No backstage needed"
    end

    set ticket_title (fetch-jira-ticket-title)

    if test "$ticket_title" = false
        echo Aborting
        return
    end

    echo "Creating branch $prefix/$ticket_title"
    set branch_name "$prefix/$ticket_title"
    git checkout -b $branch_name
end

function fetch-jira-ticket-title
    # Ask the user for Jira ticket reference
    set jira_ticket_ref (read -f -P "Enter the Jira ticket reference (e.g., PR-123): ")

    if test -z $jira_ticket_ref
        return
    end

    # Check if the Jira ticket reference is not empty
    if test -n "$jira_ticket_ref"

        # Call Jira API to get the ticket title
        set jira_url "https://$JIRA_DOMAIN/rest/api/2/issue/$jira_ticket_ref"
        set jira_response (curl -s $jira_url --user $JIRA_TOKEN)

        # Extract the ticket title from the JSON response
        set ticket_title (echo $jira_response | jq -r '.fields.summary')

        # Check if the ticket title is not empty
        if test -n "$ticket_title"
            set ticket_title_snake (echo $ticket_title | sed 's/[^a-zA-Z0-9 ]//g' |
                string lower | string trim | sed 's/ /-/g' )

            set ok (read -n 1 -P "Is \"$ticket_title_snake\" ok? [Y]es/[n]o: ")

            if test -z $ok
                return
            end

            if test $ok = y
                echo "$jira_ticket_ref/$ticket_title_snake"
            else
                set ticket_title (read -f -P "Enter the ticket title: ")
                set ticket_title_snake (echo $ticket_title | sed 's/[^a-zA-Z0-9 ]//g' |
                string lower | string trim | sed 's/ /-/g' )
                echo "$jira_ticket_ref/$ticket_title_snake"
            end
        else
            set custom_title (read -f -P "Failed to automatically fetch the ticket title. Please enter the ticket title: ")
            echo "$jira_ticket_ref/$custom_title"
        end
    else
        set custom_title (read -f -P "Failed to automatically fetch the ticket title. Please enter the ticket title: ")
        echo "$jira_ticket_ref/$custom_title"
    end
end
