# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
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

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal" killall

# Autocomplete Grunt commands
which grunt > /dev/null && eval "$(grunt --completion=bash)"

# source boxen, if it's there
[[ -s /opt/boxen/env.sh ]] && . /opt/boxen/env.sh

# If possible, add tab completion for many more commands
[[ -s ~/.git-completion ]] && . ~/.git-completion
brewery=`brew --prefix`
[[ -s $brewery/etc/bash_completion ]] && . $brewery/etc/bash_completion
[[ -s $brewery/etc/autojump.sh ]]    && . $brewery/etc/autojump.sh

# add auto-completion for aws cli
which aws > /dev/null && complete -C aws_completer aws

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"