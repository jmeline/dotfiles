====
Bash
====

Default Bash Prompt
-------------------
::

    export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]" 

Git Branch in your Bash Prompt
------------------------------

* Get the git-prompt.sh and put it ~/.git-prompt.sh

::

    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

* At the top of your ~/.bash-profile

::

    source ~/.git-prompt.sh

* Modify your bash prompt, **Add \$(__git_ps1) to your prompt declaration**

:: 

    My custom prompt with git branching details
    
    export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$\[$(tput setaf 5)\]\$(__git_ps1)\$(tput setaf 5)\[$(tput sgr0)\]\[$(tput sgr0)\] "



