#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias scrot='scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png'
PS1='[\u@\h \W]\$ '
