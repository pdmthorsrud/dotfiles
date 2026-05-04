#!/usr/bin/env bash

COLOR="$BLUE"
BACKGROUND_COLOR="$BAR_COLOR"

sketchybar --add item calendar left \
	--set calendar update_freq=15 \
	icon.color="$COLOR" \
	icon.padding_left=4 \
	label.color="$COLOR" \
	label.padding_right=10 \
	background.drawing=on \
	background.color="$BACKGROUND_COLOR" \
	background.corner_radius=8 \
	background.height=26 \
	script="$PLUGIN_DIR/calendar.sh"
