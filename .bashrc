#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v="nvim"
alias g="git"

PS1='[\u@\h \W]\$ '

fish
nvm use lts/hydrogen

# Load Angular CLI autocompletion.
source <(ng completion script)
. "$HOME/.cargo/env"
