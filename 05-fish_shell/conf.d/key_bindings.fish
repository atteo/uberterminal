
function watch-command-line
  set -l cmd (commandline --current-buffer)
  if test -z "$cmd"
    commandline -r "watch $history[1]"
  else
    commandline -r "watch $cmd"
  end
  commandline -f execute
end


function fish_user_key_bindings
  bind \ew 'watch-command-line'
end

# implement
bind ctrl-i _fish_ai_codify_or_explain
# fix
bind ctrl-f _fish_ai_autocomplete_or_fix
# Git fetch
bind ctrl-g,f 'printf "\r\033[KFetching...\n"; git fetch --all --tags --prune; commandline -f repaint'
# Git log
bind ctrl-g,l 'printf "\r\033[K"; git log --graph --branches --tags --oneline --decorate; commandline -f repaint'
# Git graph
bind ctrl-g,g 'gitk --all; commandline -f repaint'
# Git dandling
bind ctrl-g,d 'gitk-dangling; commandline -f repaint'
