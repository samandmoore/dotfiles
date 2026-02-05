# Dotfiles Setup Guide

This document describes how my dotfiles are organized and how the setup process works.

## Quick Start

For a fresh machine, run:

```bash
wget -qO- https://dotfiles.samandmoore.com/boot.sh | bash
```

or

```bash
curl -s https://dotfiles.samandmoore.com/boot.sh | bash
```

This will:
1. Install git (if not already installed)
2. Clone the dotfiles to `~/.dotfiles`
3. Run the setup script

For updates on an existing installation:

```bash
cd ~/.dotfiles
./script/setup.sh
```

## Directory Structure

```
.
├── bin/                    # Custom executables and utilities
│   ├── robot              # Main CLI manager for dotfiles/theme/arch utilities
│   ├── dotfiles           # Dotfile linking manager (wraps rcm)
│   ├── theme*             # Theme management utilities
│   └── arch-*             # Arch Linux specific utilities
├── config/                 # XDG config directory files
│   ├── alacritty/         # Alacritty terminal config
│   ├── bash/              # Bash configuration (aliases, exports, functions)
│   ├── btop/              # System monitor config
│   ├── kitty/             # Kitty terminal config
│   ├── nvim/              # Neovim configuration
│   ├── starship.toml      # Starship prompt config
│   └── yazi/              # File manager config
├── etc/                    # Additional configuration and resources
│   ├── arch/              # Arch Linux specific setup
│   ├── macos/             # macOS specific setup
│   ├── mise.toml          # Tool version management config
│   └── themes/            # Color theme definitions
├── script/                 # Setup and installation scripts
│   ├── boot.sh            # Initial bootstrap script
│   ├── setup.sh           # Main setup orchestrator
│   ├── setup_macos.sh     # macOS specific setup
│   └── setup_linux.sh     # Linux specific setup
├── tag-darwin/             # macOS only files (tagged for rcm)
│   ├── Brewfile           # Homebrew package manifest
│   └── config/            # macOS specific configs
├── tag-linux/              # Linux only files (tagged for rcm)
│   └── config/            # Linux specific configs
├── bashrc                  # Main bash configuration
├── bash_profile            # Bash login shell config
├── gitconfig               # Git configuration
├── inputrc                 # Readline configuration
├── screenrc                # GNU Screen configuration
├── default-gems            # Ruby gems to install by default
├── gemrc                   # RubyGems configuration
├── ignore                  # Global gitignore patterns
└── hushlogin               # Suppress login messages
```

## Configuration Management

### rcm (RC file management)

Dotfiles are symlinked using [rcm](https://github.com/thoughtbot/rcm), which:
- Creates symlinks from `~/.dotfiles` to your home directory
- Handles platform-specific files using tags (`tag-darwin` for macOS, `tag-linux` for Linux)
- Manages XDG config directory structure
- Excludes non-dotfile files (README, LICENSE, scripts, etc.)

The linking is managed by `/home/runner/work/dotfiles/dotfiles/bin/dotfiles`:
```bash
# List what would be linked
robot dotfiles list

# Update symlinks
robot dotfiles up
```

Exclusions and special handling:
- `README.md`, `LICENSE`, `etc/`, `script/` are excluded
- Files in `config/` go to `~/.config/`
- `config/nvim` is symlinked as a whole directory (not individual files)
- Platform-specific files from `tag-{os}` are only linked on matching platforms

## Tool Management

### mise (formerly rtx)

[mise](https://mise.jdx.dev/) manages development tool versions:
- Language runtimes (Node.js, Python, Ruby, Rust)
- CLI tools installed via cargo, npm, etc.
- Per-project and global version management

Configuration in `/home/runner/work/dotfiles/dotfiles/etc/mise.toml`:
```toml
[tools]
node = "latest"
python = "latest"
ruby = "latest"
rust = "latest"
```

The setup script also installs global tools:
- `git-up` - Better git pull with rebase
- `presenterm` - Terminal-based presentation tool
- `markdownlint-cli2` - Markdown linting

## Theme System

Themes provide consistent colors across applications (terminal, editor, etc.).

### Available Themes
- Catppuccin Latte
- Catppuccin Macchiato (default)
- Everforest
- Gruvbox Dark
- Kanagawa
- Nord
- Rose Pine
- Tokyo Night Moon

### Theme Management

```bash
# List available themes
robot theme list

# Get current theme
robot theme get

# Set a theme
robot theme set "Catppuccin Macchiato"
```

Theme files are in `/home/runner/work/dotfiles/dotfiles/etc/themes/`. The current theme is symlinked to:
- `~/.config/dotfiles/current/theme`
- `~/.config/dotfiles/current/background`

## Platform-Specific Setup

### macOS (`tag-darwin/`)

**Package Management**: Homebrew via `Brewfile`

Key packages installed:
- Shell tools: bash, bash-completion, coreutils, gnu-sed
- Modern CLI replacements: bat, eza, fd, ripgrep, zoxide
- Development: git, gh, neovim, mise
- Containers: colima, docker, docker-compose
- TUI apps: btop, lazygit, lazydocker, spotify_player
- Utilities: fzf, gum, jj, starship

Applications (casks):
- Terminals: alacritty, kitty
- Browsers: arc, firefox
- Editors: visual-studio-code
- Utilities: 1password, raycast, obsidian

Fonts:
- Fira Code, Fira Mono
- Hack, Inconsolata
- JetBrains Mono
- Source Code Pro
- Intel One Mono
- Nerd Font variants

**Shell Setup**: Changes default shell to Homebrew's bash (`/opt/homebrew/bin/bash`)

**System Defaults**: macOS specific settings in `etc/macos/defaults.sh`

### Linux (`tag-linux/`)

**Distribution**: Arch Linux focused

Setup managed through `etc/arch/setup.sh`

Linux-specific utilities in `bin/arch-*`:
- Application management
- Battery monitoring
- Fingerprint authentication
- Font management
- Power profiles
- Screenshot tools
- Web app installation

## Bash Configuration

Configuration is split into modular files in `config/bash/`:

### `exports`
Environment variables and PATH configuration

### `aliases`
Command shortcuts and common operations

### `functions`
Shell functions for complex operations

### Main `bashrc`
- Sources modular configs
- Sets shell options (histappend, cdspell, globstar)
- Configures completions (SSH, AWS, brew)
- Initializes tools (mise, starship, zoxide)
- Sets terminal title
- Loads local customizations from `~/.bashrc.local`

## Git Configuration

The `gitconfig` includes:
- Useful aliases (s, di, ca, l, pu, puf, etc.)
- Color configuration
- URL shortcuts for GitHub
- GitHub CLI integration for credentials
- Local overrides via `~/.gitconfig.local`

## Local Customizations

These files are sourced if they exist but not tracked in git:

- `~/.bash_profile.local` - Login shell customizations
- `~/.bashrc.local` - Interactive shell customizations
- `~/.gitconfig.local` - Git user/credential overrides

## The Robot CLI

`robot` is the main management interface with subcommands:

```bash
robot dotfiles <command>  # Manage dotfile symlinks
robot theme <command>     # Manage color themes
robot arch <command>      # Arch Linux utilities (Linux only)
```

Each subcommand delegates to specialized scripts in `bin/`.

## Setup Script Flow

When running `script/setup.sh`:

1. **Detect OS** - Determines macOS or Linux
2. **OS-specific setup**
   - macOS: Install Homebrew, install packages from Brewfile, set shell
   - Linux: Run Arch setup scripts
3. **Link dotfiles** - Run `rcm` to create symlinks
4. **Install tools** - Use mise to install language runtimes and CLI tools
5. **Set theme** - Apply default theme (Catppuccin Macchiato)

## Installation Details

### Bootstrap (`script/boot.sh`)
1. Ensures git is installed
2. Clones repository to `~/.dotfiles`
3. Runs `script/setup.sh`

### Initial Setup (`script/setup.sh`)
1. Runs platform setup (macOS or Linux)
2. Links dotfiles with rcm
3. Configures mise with idiomatic version file support
4. Installs tool versions from `etc/mise.toml`
5. Sets global versions for common languages
6. Installs additional cargo/npm tools
7. Sets default theme

## Dependencies

### Required
- **rcm** - Dotfile symlink management
- **mise** - Tool version management
- **bash** - Shell (Homebrew version on macOS)

### Platform-specific
- **macOS**: Homebrew
- **Linux**: pacman (Arch Linux)

### Optional
- **starship** - Modern shell prompt
- **zoxide** - Smarter cd command
- **fzf** - Fuzzy finder for completions

## Updating

To update your dotfiles:

```bash
cd ~/.dotfiles
git pull
./script/setup.sh
```

This will:
- Pull latest changes
- Update symlinks if structure changed
- Install any new tools or packages
- Update theme if needed
