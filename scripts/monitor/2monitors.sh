#! /bin/bash

mapfile -t monitors < <(bspc query -M --names)

onlyExternal(){
    for m in ${monitors[*]} ; do
        if [[ "$m" != "eDP1" ]] ; then
            bspc monitor "eDP1" -a Desktop > /dev/null
            bspc desktop 0 --to-monitor "$m"
            bspc monitor "eDP1" --remove
            xrandr --output "eDP1" --off
        fi
    done
}

both(){
    for m in ${monitors[*]} ; do
        if [[ "$m" != "eDP1" ]] ; then
            xrandr --output "eDP1" --auto --primary --output "$m" --auto --above "eDP1"
            bspc desktop 0 --to-monitor "eDP1"
            bspc desktop Desktop --remove > /dev/null
        fi
    done
}
#onlyExternal
both
