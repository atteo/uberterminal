function cat --wraps batcat
    # if first argument is an image
    if file --mime-type -b $argv[1] | grep -q '^image/';
        # display the image
        kitty icat --clear --transfer-mode=memory --stdin=no $argv
    else
        batcat $argv
    end
end
