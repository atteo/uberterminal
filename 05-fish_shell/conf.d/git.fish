

function git_diff -d "Run git diff"
    git diff
    commandline --function repaint
end

bind \ed git_diff

function git_fetch -d "Fetch all remotes"
    git fetch --all --tags --prune
    commandline --function repaint
end
bind \ef git_fetch
