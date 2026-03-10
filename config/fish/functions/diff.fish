function diff --wraps='git diff' --description 'Use git diff for colored word diffs'
    git diff --no-index --color-words $argv
end
