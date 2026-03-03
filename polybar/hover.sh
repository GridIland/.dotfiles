#!/bin/bash

EDGE_THRESHOLD=2
VISIBLE=0

export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d'x' -f2)

while true; do
    eval $(xdotool getmouselocation --shell)

    if [ "$Y" -ge "$((SCREEN_HEIGHT - EDGE_THRESHOLD))" ]; then
        if [ "$VISIBLE" -eq 0 ]; then
            /usr/bin/polybar-msg cmd show
            VISIBLE=1
        fi
    else
        if [ "$VISIBLE" -eq 1 ]; then
            /usr/bin/polybar-msg cmd hide
            VISIBLE=0
        fi
    fi

    sleep 0.05
done

