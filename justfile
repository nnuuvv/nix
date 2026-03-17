default: 
    @just --list

update-submodule: 
    jj git colocation enable
    git submodule init
    git submodule update
    jj git colocation disable

start-commit-submodule-changes:
    jj git colocation enable
    echo "now go, git!"
    echo "..."
    echo "..."
    echo "..."
    echo "commit and push the changes, and then run "

finish-commit-submodule-changes:
    jj git colocation disable


