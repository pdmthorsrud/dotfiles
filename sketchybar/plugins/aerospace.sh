#!/usr/bin/env bash

export PATH="/opt/homebrew/bin:$PATH"

source "$HOME/.config/sketchybar/variables.sh"

WORKSPACE="$1"

WINDOWS=$(aerospace list-windows --workspace "$WORKSPACE" 2>/dev/null)

if [ -z "$WINDOWS" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		label="$WORKSPACE" \
		label.color="$RED"
elif [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		label="$WORKSPACE" \
		label.color="$ORANGE"
else
	sketchybar --animate tanh 5 --set "$NAME" \
		label="$WORKSPACE" \
		label.color="$COMMENT"
fi
