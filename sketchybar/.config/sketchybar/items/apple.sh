#!/bin/bash

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

apple_logo=(
  icon=$APPLE
  icon.font="$FONT:Black:16.0"
  icon.color=$WHITE
  padding_right=15
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
)

apple_prefs=(
  icon="󰢻"
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
  icon="󰨭"
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
  icon="󰷛"
  label="Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_shutdown=(
  icon="󰙧"
  label="Shutdown"
  click_script="osascript -e 'tell application \"System Events\" to shut down'; $POPUP_OFF"
)

apple_restart=(
  icon="󰜉"
  label="Restart"
  click_script="osascript -e 'tell application \"System Events\" to restart'; $POPUP_OFF"
)

apple_logout=(
  icon="󰿅"
  label="Logout"
  click_script="osascript -e 'tell application \"System Events\" to log out'; $POPUP_OFF"
)

# Add the main apple logo
sketchybar --add item apple.logo left \
  --set apple.logo "${apple_logo[@]}"

# Add the dropdown options
sketchybar --add item apple.prefs popup.apple.logo \
  --set apple.prefs "${apple_prefs[@]}"

sketchybar --add item apple.activity popup.apple.logo \
  --set apple.activity "${apple_activity[@]}"

sketchybar --add item apple.lock popup.apple.logo \
  --set apple.lock "${apple_lock[@]}"

# Add shutdown, restart, and logout options
sketchybar --add item apple.shutdown popup.apple.logo \
  --set apple.shutdown "${apple_shutdown[@]}"

sketchybar --add item apple.restart popup.apple.logo \
  --set apple.restart "${apple_restart[@]}"

sketchybar --add item apple.logout popup.apple.logo \
  --set apple.logout "${apple_logout[@]}"
