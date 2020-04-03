[[ -f ~/.config/Xresources/.Xresources ]] && xrdb -merge -I$HOME ~/.config/Xresources/.Xresources

[ -f ~/.xprofile ] && . ~/.xprofile
# xbindkeys

# setxkbmap -option caps:escape
# setxkbmap -layout de
# setxkbmap de

# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
# picom -b
#/home/oguz/.fehbg &
# sh .config/multi_monitor.sh
# exec i3
while :; do
    ssh-agent dwm  || break
done
# exec dwm 

