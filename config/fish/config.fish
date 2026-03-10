# Only run in interactive shells
status is-interactive; or return

set --global fish_greeting ""

if test -f /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

if type --query mise
    mise activate fish | source
end

if type --query starship
    starship init fish | source
end

if command --query zoxide
    zoxide init --cmd j fish | source
end

if type --query fzf
    fzf --fish | source
end

# eza / ls
if type --query eza
    alias ls eza
    alias l 'eza --long'
    alias la 'eza --long --all'
    alias lt 'eza --tree'
    alias tree 'eza --tree --level=2'
else
    alias l 'ls -l'
    alias la 'ls -la'
end

# fancy cat
if type --query bat
    alias cat 'bat --paging=never --style=plain'
end

# lazier git
if type --query lazygit
    abbr --add lg lazygit
end

# use nvim for vim if it's there
if command --query nvim
    alias vim nvim
    alias vi nvim
    alias e nvim
    alias v nvim
end

# Set terminal title to current directory
function fish_title
    string replace $HOME '~' $PWD
end

# Source local overrides if they exist
if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end
