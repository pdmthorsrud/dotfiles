#!/usr/bin/env bash

COLOR="$MAGENTA"

sketchybar --add item clock left \
	--set clock update_freq=1 \
	icon.padding_left=10 \
	icon.color="$COLOR" \
	icon="" \
	label.color="$COLOR" \
	label.padding_right=5 \
	label.width=78 \
	align=center \
	script="$PLUGIN_DIR/clock.sh"
