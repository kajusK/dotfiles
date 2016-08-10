# Check for an interactive session
[ -z "$PS1" ] && return

#start tmux at startup
#test -z "$TMUX" && (tmux attach || tmux new-session)

alias mv='mv -i'
alias cp='cp -i'
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias vboxdrv='sudo modprobe vboxdrv; sudo modprobe vboxnetflt; sudo modprobe vboxnetadp'
alias lamp='sudo systemctl start httpd; sudo systemctl start mysqld'
alias resize='convert -resize 800x '
alias console='console -ljkaderka'
#manual screen settings
alias both='xrandr --output VGA1 --auto; xrandr --output LVDS1 --auto --left-of VGA1'
alias lvds='xrandr --output VGA1 --off; xrandr --output LVDS1 --auto'

#keep longer history and erase duplicit lines
HISTSIZE=10000
HISTFILESIZE=100000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

#update LINES and COLUMNS on resize
shopt -s checkwinsize

export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

#Kicad libs
export KISYS3DMOD=/home/kajus/Prace/dps/kicad/kicad-library/modules/packages3d
export KISYSMOD=/home/kajus/Prace/dps/kicad/kicad-library/modules

#workaround to use dbus in cron
touch $HOME/.dbus/Xdbus
chmod 600 $HOME/.dbus/Xdbus

PS1='\[\e[1;32m\]\u@\h \[\e[01;34m\]\w \$\[\e[00m\] '

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#run when opening terminal
uptime
