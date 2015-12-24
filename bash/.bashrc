#
# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██████╔╝███████║███████╗███████║██████╔╝██║
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#

archey3

if [ -e /etc/profile.d/autojump.sh ];
then
    source /etc/profile.d/autojump.sh
    echo "Sourced autojump..."
fi

## Obtain git-prompt.sh for git
# ====================================
if [ ! -e ~/.git-prompt.sh ];
then
   curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
   source ~/.git-prompt.sh
else
   source ~/.git-prompt.sh
fi

## Instaniate custom alias directory
# ====================================
if [ -f ~/.bash/.aliases ];
then
    source ~/.bash/.aliases
else
    echo "Couldn't find ~/.bash/aliases"
fi

## Setup mount for shared directory on Work OSX.
# ====================================
(set -x; sudo mount -t vboxsf -o gid=1000,uid=1000 VBox /home/$(whoami)/Shared)

shopt -s histappend #Writes session to history on exit
shopt -s checkwinsize   #Check window on resize; for word wrapping
shopt -s autocd     # instead of 'cd Pictures', just run Pictures

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# #-------- Color Manpages
# export LESS_TERMCAP_mb=$'\E[01;31m'             # begin blinking
# export LESS_TERMCAP_md=$'\E[01;31m'             # begin bold
# export LESS_TERMCAP_me=$'\E[0m'                 # end mode
# export LESS_TERMCAP_se=$'\E[0m'                 # end standout-mode
# export LESS_TERMCAP_so=$'\E[01;44;33m'          # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'                 # end underline
# export LESS_TERMCAP_us=$'\E[01;32m'             # begin underline
# #export MANPAGER="/usr/bin/most -s"             # color using most]]]]]]]'

## Custom bash prompt via kirsle.net/wizards/ps1.html
# ====================================
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"

# Custom bash prompt via kirsle.net/wizards/ps1.html
# export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$\[$(tput setaf 5)\]$(__git_ps1)\[$(tput setaf 5)\]\[$(tput sgr0)\]\[$(tput sgr0)\] "

export M2_HOME=/opt/maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

# added by Anaconda 2.3.0 installer
export PATH="/home/jmeline/anaconda/bin:$PATH"
export EDITOR=vim

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}


# added by Miniconda3 3.18.9 installer
export PATH="/home/jmeline/miniconda3/bin:$PATH"
