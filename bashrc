# Load the shell dotfiles, and then some:
for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add tab completion for `aws` if installed
type aws &> /dev/null && complete -C "$(which aws_completer)" aws

if type rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

if type nodenv &> /dev/null; then
  eval "$(nodenv init -)"
fi

# If possible, add tab completion for many more commands
brewery=$(brew --prefix)
[[ -s $brewery/etc/bash_completion ]] && source $brewery/etc/bash_completion
[[ -s $brewery/etc/autojump.sh ]] && source $brewery/etc/autojump.sh
[[ -s $brewery/opt/fzf/shell/completion.bash ]] && source $brewery/opt/fzf/shell/completion.bash
[[ -s $brewery/opt/fzf/shell/key-bindings.bash ]] && source $brewery/opt/fzf/shell/key-bindings.bash

# ~/.bashrc.local can be used for other settings you don’t want to commit.
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
