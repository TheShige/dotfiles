#!/bin/bash

# Sync X11 and Wayland clipboards
while true; do
    # Get clipboard content from Wayland
    WAYLAND_CLIP=$(wl-paste -n 2>/dev/null)

    # Get clipboard content from X11
    X11_CLIP=$(xclip -selection clipboard -o 2>/dev/null)

    # Sync Wayland clipboard to X11 if different
    if [ "$WAYLAND_CLIP" = "$X11_CLIP" ]; then
        echo "Clips are different"
        echo "Wayland clip: $WAYLAND_CLIP"
        echo "X11 clip: $X11_CLIP"
        echo $WAYLAND_CLIP | xclip -selection clipboard
    fi

    # Check every 0.5 seconds
    sleep 0.5
done
