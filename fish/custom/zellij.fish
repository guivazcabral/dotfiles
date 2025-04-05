abbr zj zellij
abbr zjrt zellij action rename-tab
abbr zzls 'zellij list-sessions'
abbr zza 'zellij attach'
abbr zzkill 'zellij kill-session'
abbr zzkillall 'zellij kill-all-sessions'

function zellij_tab_name_update --on-variable="PWD"
  if test -n $ZELLIJ
    set tab_name ''
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1
      set tab_name (basename (git rev-parse --show-toplevel))
      set tab_name $tab_name'/'(git rev-parse --show-prefix)
      set tab_name (string replace -r '/$' '' $tab_name)
    else
      set tab_name $PWD
      if test $tab_name = $HOME
        set tab_name "~"
      else
        set tab_name (basename $tab_name)
      end
    end
    command nohup zellij action rename-tab $tab_name > /dev/null 2>&1
  end
end
