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
echo ""
echo "${BOLD}${CYAN}Current Directory: ${BLUE}$(pwd)${RESET}"
echo "${BOLD}${CYAN}Term settings: ${BLUE}$TERM${RESET}"
perl 256color.pl

# List of configurations that I care about
CONFIGS=(~/.bashrc ~/.bash ~/.vimrc )
DATE=`date +%Y-%m-%d`
OLDCONFIGS=.old

for config in ${CONFIGS[@]}; do
    echo $config
    if [ -e $config ]; then
        if [ ! -d $OLDCONFIGS ]; then
            mkdir $OLDCONFIGS
        fi
        echo $config " is being moved to " $OLDCONFIGS
        NEWNAME=$config "_" $DATE
        mv $config $NEWNAME
        mv $NEWNAME $OLDCONFIGS
    fi
done

echo "Copying Bash settings to ~/.bashrc"
cp bash/.bashrc ~/.bashrc
if [ ! -a ~/.bash ]; then mkdir ~/.bash fi
cp bash/.aliases ~/.bash
cp bash/.bash_profile ~/.bash_profile

echo "Copying Vim settings to ~/.vimrc && Installing Vundle"
cp vim/.vimrc ~/.vimrc
if [ -a ~/.vim/bundle/Vundle.vim ]
then
    rm ~/.vim/bundle/Vundle.vim
    echo "Removing existing Vundle.vim"
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim -E -u NONE -S ~/.vim/vundle.vim +PluginInstall +qall > /dev/null
vim -E -u NONE +PluginInstall +qall > /dev/null

echo "${BOLD}${MAGENTA}*********************************************************${RESET}*"
echo "Done!"



