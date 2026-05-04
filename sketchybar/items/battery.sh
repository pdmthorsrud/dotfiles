#!/usr/bin/env bash

COLOR="$CYAN"
BACKGROUND_COLOR="$BAR_COLOR"

sketchybar --add item battery right \
	--set battery \
	update_freq=60 \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.padding_right=5 \
	label.color="$COLOR" \
	background.drawing=on \
	background.color="$BACKGROUND_COLOR" \
	background.corner_radius=8 \
	background.height=26 \
	script="$PLUGIN_DIR/power.sh" \
	--subscribe battery power_source_change
