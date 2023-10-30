abbr zz zellij
abbr zzls 'zellij list-sessions'
abbr zza 'zellij attach'
abbr zzkill 'zellij kill-session'
abbr zzkillall 'zellij kill-all-sessions'

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
