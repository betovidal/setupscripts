#!/usr/bin/env bash

n ()
{
    # Block nesting of nnn in subshells
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    # export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

repos () {
	if [ "$1" == "i" ] || [ "$1" == "install" ]; then
		for d in */; do
			echo "Installing $d - - - -"
			cd "$d" || echo "Could not enter $d"; continue;
			makepkg -sirc --needed
			cd ..
			echo ""
		done;
	elif [ "$1" == "u" ] || [ "$1" == "update" ]; then
		for d in */; do
			echo "- = Updating $d = -"
			cd "$d" || echo "Could not enter $d"; continue;
			git pull
			cd ..
			echo ""
		done;
	else
		echo "Available arguments: [i|install]|[u|update]"
	fi
}

start_web () {
	sudo systemctl start nginx
	sudo systemctl start mariadb
	sudo systemctl start php-fpm
}

stop_web () {
	sudo systemctl stop nginx
	sudo systemctl stop mariadb
	sudo systemctl stop php-fpm
}

steam_update_on_launch () {
	STEAM_FOLDER="$HOME/.steam/steam/steamapps"
	sed -i 's/\("AutoUpdateBehavior".*\)"0"/\1"1"/' "${STEAM_FOLDER}"/*.acf
}
