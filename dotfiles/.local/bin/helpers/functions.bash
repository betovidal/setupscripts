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
vv () {
    arg="$1"
    fname="vv"
    filename="${arg}.conf"
    custom_script="$HOME/.local/bin/helpers/vpnc-custom.sh"
    conf_path="$HOME/.config/vpnconf/${filename}"
    print_vv_usage() {
        printf "$fname CONF: Start a VPNC connection.\n"
        echo "Where:"
        echo "  CONF is a valid vpnc configuration file, stored in"
        echo "  ~/.config/vpnconf/*.conf"
    }
    if [ ! "$arg" ]; then
        print_vv_usage
        return
    fi
    # Argument provided. Go on...
    if [ -f "${conf_path}" ] && [ -x "$custom_script" ]; then
        trap 'trap - TERM; kill 0' INT TERM QUIT EXIT
        WAIT=5
        while true; do
            # TODO this needs Ctrl+c to finish. Alternatively use Ctrl+z
            sudo vpnc --enable-1des "$conf_path" --script "$custom_script"
            echo "Retrying in $WAIT seconds"
            sleep $WAIT;
        done;
    else
        echo "Error: Make sure the configuration file ${conf_path} exists and"
        echo "  that the script $custom_script exists and"
        echo "  it's executable."
    fi
}
ve () {
    arg="$1"
    fname="ve"
    reqs="requirements.txt"
    activation_script="./venv/bin/activate"
    in_venv () {
        # https://stackoverflow.com/a/15454916/7274945
        pycmd='import sys; print ("1" if hasattr(sys, "real_prefix") else "0")'
        python -c "$pycmd"
    }
    print_help() {
        printf "$fname: Simple python venv operations\n"
        echo "Available commands:"
        echo "  $fname [-h|--help|h|help] Show help"
        echo "  $fname [c|create]         Clear and create venv in ./venv"
        echo "  $fname [a|activate|on]    Activate venv in ./venv/bin/activate"
        echo "  $fname [d|deactivate|off] Deactivate venv by calling deactivate"
        echo "  $fname [i|install]        Activate and install requirements.txt"
        echo "  $fname [?]                Check if a venv is currenty active"
    }
    case "$arg" in
        "-h"|"-help"|"--help"|"h"|"help")
            print_help
            ;;
        "c"|"create")
            python -m venv --clear venv/
            ;;
        "a" | "activate" | "on")
            if [ ! -f "$activation_script" ]; then
                echo "No env found or in wrong working directory."
            else
                . "$activation_script"
            fi
            ;;
        "d" | "deactivate" | "off")
            command -v deactivate &> /dev/null && deactivate
            ;;
        "i"|"install")
            if [ ! -f "$activation_script" ]; then
                echo "No env found or in wrong working directory."
            elif [ ! -f "$reqs" ]; then
                echo "No requirements.txt file in here."
            else
                . "$activation_script"
                pip install -r requirements.txt
            fi
            ;;
        "?")
            in_venv
            ;;
        *)
            echo "Option $arg not recognized."
            print_help
            ;;
    esac
}

ureps () {
    fname="ureps"
    if [ "$1" != "go" ]; then
        printf "$fname go: Update git repos 'here'.\n"
        return
    fi
    for d in */; do
        if [ ! -d "${d}.git/" ]; then
            echo "Directory $d does not contain a git repository. Skipping."
            continue;
        fi
        (
            echo "-> Updating $d"
            cd "$d" || return
            git pull
            echo "~~~~~~~~~~~~~~~~~~~~~~"
        )
    done
}

denv () {
    # Declarations
    print_denv_help () {
        fname="denv"
        printf "$fname: Simple services groups operations.\n"
        echo "Usage:"
        echo "  $fname ACTION COLLECTION"
        echo "ACTION is one of: ${actions[*]}"
        echo "COLLECTION is one of: ${collections[*]}"
    }
    actions=(
        "start" "stop" "restart" "is-active" "is-enabled" "status"
    )
    collections=(
        "web"
    )
    # Action checks
    okaction=false
    for action in "${actions[@]}"; do
        if [ "$action" = "$1" ]; then
            okaction=true
        fi
    done
    if ! $okaction; then
        print_denv_help
        return
    fi
    # Collection checks
    okcollection=false
    for collection in "${collections[@]}"; do
        if [ "$collection" = "$2" ]; then
            okcollection=true
        fi
    done
    if ! $okcollection; then
        print_denv_help
        return
    fi
    case "$2" in
        "web")
            services=("nginx" "mariadb" "php-fpm")
            ;;
        *)
            print_denv_help
            return
    esac
    action="$1"
    collection="$2"
    for service in "${services[@]}"; do
        if [ "$action" = "status" ]; then
            sudo systemctl "status" "--no-pager" "$service"
        else
            echo "Query $action on $service"
            sudo systemctl "$action" "$service"
        fi
    done
}
