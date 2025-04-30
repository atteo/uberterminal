function git
    set -l args
    set -l is_push 0
    if contains -- "push" $argv
        set is_push 1
    end

    for arg in $argv
        switch $arg
            case "--force" "-f"
                if test $is_push
                    echo "⚠️  Replacing '$arg' with '--force-with-lease' for safer push."
                    set args $args --force-with-lease
                else
                    set args $args $arg
                end
            case '*'
                set args $args $arg
        end
    end

    command git $args
end
