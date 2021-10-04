#!/usr/bin/env bash

set -e

# update system
sudo pacman -Syu

command -v yay || sudo pacman -S yay 

# install some packages
yay -S --needed kitty neovim picom-ibhagwan-git ttf-font-awesome nerd-fonts-fira-code pulseaudio-control ttf-lxgw-wenkai papirus-icon-theme nvm python-pip rofimoji greenclip lxappearance eww
source /usr/share/nvm/init-nvm.sh && nvm install 16 && nvm use 16 && npm i -g yarn && pip install neovim

# clone dotfiles
[ -d ~/.local/share/yadm ] && rm -rf ~/.local/share/yadm
cd ~
yadm clone -f https://github.com/mluna711/rei-ii.git
yadm reset --hard

# install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
yadm reset --hard
yadm checkout -f gruvbox
chsh -s $(which zsh)


# recompile xmonad
xmonad --recompile && xmonad --restart

# set wallpaper
feh --bg-fill ~/Pictures/wallpapers/god.png

# vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
