#!/usr/bin/env bash
status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

vol=$(echo "$status" | awk '{gsub(/[^0-9.]/,"",$2); printf "%.0f", $2*100}')
if echo "$status" | grep -q "MUTED"; then
	echo "$vol% " > ~/.config/waybar/scripts/vol-popup
else
    echo "$vol% " > ~/.config/waybar/scripts/vol-popup
fi

sleep 5

echo "" > ~/.config/waybar/scripts/vol-popup