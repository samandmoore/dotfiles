dotfiles
========

To install, run `./script/setup`.

Local customizations supported
----------------------------

* `~/.bashrc.local`
* `~/.gitconfig.local`
* `~/.gvimrc.local`
* `~/.vimrc.local`
* `~/.vimrc.bundles.local`
* `~/.tmux.conf.local`

## macOS things

Run `etc/macos` to customize common OS settings. It's a good idea to log
out and log back in afterward.

Change your computer name and network sharing name with this script if
you want.

```
export NEW_NAME="My-Cool-Mac"
scutil --set ComputerName "$NEW_NAME"
scutil --set LocalHostName "$NEW_NAME"
scutil --set HostName "$NEW_NAME"
unset NEW_NAME
```
