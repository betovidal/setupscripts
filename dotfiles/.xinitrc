xset r rate 150 30
xset m 0 0
# $xinput list
# $xinput list-props <id|name>
# $xinput set-prop <id|name> <propname> <value>
# For mouse speed, try <libinput Accel Speed|Device Accel Constant Deceleration>
#   (depending on the driver)
xinput set-prop "PixArt Microsoft USB Optical Mouse" "libinput Accel Speed" -0.4
# Avoid Android Studio grey screen on startup
export _JAVA_AWT_WM_NONREPARENTING=1
# Use custom dpi
xrdb ~/.Xresources
# Kb layout
setxkbmap latam
# slstatus &
# For allowing notifications
dunst &
feh --bg-fill ~/Pictures/bg.png &
# exec dwm
exec i3
# sxhkd &
# exec bspwm
