#!/bin/bash
# Get screen height
SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f2)
# Hover zone (pixels from bottom)
TRIGGER=15

while true; do
    # Get mouse Y coordinate
    MOUSE_Y=$(xdotool getmouselocation | awk -F "[ :]" '{print $3}')
    
    # Calculate if mouse is near bottom
    if [ "$MOUSE_Y" -ge $((SCREEN_HEIGHT - TRIGGER)) ]; then
        # Mouse near bottom: SHOW bar
        i3-msg bar mode dock >/dev/null 2>&1
    else
        # Mouse elsewhere: HIDE bar
        i3-msg bar mode hide >/dev/null 2>&1
    fi
    
    sleep 0.1
done
