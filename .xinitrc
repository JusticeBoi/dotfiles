[[ -f ~/.config/Xresources/.Xresources ]] && xrdb -merge -I$HOME ~/.config/Xresources/.Xresources
xbindkeys
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
picom -b
#/home/oguz/.fehbg &
exec i3

