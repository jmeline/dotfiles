
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -la --color=auto --group-directories-first'
alias l='ls --color=auto --group-directories-first'


clean (){
    sudo pacman -Syy
    sudo pacman -Scc
    sudo pacman -Suu
    sudo pacman -Rsn $(pacman -Qqdt)
}
alias pacclean='clean'
