dotfiles
========

To install, run `./script/setup`.

Local customizations supported
----------------------------

* `~/.bashrc.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`

## linux things

customizations are in `etc/linux`

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
