function __page_last_command_output --description 'Get the output of the last command executed in the shell'
    echo ""
    set -x LESS '--tabs=4 -RX --mouse'
    kitty @ get-text --extent=last_non_empty_output --ansi | less
    commandline -f repaint
end

bind alt-o __page_last_command_output

# Also uses -r to interpret all ANSI codes
function __page_all_output --description 'Get the output of the last command executed in the shell'
    echo ""
    set -x LESS '--tabs=4 -rX --mouse'
    kitty @ get-text --extent=all --ansi | less
    commandline -f repaint
end

bind alt-O __page_all_output
