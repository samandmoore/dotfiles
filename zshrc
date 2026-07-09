# Setup homebrew (macOS /opt/homebrew or Linux /home/linuxbrew)
for brew_path in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  if [ -x "$brew_path" ]; then
    eval "$("$brew_path" shellenv)"
    break
  fi
done

if type starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# ~/.zshrc.local can be used for other settings you don’t want to commit.
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

