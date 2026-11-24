#!/usr/bin/env bash

export PATH="/opt/homebrew/bin:$PATH"

source "$HOME/.config/sketchybar/variables.sh"

WORKSPACE="$1"

WINDOWS=$(aerospace list-windows --workspace "$WORKSPACE" 2>/dev/null)

if [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		label="$WORKSPACE" \
		label.font="$FONT:Heavy:15.0" \
		label.color="$WHITE" \
		icon.width=0 \
		icon.padding_left=0 \
		icon.padding_right=0 \
		background.drawing=on \
		background.color="$PURPLE" \
		background.height=20 \
		background.corner_radius=10
elif [ -z "$WINDOWS" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		label="$WORKSPACE" \
		label.font="$FONT:Bold:13.0" \
		label.color="$COMMENT" \
		icon.width=0 \
		icon.padding_left=0 \
		icon.padding_right=0 \
		background.drawing=off
else
	sketchybar --animate tanh 5 --set "$NAME" \
		label="$WORKSPACE" \
		label.font="$FONT:Bold:13.0" \
		label.color="$RED" \
		icon.width=0 \
		icon.padding_left=0 \
		icon.padding_right=0 \
		background.drawing=off
fi
