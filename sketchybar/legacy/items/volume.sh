#!/usr/bin/env bash

COLOR="$GREEN"
BACKGROUND_COLOR="$BAR_COLOR"

sketchybar \
	--add item sound right \
	--set sound \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.color="$COLOR" \
	label.padding_right=10 \
	background.drawing=on \
	background.color="$BACKGROUND_COLOR" \
	background.corner_radius=8 \
	background.height=26 \
	script="$PLUGIN_DIR/sound.sh" \
	--subscribe sound volume_change
