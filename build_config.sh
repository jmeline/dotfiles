#!/bin/bash
BLACK="$(tput setaf 0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
BOLD="$(tput bold)"
REVERSE="$(tput rev)"
RESET="$(tput sgr0)"

echo "${BOLD}${MAGENTA}**********************************************************${RESET}"
echo "${BOLD}${CYAN}Current Directory: ${BLUE}$(pwd)${RESET}"
echo "${BOLD}${CYAN}Term settings: ${BLUE}$TERM${RESET}"
perl 256color.pl

echo "Copying Vim settings to ~/.vimrc && Installing Vundle"
if [ -a ~/.vimrc ]
then
    echo "~/.vimrc already exists, making a copy then copying over the new .vimrc"
    mv ~/.vimrc ~/.vimrc.bak
fi

cp .vimrc ~/.vimrc
if [ -a ~/.vim/bundle/Vundle.vim ]
then
    rm ~/.vim/bundle/Vundle.vim
    echo "Removing existing Vundle.vim"
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim -E -u NONE -S ~/.vim/vundle.vim +PluginInstall +qall > /dev/null
vim -E -u NONE +PluginInstall +qall > /dev/null


echo "$(tput setaf 5)**********************************************************"
echo "Done!"



