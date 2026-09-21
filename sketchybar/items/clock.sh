#!/usr/bin/env bash

COLOR="$MAGENTA"
BACKGROUND_COLOR="$BAR_COLOR"

sketchybar --add item clock left \
	--set clock update_freq=1 \
	icon.padding_left=4 \
	icon.color="$COLOR" \
	icon="" \
	label.color="$COLOR" \
	label.padding_right=3 \
	label.width=60 \
	align=center \
	background.drawing=on \
	background.color="$BACKGROUND_COLOR" \
	background.corner_radius=8 \
	background.height=26 \
	script="$PLUGIN_DIR/clock.sh"
