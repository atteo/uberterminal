
function watch
    if test (count $argv) -eq 0
        /usr/bin/watch
    else if test $argv[1] = "docker"
        /usr/bin/watch -n 1 -d -c grc --colour=on $argv
    else
        /usr/bin/watch -n 1 -d $argv
    end
end

