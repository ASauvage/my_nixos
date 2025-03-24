#
# ~/.bash_aliases
#

# Shortcut
alias ..='cd ..'
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'
alias documents='cd ~/Documents'
alias pictures='cd ~/Pictures'
alias music='cd ~/Music'
alias videos='cd ~/Videos'
alias repos='cd ~/repositories'

alias hyprbinds='vim ~/.config/hypr/hyprland/bind.conf'

# System
alias bashrc='vim ~/.bash_aliases'

alias ls='ls --color=auto'
alias li='ls -li'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rm='rm -i'


# Python
alias py='python3'
alias createvenv='python3 -m venv .venv --upgrade-deps && echo .venv created'
alias requirements='pip install -r requirements.*{txt, pip}'

# Git


# QoL
alias grep='grep --color=auto'
alias mongostart='sudo systemctl start mongodb.service'
alias mongostop='sudo systemctl stop mongodb.service'

# Other
