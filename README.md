# Dotfiles

A simple project to main my personal settings.

## Getting Started

These instructions will get you a copy of the project configured in your local machine.

### Prerequisites

To have a good experience with this setups is required to install *****stow**
> `sudo apt install stow`

To see more details... After install run **man stow** to see the documentation.

### Setup Project

First of all clone this repo to your machine:
> gh repo clone wesdeveloper/dotfiles

Then access the project folder:
> cd dotfiles

To apply all settings on your root directory you need to use the **stow**.

Example:
> stow -vt ~ .

**Obs:** If you want to test the stow actions without execute it. Experiment to add -n flag.
> stow -nvt ~ .

### Ubuntu first steps

Run the apt update
> sudo apt update && sudo apt install git curl -y

#### Browser

Install the browser of you preference, mine current is Google Chrome.

#### Tilix

Instal the tilix terminal:
> sudo apt install tilix -y

Set tilix as your default terminal(after run the following command choose your new default terminal):
> sudo update-alternatives --config x-terminal-emulator

#### colorls

Install colorls(https://github.com/athityakumar/colorls) see the docs, because it's necessary install ruby.

#### Tmux

Install tmux 
> sudo apt install tmux -y

Add tmux plugin manager(https://github.com/tmux-plugins/tpm):
> git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#### Zsh

Install zsh:
> sudo apt install zsh -y

And oh my zsh(https://ohmyz.sh/#install):
> sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Install zsh-nvm(https://github.com/lukechilds/zsh-nvm):
> git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

Install zsh-autosuggestions(https://github.com/zsh-users/zsh-autosuggestions):
> git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#### fzf

Install fzf:
> https://github.com/junegunn/fzf#installation

#### ripgrep(https://snapcraft.io/install/ripgrep/ubuntu#install)

> sudo snap install ripgrep --classic

#### NodeJs

Install nodejs, it will be necessary to correct install of the following tools:
> https://github.com/nodesource/distributions/blob/master/README.md#debinstall

#### Neovim(https://neovim.io/)

Install neovim:
> sudo apt install neovim -y

Install vim plug to manage the vim plugins.
> https://github.com/junegunn/vim-plug

#### Neofetch(https://github.com/dylanaraps/neofetch)

> sudo apt install neofetch -y

#### Flameshot(https://snapcraft.io/flameshot)

> sudo apt install flameshot -y

#### Variety(https://github.com/varietywalls/variety)

> sudo apt install variety -y

#### Ulauncher

Install from https://ulauncher.io/

#### bpytop(https://github.com/aristocratos/bpytop)

> sudo apt install -y python3-pip
> pip3 install bpytop --upgrade

#### docker

> https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-pt

#### docker compose

> https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04

## Other linux settings and installs

* [Ulauncher](https://ulauncher.io/)
* [Tilix](https://gnunn1.github.io/tilix-web/)
* [Tmux](https://github.com/tmux/tmux/wiki)
* [nvim](https://github.com/neovim/neovim)
* [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
* [neofetch](https://github.com/dylanaraps/neofetch)
* [colorls](https://github.com/athityakumar/colorls)
* [Flameshot](https://github.com/flameshot-org/flameshot)
* [Variety](https://github.com/varietywalls/variety)
* [bpytop](https://github.com/aristocratos/bpytop)

