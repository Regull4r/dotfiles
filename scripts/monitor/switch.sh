#!/bin/bash

mapfile -t monitors < <(bspc query -M --names)
mapfile -t desktops < <(bspc query -D --names)

toExternal(){
    for m in ${monitors[*]} ; do
        if [[ "$m" != "eDP1" ]] ; then
            bspc monitor "eDP1" -a Temp > /dev/null
            for d in ${desktops[*]}; do
                bspc desktop "$d" --to-monitor "$m"
            done
        fi
    bspc monitor DP1 -o 1 2 3 4 5 6 7 8 9 0
    break
    done
}

toIntegrated(){
    for m in ${monitors[*]} ; do
        if [[ "$m" != "eDP1" ]] ; then
            bspc monitor "$m" -a Temp > /dev/null
            for d in ${desktops[*]}; do
                bspc desktop "$d" --to-monitor "eDP1"
            done
            bspc monitor "$m" --remove > /dev/null
        fi
    done
}

toIntegrated
