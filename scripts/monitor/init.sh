#!/bin/bash

mapfile -t monitors < <(bspc query -M --names)

numMonitors=${#monitors[@]}

if [[ $numMonitors == 1 ]]; then
    bspc monitor -d 1 2 3 4 5 6 7 8 9 0
elif [[ $numMonitors == 2 ]]; then
    xrandr --output eDP1 --primary --auto --output DP1 --auto --above eDP1
    bspc monitor DP1 -d 1 2 3 4 5 6 7 8 9
    bspc monitor eDP1 -d 0
fi

# primary=false
# desktops=(1 2 3 4 5 6 7 8 9 0)
# prev=
# #numDesktops=${#desktops[@]}
# for m in ${monitors[*]} ; do
#     if [[ "$m" != "eDP1" && ! primary ]] ; then
#         xrandr --output "$m" --auto --primary
#         bspc monitor "$m" -d "${desktops[@]:0:-numMonitors}"
#         prev="$m"
#         primary=true
#     else
#         xrandr --output "$m" --auto --above "$prev"
#         bspc monitor "$m" -d "${desktops[@]}"
