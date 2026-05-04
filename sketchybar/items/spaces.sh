#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change

sketchybar --add item spacer.1 center \
	--set spacer.1 background.drawing=off \
	label.drawing=off \
	icon.drawing=off \
	width=10

for sid in 1 2 3 4 5; do
	case "$sid" in
		1) icon="󰆍" ;;   # terminal
		3) icon="󰖟" ;;   # browser
		4) icon="󱜙" ;;   # claude (AI/robot)
		5) icon="󰙯" ;;   # discord
		*) icon="" ;;
	esac
	sketchybar --add item space.$sid center \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid \
		icon="$icon" \
		icon.padding_left=6 \
		icon.padding_right=2 \
		label="$sid" \
		label.padding_left=2 \
		label.padding_right=8 \
		click_script="aerospace workspace $sid" \
		script="$PLUGIN_DIR/aerospace.sh $sid"
done

sketchybar --add bracket spaces_left '/space\.[1-5]/' \
	--set spaces_left background.border_width="$BORDER_WIDTH" \
	background.border_color="$RED" \
	background.corner_radius="$CORNER_RADIUS" \
	background.color="$BAR_COLOR" \
	background.height=26 \
	background.drawing=on

sketchybar --add item spacer.gap center \
	--set spacer.gap background.drawing=off \
	label.drawing=off \
	icon.drawing=off \
	width=219

for sid in 6 7 8 9; do
	case "$sid" in
		7) icon="󰎄" ;;   # music
		8) icon="󰭹" ;;   # chat
		9) icon="󰇮" ;;   # mail
		*) icon="" ;;
	esac
	sketchybar --add item space.$sid center \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid \
		icon="$icon" \
		icon.padding_left=6 \
		icon.padding_right=2 \
		label="$sid" \
		label.padding_left=2 \
		label.padding_right=8 \
		click_script="aerospace workspace $sid" \
		script="$PLUGIN_DIR/aerospace.sh $sid"
done

sketchybar --add bracket spaces_right '/space\.[6-9]/' \
	--set spaces_right background.border_width="$BORDER_WIDTH" \
	background.border_color="$RED" \
	background.corner_radius="$CORNER_RADIUS" \
	background.color="$BAR_COLOR" \
	background.height=26 \
	background.drawing=on

sketchybar --add item spacer.2 center \
	--set spacer.2 background.drawing=off \
	label.drawing=off \
	icon.drawing=off \
	width=55
