# dotfiles

To get started run

```bash
wget -qO- https://raw.githubusercontent.com/samandmoore/dotfiles/refs/heads/main/script/boot.sh | bash
```

From there, use `./script/setup.sh` to apply updates.

## Local customizations supported

- `~/.bash_profile.local`
- `~/.bashrc.local`
- `~/.gitconfig.local`
- `~/.tmux.conf.local`

## Theme things

There is some support for theming across applications. 

Files live in `etc/themes` and theme swapping is done
with `theme`

The current theme and background are linked into
- `~/.config/dotfiles/current/theme`
- `~/.config/dotfiles/current/background`

## linux things

customizations are in `etc/ubuntu` or `etc/arch`

## macOS things

customizations are in `etc/macos`

Change your computer name and network sharing name with this script if
you want.

```
export NEW_NAME="My-Cool-Mac"
scutil --set ComputerName "$NEW_NAME"
scutil --set LocalHostName "$NEW_NAME"
scutil --set HostName "$NEW_NAME"
unset NEW_NAME
```
