#!/bin/bash

get_terminal_by_tree() {
    local current_pid=$$ 
    local last_valid_name="Unknown"
    
    while [ "$current_pid" -gt 1 ]; do
        local ppid=$(ps -o ppid= -p "$current_pid" | tr -d ' ')
        local p_name=$(ps -o comm= -p "$ppid" | tr -d ' ')

        # Evaluate by whitelist
        if [[ "$p_name" == "sshd" ]]; then
            echo "OpenSSH (by process)"
            return
        elif [[ "$p_name" == "login" ]]; then
            echo "TTY (by process)"
            return
        fi

        # Ignore system process
        if [[ "$p_name" != "systemd" && "$p_name" != "init" && "$p_name" != "bash" ]]; then
            last_valid_name="$p_name"
        fi

        # Up a level in the process tree
        current_pid="$ppid"
    done

    echo "By process: $last_valid_name"
}

if [[ -n "$TERM_PROGRAM" ]]; then
    REAL_TERM="$TERM_PROGRAM"
elif [[ -n "$TERM" ]]; then
    REAL_TERM="$TERM"
elif [[ -n "$SSH_CLIENT" ]]; then
    CLIENT_IP="${SSH_CLIENT%% *}"
    REAL_TERM="OpenSSH ($CLIENT_IP)"
else
    # Fallback: If variables doesn't exists, read the process tree
    REAL_TERM=$(get_terminal_by_tree)
fi

echo $REAL_TERM
