#!/bin/bash
dotfile_path=$(pwd)

cd ..
git clone https://github.com/tmux/tmux

cd tmux

make clean
sh autogen.sh
./configure && make
sudo make install

cd $dotfile_path
ln -sf $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/tmux/.base16_eighties_minimal_tmuxline_snapshot.conf ~/.tmux_snapshot.conf
