# Dotfiles

Personal shell, terminal, editor, and window-manager configuration managed with GNU Stow.

## What's in this repo

This repository currently contains:

| Area | Files |
| --- | --- |
| Shell | `.zshrc`, `.gitconfig`, `ide.sh` |
| Terminal | `.tmux.conf`, `.config/alacritty`, `.config/kitty`, `.config/starship.toml` |
| Neovim | `.config/nvim` |
| Linux desktop | `.config/i3`, `.config/i3status-rs`, `.config/regolith`, `.config/rofi`, `.config/neofetch` |
| macOS tiling | `.config/yabai`, `.config/skhd` |

## Prerequisites

The repo is meant to be applied with **GNU Stow**.

Examples:

```bash
# Ubuntu / Debian
sudo apt install stow

# macOS (Homebrew)
brew install stow
```

After installing Stow, check the manual with:

```bash
man stow
```

## Setup

Clone the repository and apply the dotfiles to your home directory:

```bash
gh repo clone wesdeveloper/dotfiles
cd dotfiles
stow -nvt ~ .   # dry run
stow -vt ~ .    # apply
```

If you already have conflicting files in `~`, move or remove them before running `stow`.

## Recommended installs

The exact tools you need depend on which parts of the repo you want to use.

### Core tools

These are the most useful packages for the current configuration:

- `git`
- `curl`
- `zsh`
- `tmux`
- `neovim`
- `node`
- `fzf`
- `ripgrep`
- `starship`
- `gh` (recommended for Copilot auth)

### Ubuntu / Debian example

```bash
sudo apt update
sudo apt install -y git curl stow zsh tmux neovim fzf
```

Install the remaining tools with their official docs when your distro package is outdated:

- `ripgrep`: https://github.com/BurntSushi/ripgrep
- `node`: https://nodejs.org/
- `starship`: https://starship.rs/
- `gh`: https://cli.github.com/

### macOS example

```bash
brew install git curl stow zsh tmux neovim fzf ripgrep starship gh
```

Optional macOS window-management tools used by this repo:

```bash
brew install koekeishiya/formulae/yabai koekeishiya/formulae/skhd
```

### Optional tools still referenced by the config

Depending on which aliases, plugins, or desktop config you use, these may also be worth installing:

- `colorls`: https://github.com/athityakumar/colorls
- `neofetch`: https://github.com/dylanaraps/neofetch
- `docker`: https://docs.docker.com/engine/install/
- `docker compose`: https://docs.docker.com/compose/
- `flameshot`: https://flameshot.org/
- `variety`: https://github.com/varietywalls/variety
- `ulauncher`: https://ulauncher.io/

### Suggested tools

Keeping the broader suggestion list here for convenience:

- `Ulauncher`: https://ulauncher.io/
- `Tilix`: https://gnunn1.github.io/tilix-web/
- `Tmux`: https://github.com/tmux/tmux/wiki
- `Neovim`: https://github.com/neovim/neovim
- `Oh My Zsh`: https://github.com/ohmyzsh/ohmyzsh
- `Neofetch`: https://github.com/dylanaraps/neofetch
- `colorls`: https://github.com/athityakumar/colorls
- `Flameshot`: https://github.com/flameshot-org/flameshot
- `Variety`: https://github.com/varietywalls/variety
- `bpytop`: https://github.com/aristocratos/bpytop

## Tool-specific notes

### Zsh

The shell config expects Oh My Zsh and uses plugins such as:

- `git`
- `tmux`
- `zsh-nvm`
- `docker`
- `docker-compose`
- `zsh-autosuggestions`
- `kubectl`
- `zsh-fzf-history-search`
- `zsh-z`

Install Oh My Zsh from:

https://ohmyz.sh/#install

Extra plugins referenced by the config:

- `zsh-nvm`: https://github.com/lukechilds/zsh-nvm
- `zsh-autosuggestions`: https://github.com/zsh-users/zsh-autosuggestions
- `zsh-fzf-history-search`: https://github.com/joshskidmore/zsh-fzf-history-search
- `zsh-z`: https://github.com/agkozak/zsh-z

### Tmux

`~/.tmux.conf` is configured to bootstrap TPM automatically if it is missing, so opening tmux is usually enough to install tmux plugins on a fresh setup.

TPM:

https://github.com/tmux-plugins/tpm

### Neovim

The Neovim config lives in `.config/nvim` and uses **lazy.nvim**, not vim-plug.

On first startup, Neovim bootstraps `lazy.nvim` automatically and then installs the configured plugins.

Some plugins depend on external tools, especially:

- `node`
- `git`
- `ripgrep`
- a Nerd Font

For GitHub Copilot inside Neovim, this setup exports `GITHUB_TOKEN` and `GITHUB_API_TOKEN` from the shell when available. If you use GitHub CLI, authenticate with:

```bash
gh auth login
```

### Linux desktop

The Linux-specific configs in this repo are centered around:

- `i3`
- `regolith`
- `rofi`
- `neofetch`

The i3 config also references tools such as:

- `feh`
- `compton`
- `xss-lock`
- `i3lock`
- `nm-applet`
- PulseAudio / `pactl`

### macOS tiling

The macOS-specific configs are:

- `.config/yabai/yabairc`
- `.config/skhd/skhdrc`

These are only relevant on macOS systems using yabai + skhd.

## Notes

- This repo mixes Linux and macOS configs intentionally.
- You do not need every tool listed above; install only what matches the parts you use.
- If a package manager ships an older version of a tool, prefer the tool's official installation instructions.
