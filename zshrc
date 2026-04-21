if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if type starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# ~/.zshrc.local can be used for other settings you don’t want to commit.
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
