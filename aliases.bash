
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -la --color=auto --group-directories-first'
alias l='ls --color=auto --group-directories-first'


clean (){
    sudo pacman -Syy
    sudo pacman -Scc
    sudo pacman -Suu
    sudo pacman -Rsn $(pacman -Qqdt)
}
paclist(){
    pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'
}
alias pacclean='clean'
alias paclist='paclist'
