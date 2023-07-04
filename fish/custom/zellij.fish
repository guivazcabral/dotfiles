abbr zz 'zellij'
abbr zjls 'zellij list-sessions'
abbr zja 'zellij attach'
abbr zjkill 'zellij kill-session'
abbr zjkillall 'zellij kill-all-sessions'

function zj
  set -l dir (basename $PWD)
  set -l layout_filename (string join "" $dir ".kdl")
  set -l layout_file (string join "/" "/Users/guilherme/dev/dotfiles/zellij/layouts/layouts" $layout_filename)
  if test -e $layout_file
    zellij --layout $layout_file
  else
    zellij
  end
end