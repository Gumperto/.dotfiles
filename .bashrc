#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fastfetch='fastfetch --load-config ~/.config/fastfetch/main.jsonc'
alias bashrc='nvim $HOME/.bashrc'

# PS1='[\u@\h \W]\$ '
# PS1='\[\e[1;36m\]\h@\[\e[1;36m\]\u\[\033[00m\]:\[\033[01;33m\]\W>>>>'
PS1='\[\e[1;40;37m\]  \[\e[1;40;37m\]\h \[\e[0m\]\[\e[1;42;37m\]  \[\e[0m\]\[\e[1;42;37m\]\u \[\e[0m\]\[\e[1;41;37m\] \[\e[0m\]\[\e[1;41;37m\]\W \[\e[0m\] '

fastfetch
