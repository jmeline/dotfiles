#!/bin/bash
dotfile_path=$(pwd)

# install neovim from source
sudo pacman -S python-neovim lua ninja cmake
cd ..
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD=Release
sudo make install

mkdir -p ~/.config/nvim/autoload
cd $dotfile_path

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf $(pwd)/vim/.vimrc ~/.config/nvim/init.vim

nvim +PlugInstall +qa!
