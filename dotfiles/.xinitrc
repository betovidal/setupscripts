xset r rate 150 30
xset m 0 0
export _JAVA_AWT_WM_NONREPARENTING=1
xrdb ~/.Xresources
setxkbmap latam
slstatus &
dunst &
feh --bg-fill ~/Pictures/bg.png &
exec dwm

