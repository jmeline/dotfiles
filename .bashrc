## ############################
## Custom Bash Configurations
## ############################
#   July 2015

archey3
## Obtain git-prompt.sh for git
# ====================================
if [ ! -e ~/.git-prompt.sh ];
then
   curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi
source ~/.git-prompt.sh

## Instaniate custom alias directory
# ====================================
if [ -f ~/.bash/aliases ];
then
    echo "Found ~/.bash/aliases"
    source ~/.bash/aliases
fi

## Custom bash prompt via kirsle.net/wizards/ps1.html
# ====================================
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"

# Custom bash prompt via kirsle.net/wizards/ps1.html
# export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$\[$(tput setaf 5)\]$(__git_ps1)\[$(tput setaf 5)\]\[$(tput sgr0)\]\[$(tput sgr0)\] "

## Setup mount for shared directory on Work OSX.
# ====================================
sudo mount -t vboxsf -o gid=1000,uid=1000 VBox /home/jmeline/Shared

export M2_HOME=/opt/maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

# added by Anaconda 2.3.0 installer
export PATH="/home/jmeline/anaconda/bin:$PATH"

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
