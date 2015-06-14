#!/bin/bash
echo "Current Directory: $(pwd)"
echo "Term settings: $TERM"
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



echo "Done!"



