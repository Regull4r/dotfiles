#!/bin/bash

mapfile -t monitors < <( xrandr | grep " connected " | awk '{print $1}' )
numMonitors=${#monitors[@]}

#xrandr --output eDP1 --primary --auto

if [[ numMonitors -eq 1 ]]; then
    mapfile -t activeMonitors < <(xrandr --listactivemonitors | awk 'NR>1{print $NF}')
    for m in ${activeMonitors[*]}; do
        if [[ $m != ${monitors[0]} ]]; then
        echo "chu"
            xrandr --output "$m" --off
        fi
    done
    xrandr --output "${monitors[0]}" --primary --auto
elif [[ numMonitors -eq 2 ]]; then
    mapfile -t activeMonitors < <(xrandr --listactivemonitors | awk 'NR>1{print $NF}')
    numActiveMonitors=${#activeMonitors[@]}
    if [[ numActiveMonitors -eq 1 ]]; then
        xrandr --output "${monitors[1]}" --auto --output "${monitors[0]}" --auto --below "${monitors[1]}"
    elif [[ numActiveMonitors -eq 2 ]]; then
        xrandr --output "${monitors[1]}" --auto --output "${monitors[0]}" --off
    fi
fi
