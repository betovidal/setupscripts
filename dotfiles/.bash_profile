#
# ~/.bash_profile
#
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Platform specific configurations
SPECIFIC_PROF=""
case "$OSTYPE" in
    darwin*)
        SPECIFIC_PROF="$HOME/.config/darwin_profile"
        ;;
esac
[ -f "$SPECIFIC_PROF" ] && . "$SPECIFIC_PROF"

composer_path="$HOME/.config/composer/vendor/bin"
if [ -d "$composer_path" ]; then
    PATH="$composer_path:$PATH"
fi

nx_path="/usr/NX/bin"
if [ -d "$nx_path" ]; then
    PATH="$nx_path:$PATH"
fi

splat_path="$HOME/Repos/splatmoji"
if [ -d  "$splat_path" ]; then
    PATH="$splat_path:$PATH"
fi

android_path="$HOME/Android/Studio/bin"
if [ -d "$android_path" ]; then
    PATH="$android_path:$PATH"
fi

local_bin_path="$HOME/.local/bin"
if [ -d "$local_bin_path" ]; then
    PATH="$local_bin_path:$PATH"
fi

npm_global_path="$HOME/.npm-global/bin"
if [ -d "$npm_global_path" ]; then
    PATH="$npm_global_path:$PATH"
fi

# Check if rubygems is installed and add to path
if command -v gem &> /dev/null
then
    GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export GEM_HOME
    PATH="$GEM_HOME/bin:$PATH"
fi

# TODO: Move to specific script to configure this. Invoked by bspwm, not here.
# Panel related (bspwm)
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT="-*-terminus-*-*-*-*-24-*-*-*-*-*-*-*"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME

TERM=xterm-256color
EDITOR=vim
JAVA_HOME=/usr/lib/jvm/default
export TERM EDITOR JAVA_HOME PATH
