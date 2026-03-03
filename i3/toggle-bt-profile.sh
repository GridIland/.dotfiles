#!/bin/bash

CARD=$(pactl list cards short | grep bluez_card | head -n 1 | awk '{print $2}')

if [ -z "$CARD" ]; then
    notify-send "Bluetooth" "No Bluetooth headset connected"
    exit 1
fi

ACTIVE_PROFILE=$(pactl list cards | grep -A 30 "$CARD" | grep "Active Profile:" | awk '{print $3}')

if [[ "$ACTIVE_PROFILE" == a2dp-sink* ]]; then
    if pactl set-card-profile "$CARD" headset-head-unit-msbc 2>/dev/null; then
        notify-send "Bluetooth" "Switched to Headset mode (mic enabled)"
    elif pactl set-card-profile "$CARD" headset-head-unit 2>/dev/null; then
        notify-send "Bluetooth" "Switched to Headset mode (mic enabled)"
    else
        notify-send "Bluetooth" "Failed to switch profile"
    fi
else
    pactl set-card-profile "$CARD" a2dp-sink
    notify-send "Bluetooth" "Switched to A2DP mode (high quality)"
fi
