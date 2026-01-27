if status is-interactive
    # Get all bindings, remove the 'bind' prefix, pick a random line
    set -l random_bind (bind | string replace -r '^bind ' '' | shuf -n 1)

    # Print it with a bit of flair
    echo (set_color yellow)"Quick Tip:"(set_color normal) $random_bind
end

set -g theme_display_vi no
