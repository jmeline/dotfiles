# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"

USER=$(whoami)
# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# 10ms for key sequences, really helps with vi mode in zsh kill the lag
export KEYTIMEOUT=1
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export DRACULA_PRO_VIM_DIR="~/.dracula_pro_nvim/dracula"
# Fish-like syntax highlighting && Autojump setup

# if [[ `uname` == 'Darwin' ]] then
#     ## Mac after doing brew install 'zsh-syntax-highlighting'
#     ZSH_SYNTAX_HIGHLIGHTING_PATH="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#     AUTO_JUMP_PATH="$(brew --prefix)/etc/profile.d/autojump.sh"
# fi

[[ -s $ZSH_SYNTAX_HIGHLIGHTING_PATH ]] && source $ZSH_SYNTAX_HIGHLIGHTING_PATH

setopt HIST_IGNORE_DUPS # Prevent duplicate lines in the history
set -o noclobber

export FZF_DEFAULT_COMMAND="fd ."
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
DOTNET_CLI_TELEMETRY_OPTOUT=1
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="sorin"

## Edit commandlind in full screen editor in zsh
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'vv' edit-command-line
# autoload -z edit-command-line
# zle -N edit-command-line
# bindkey "^X^E" edit-command-line
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git cp ssh-agent vi-mode)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -d ~/.zsh ] && source ~/.zsh/.zshrc.aliases
[ -f ~/.zsh/.zshrc.functions ] && source ~/.zsh/.zshrc.functions

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# mount shared folder
# arg0 = name of the shared folder
# arg1 = name of the mount point on the Filesystem
# sudo mount -t vboxsf shared ~/Share/
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
pathadd "/Users/$USER/bin"
pathadd "/Users/$USER/.jetbrains"

## Setup dotnet
pathadd "$HOME/.dotnet"
pathadd "$HOME/.dotnet/tools"
export DOTNET_ROOT=$HOME/.dotnet

# source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

pathadd "/Users/jacmeli/.cargo/bin"

# go stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

## Setup rust
pathadd "$HOME/.cargo/bin"

## Setup nvim
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

## Setup Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
## Customize Vi mode
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BEAM

## Azure cli completions
## https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos#completion-isnt-working
source $(brew --prefix)/etc/bash_completion.d/az

eval "$(zoxide init --cmd cd zsh)"
