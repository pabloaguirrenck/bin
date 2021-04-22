#!/bin/sh

if sessionlist=$(tmux ls); then

    echo "$sessionlist" | while read -r line; do
        session=$(echo "$line" | cut -d ':' -f 1)

        if echo "$line" | grep -q "(attached)"; then
            status="(a)"
        else
            status=""
        fi

        printf "%s%s " "$session" "$status" | tr a-z A-Z
    done

else
    printf "\n"
fi
