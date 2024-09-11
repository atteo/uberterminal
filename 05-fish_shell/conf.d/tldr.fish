
function __fish_tldr --description 'tldr current command'
    printf "\n"
    set val (eval echo (commandline -t))
    tldr $val

    commandline -f repaint
end

bind \eh __fish_tldr
bind -M insert \eh __fish_tldr
