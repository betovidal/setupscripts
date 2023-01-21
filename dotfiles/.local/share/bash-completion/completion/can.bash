#!/usr/bin/env bash

# More at https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html

# can $user $perm $file

SCRIPT="can"
_can_completions() {
    unset COMPREPLY
    # Only complete the second argument
    # Usernames
    if [ "${#COMP_WORDS[@]}" = "2" ]; then
        # words=$(cat /etc/passwd | cut -d ":" -f 1)
        COMPREPLY=($(compgen -u "${COMP_WORDS[-1]}"))
    elif [ "${#COMP_WORDS[@]}" = "3" ]; then
        words="r read w write x execute"
        COMPREPLY=($(compgen -W "$words" "${COMP_WORDS[-1]}"))
    fi
}
#        -o default after no more matches are present, use the default
#        completion function.
complete -o default -F _can_completions "$SCRIPT"
