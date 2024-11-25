#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space."$sid" left \
    --subscribe space."$sid" aerospace_workspace_change \
    --set space."$sid" \
    icon="$sid" \
    label.font="sketchybar-app-font:Regular:16.0" \
    click_script="aerospace workspace $sid" \
    script="$PLUGIN_DIR/aerospace.sh $sid"
  # label.padding_right=20 \
  # label.y_offset=-1 \
done

sketchybar --add item space_separator left \
  --set space_separator icon="􀆊" \
  icon.color="$ACCENT_COLOR" \
  icon.padding_left=4 \
  label.drawing=off \
  background.drawing=off
# script="$PLUGIN_DIR/space_windows.sh" \
# --subscribe space_separator space_windows_change