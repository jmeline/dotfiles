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

# 10ms for key sequences, really helps with vi mode in zsh
KEYTIMEOUT=1

# Customize to your needs...
# XDG_CONFIG_HOME+=("$HOME/.config")
# export XDG_CONFIG_HOME

# setting up autojump
#[[ -s /home/jmeline/.autojump/etc/profile.d/autojump.sh ]] && source /home/jmeline/.autojump/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u

