#!/bin/bash
# Path: items/microphone.sh

microphone_icon=(
  click_script="$PLUGIN_DIR/microphone_click.sh"
  icon=󰍬
  icon.color=$WHITE
  icon.font="$FONT:Regular:20.0"
  label.drawing=off
  padding_left=10
)

status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add item microphone right \
  --set microphone "${microphone_icon[@]}"

sketchybar --add bracket status brew github.bell wifi microphone \
  --set status "${status_bracket[@]}"
