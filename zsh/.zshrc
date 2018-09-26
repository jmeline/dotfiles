exists() {
  command -v "$1" > /dev/null 2>&1
}

if exists archey; then
  archey -o
elif exists archey3; then
  archey3
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

plugins=(git ssh-agent)

# If changing colors, make sure to change ~/.vimrc colorscheme and AirlineTheme settings
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR


# 10ms for key sequences, really helps with vi mode in zsh kill the lag
export KEYTIMEOUT=1

# want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color-italic"

# enable vi mode
bindkey -v

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
alias etc='vim ~/.config/termite/config'
alias ei3='vim ~/.config/i3/config'
alias ekitty='vim ~/Projects/dotfiles/kitty_term/kitty.conf'
alias vim='nvim'
alias vi='vim'
alias v='vim'
alias cdWin='/Volumes/C/Projects'


alias g++='g++ -O3'

setopt HIST_IGNORE_DUPS # Prevent duplicate lines in the history
# alias ctags="`brew --prefix`/bin/ctags"
# alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
# Customize to your needs...
# XDG_CONFIG_HOME+=("$HOME/.config")
# export XDG_CONFIG_HOME

#autoload -U compinit && compinit -u

# Fish-like syntax highlighting && Autojump setup
if [[ `uname` == 'Linux' ]] then
    ZSH_SYNTAX_HIGHLIGHTING_PATH="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    AUTO_JUMP_PATH="/etc/profile.d/autojump.zsh"
fi
if [[ `uname` == 'Darwin' ]] then
    ## Mac after doing brew install 'zsh-syntax-highlighting'
    ZSH_SYNTAX_HIGHLIGHTING_PATH="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    AUTO_JUMP_PATH="$(brew --prefix)/etc/profile.d/autojump.sh"
fi
[[ -s $ZSH_SYNTAX_HIGHLIGHTING_PATH ]] && source $ZSH_SYNTAX_HIGHLIGHTING_PATH
[[ -s $AUTO_JUMP_PATH ]] && source $AUTO_JUMP_PATH

# tab completion file for tmuxinator
# source ~/.bin/tmuxinator.zsh

# (set -x; sudo mount -t vboxsf -o gid=1000,uid=1000 VBox /home/$(whoami)/Shared)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*"'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# bind -x '"\C-p": vim $(fzf);'
bindkey "^P" 'vim $(fzf);'

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$(pwd)}") | fzf-tmux --tac)
  cd "$DIR"
}
# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# mount shared folder
# arg0 = name of the shared folder
# arg1 = name of the mount point on the Filesystem
# sudo mount -t vboxsf shared ~/Share/
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
pathadd "/home/jmeline/Bin"
#export PATH="/home/jmeline/Bin:$PATH"
# hacktoberfest
#export GITHUB_TOKEN=fbf300c49e3ab8320aef21d9e6d99277c50863a9
