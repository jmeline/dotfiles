# install zprezto

# add fish-style syntax highlighting to zsh prompt
sudo pacman -S zsh-synax-highlighting zsh

ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/zsh/.zpreztorc ~/.zpreztorc

zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sudo chsh -s /usr/bin/zsh
