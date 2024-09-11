
function watch-command-line
  set -l cmd (commandline --current-buffer)
  if test -z "$cmd"
    commandline -r "watch $history[1]"
  else
    commandline -r "watch $cmd"
  end
  commandline -f execute
end

function define_common_bindings --argument mode
    bind -M $mode \ej 'thefuck-command-line'
    bind -M $mode \ew 'watch-command-line'
    bind -M $mode \cE end-of-line
end


function fish_user_key_bindings
  define_common_bindings default
  define_common_bindings insert
end


bind -M insert -m comma ctrl-comma 'printf "\ng - Git, ESC - exit"'
bind -M default -m comma comma 'printf "\ng - Git, ESC - exit"'

bind -M comma -m default escape 'commandline -f repaint'
bind -M comma -m comma_git g 'printf "\r\033[Kd - diff, f - fetch, l - Git log, ESC - exit"'

bind -M comma_git -m default escape 'commandline -f repaint'
bind -M comma_git -m default d 'printf "\r\033[K"; git diff; commandline -f repaint'
bind -M comma_git -m default f 'printf "\r\033[KFetching...\n"; git fetch --all --tags --prune; commandline -f repaint'
bind -M comma_git -m default l 'printf "\r\033[K"; git log --graph --branches --tags --oneline --decorate; commandline -f repaint'

