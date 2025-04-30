function git
    set -l args
    set -l replace_force 0

    for arg in $argv
        if test "$arg" = "push"
            set -l is_push 1
        end
    end

    for arg in $argv
        if test "$arg" = "--force"
            set replace_force 1
        else
            set args $args $arg
        end
    end

    if test "$replace_force" -eq 1 -a "$is_push" = "1"
        echo "⚠️  Replacing '--force' with '--force-with-lease' for safer push."
        set args $args --force-with-lease
    end

    command git $args
end
