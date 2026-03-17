# dotfiles

To get started run

```bash
wget -qO- https://dotfiles.samandmoore.com/boot.sh | bash
```

or

```bash
curl -s https://dotfiles.samandmoore.com/boot.sh | bash
```

From there, use `./script/setup.sh` to apply updates.

## Local customizations supported

- `~/.bash_profile.local`
- `~/.bashrc.local`
- `~/.config/fish/local.fish`
- `~/.gitconfig.local`

## Theme things

There is some support for theming across applications.

Files live in `etc/themes` and theme swapping is done
with `theme`

The current theme and background are linked into

- `~/.config/dotfiles/current/theme`
- `~/.config/dotfiles/current/background`

## Linux things

Customizations are in `etc/arch`

## macOS things

Customizations are in `etc/macos`
