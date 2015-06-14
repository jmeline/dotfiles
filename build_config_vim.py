#!/usr/bin/python
## Builds all/setup all my configurations

import os
import shutil

##################################################
# setup .vimrc
##################################################
# install vundle
os.system("git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
# copy new .vimrc to home folder
shutil.copy(".vimrc", os.path.expanduser("~/.vimrc"))
# install all plugins with vundle
os.system("vim +PluginInstall +qall)
print ("Success!")


