# Load the shell dotfiles, and then some:
for file in ~/.{bash_prompt,exports,functions}; do
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
  shopt -s "$option" 2>/dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e ~/.ssh/config ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Setup homebrew
if [ -f /opt/homebrew/bin/brew ]; then
  export PATH="/opt/homebrew/bin:$PATH"
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # If possible, add tab completion for many more commands
  brewery=$(brew --prefix)
  [[ -s "$brewery/etc/bash_completion" ]] && source "$brewery/etc/bash_completion"
  [[ -s "$brewery/opt/fzf/shell/completion.bash" ]] && source "$brewery/opt/fzf/shell/completion.bash"
  [[ -s "$brewery/opt/fzf/shell/key-bindings.bash" ]] && source "$brewery/opt/fzf/shell/key-bindings.bash"
fi

if type aws &>/dev/null; then
  complete -C "$(which aws_completer)" aws
fi

if type mise &>/dev/null; then
  eval "$(mise activate bash)"
fi

if type starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd j bash)"
fi

# Set terminal title to something reasonable
__set_terminal_title() {
  echo -ne "\033]0;${PWD}  〉$BASH_COMMAND\007"
}
trap '__set_terminal_title' DEBUG

# load aliases, this comes after we've fiddled with the PATH to make sure
# that we can properly check for commands when defining aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# ~/.bashrc.local can be used for other settings you don’t want to commit.
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
