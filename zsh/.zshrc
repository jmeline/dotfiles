#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# 10ms for key sequences, really helps with vi mode in zsh
KEYTIMEOUT=1

# want your terminal to support 256 color schemes? I do ...
# export TERM="xterm-256color"

# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'

# Customize to your needs...
# XDG_CONFIG_HOME+=("$HOME/.config")
# export XDG_CONFIG_HOME

# setting up autojump
#[[ -s /home/jmeline/.autojump/etc/profile.d/autojump.sh ]] && source /home/jmeline/.autojump/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u

# Fish-like syntax highlighting
# If you don't have it, sudo pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autojump (best tool I have found)
# If you don't have it, sudo pacman -S autojump
source /etc/profile.d/autojump.zsh

