#!/bin/bash

function run_figlet
{
    figlet -w 100 -f "${FIGLET_FONT}" "$@"
}

TMP_FILE='/tmp/random-figlet-font'

function set_font
{
    FIGLET_FONT="${fonts[RANDOM % ${#fonts[@]}]}"
    #echo "${FIGLET_FONT}" >> "${TMP_FILE}" # DEBUG
}

# future — another good font, but is not currently available
fonts=(big slant small smslant lean standard)

if [[ $# -gt 0 ]]
then
    text="$1"
    set_font
    run_figlet "$text"
else
    while true
    do
        text=$(look . | grep -E "^[a-z]*$" | shuf | head -1 | xargs)
        set_font
        run_figlet "$text"
        sleep 1s
    done
fi
