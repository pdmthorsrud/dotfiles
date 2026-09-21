#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change

sketchybar --add item spacer.1 center \
	--set spacer.1 background.drawing=off \
	label.drawing=off \
	width=120

for sid in 1 2 3 4 5 6 7 8 9 10; do
	sketchybar --add item space.$sid center \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid \
		label="$sid" \
		label.padding_left=8 \
		label.padding_right=8 \
		click_script="aerospace workspace $sid" \
		script="$PLUGIN_DIR/aerospace.sh $sid"
done

sketchybar --add bracket spaces_main \
	space.1 space.2 space.3 space.4 space.5 \
	space.6 space.7 space.8 space.9 space.10 \
	--set spaces_main background.border_width="$BORDER_WIDTH" \
	background.border_color="$RED" \
	background.corner_radius="$CORNER_RADIUS" \
	background.color="$BAR_COLOR" \
	background.height=26 \
	background.drawing=on

sketchybar --add item spacer.notch center \
	--set spacer.notch background.drawing=off \
	label.drawing=off \
	width=229

for sid in 11 12 13 14 15 16 17 18 19 20; do
	sketchybar --add item space_x.$sid center \
		--subscribe space_x.$sid aerospace_workspace_change \
		--set space_x.$sid \
		label="$sid" \
		label.padding_left=8 \
		label.padding_right=8 \
		click_script="aerospace workspace $sid" \
		script="$PLUGIN_DIR/aerospace.sh $sid"
done

sketchybar --add bracket spaces_extra \
	space_x.11 space_x.12 space_x.13 space_x.14 space_x.15 \
	space_x.16 space_x.17 space_x.18 space_x.19 space_x.20 \
	--set spaces_extra background.border_width="$BORDER_WIDTH" \
	background.border_color="$RED" \
	background.corner_radius="$CORNER_RADIUS" \
	background.color="$BAR_COLOR" \
	background.height=26 \
	background.drawing=on

sketchybar --add item spacer.2 center \
	--set spacer.2 background.drawing=off \
	label.drawing=off \
	width=55
