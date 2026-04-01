#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar --add item calendar left \
	--set calendar update_freq=15 \
	icon.color="$COLOR" \
	icon.padding_left=4 \
	label.color="$COLOR" \
	label.padding_right=10 \
	script="$PLUGIN_DIR/calendar.sh"
