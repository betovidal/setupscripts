#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -d "/usr/NX/bin" ]; then
	PATH="/usr/NX/bin:$PATH"
fi
if [ -d "$HOME/Repos/splatmoji" ]; then
	PATH="$HOME/Repos/splatmoji:$PATH"
fi
if [ -d "$HOME/Android/Studio/bin" ]; then
	PATH="$HOME/Android/Studio/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Launch mpd if it exists

# Panel related (bspwm)
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT="-*-terminus-*-*-*-*-24-*-*-*-*-*-*-*"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME

TERM=xterm-256color
EDITOR=vim
JAVA_HOME=/usr/lib/jvm/default
export TERM EDITOR JAVA_HOME

source $HOME/.bashrc
