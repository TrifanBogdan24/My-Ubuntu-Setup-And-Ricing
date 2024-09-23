# ~/.variables.sh

export GITHUB_TOKEN='my token'      # personal, sensitive info


# daca nu iti place cum arata terminalul, comenteaza linia de mai jos
# export PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]$\[\e[0m\]\n\[\e[1;96m\]$\[\e[0m\] '


# without GIT REPO
# export PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]\[\e[0m\] \[\e[1;39m\]$\[\e[0m\] $(printf "%.0s." {1..10})\[\e[0m\] $(date "+%T") \n\[\e[1;96m\]$\[\e[0m\] '

# info about GIT REPO
export PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]$(parse_git_branch)\[\e[0m\] \[\e[1;39m\]$\[\e[0m\] $(printf "%.0s." {1..10})\[\e[0m\] $(date "+%T") \n\[\e[1;96m\]$\[\e[0m\] '
