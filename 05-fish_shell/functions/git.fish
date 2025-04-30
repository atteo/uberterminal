function git
    set -l args
    set -l replace_force 0
    set -l is_push 0

    for arg in $argv
        switch $arg
            case "push"
                set is_push 1
            case "--force"
                set replace_force 1
            end
    end

    for arg in $argv
        if test "$arg" = "--force" -a "$replace_force" -eq 1 -a "$is_push" -eq 1
            echo "⚠️  Replacing '--force' with '--force-with-lease' for safer push."
            set args $args --force-with-lease
        else
            set args $args $arg
        end
    end

    command git $args
end
