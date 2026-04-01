#!/usr/bin/env bash

export PATH="/opt/homebrew/bin:$PATH"

source "$HOME/.config/sketchybar/variables.sh"

WORKSPACE="$1"

case "$WORKSPACE" in
	1) icon="󰆍"; icon_offset=0.8 ;;
	3) icon="󰖟"; icon_offset=0.8 ;;
	4) icon="󱜙"; icon_offset=1 ;;
	5) icon="󰙯"; icon_offset=0 ;;
	7) icon="󰎄"; icon_offset=0.8 ;;
	8) icon="󰭹"; icon_offset=0 ;;
	9) icon="󰇮"; icon_offset=1 ;;
	*) icon=""; icon_offset=0 ;;
esac

WINDOWS=$(aerospace list-windows --workspace "$WORKSPACE" 2>/dev/null)

if [ -z "$WINDOWS" ]; then
	if [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
		COLOR="$ORANGE"
	else
		COLOR="$COMMENT"
	fi
	sketchybar --animate tanh 5 --set "$NAME" \
		icon="●" \
		icon.drawing=on \
		icon.color="$COLOR" \
		icon.y_offset=0.5 \
		label="$WORKSPACE" \
		label.color="$COLOR"
elif [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		icon="$icon" \
		icon.drawing=on \
		icon.color="$ORANGE" \
		icon.y_offset="$icon_offset" \
		label="$WORKSPACE" \
		label.color="$ORANGE"
else
	sketchybar --animate tanh 5 --set "$NAME" \
		icon="$icon" \
		icon.drawing=on \
		icon.color="$COMMENT" \
		icon.y_offset="$icon_offset" \
		label="$WORKSPACE" \
		label.color="$COMMENT"
fi
