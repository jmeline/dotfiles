#!/bin/bash

echo "Updating nvim..."
brew update
brew reinstall --HEAD neovim
sudo pip install -U neovim
sudo pip2 install -U neovim
