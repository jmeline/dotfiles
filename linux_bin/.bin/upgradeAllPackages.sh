#!/bin/zsh

run_update_for() {
  cd ~/code/$1
  git pull
  sudo ./run.sh
}

# upgrade all neovim plug packages
v +'PlugUpgrade' +'PlugInstall!' +qa

run_update_for neovim

run_update_for kitty
