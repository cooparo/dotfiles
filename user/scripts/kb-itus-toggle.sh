#!/usr/bin/env bash

# Get the current keyboard layout
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Switch to the opposite layout
if [ "$current_layout" == "us" ]; then
    new_layout="it"  # Replace with the layout you want to switch to
else
    new_layout="us"
fi

# Apply the new layout
setxkbmap $new_layout