function watch --wraps watch
    set -x HWATCH '-n 1 -c -d watch --border --mouse --no-title'
    hwatch -s 'fish -c' $argv
end
