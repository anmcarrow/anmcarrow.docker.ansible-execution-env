# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize
PS1="\e[\033[0;92;1;92m\] (\h) Å:\[\033[0m\] "

