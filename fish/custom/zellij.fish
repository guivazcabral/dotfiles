abbr zjls 'zellij list-sessions'
abbr zja 'zellij attach'

function zj
  set -l dir (basename $PWD)
  set -l layout_filename (string join "" $dir ".kdl")
  set -l layout_file (string join "/" "/Users/guilherme/dev/dotfiles/zellij/layouts" $layout_filename)

  if test -e $layout_file
    zellij --layout $layout_file
  else
    zellij
  end
end