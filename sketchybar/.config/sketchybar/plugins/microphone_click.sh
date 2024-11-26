#!/bin/bash

toggle_microphones() {
  which SwitchAudioSource >/dev/null || exit 0
  source "$CONFIG_DIR/colors.sh"

  args=(--remove '/microphone.device\.*/' --set "$NAME" popup.drawing=toggle)
  COUNTER=0
  CURRENT="$(SwitchAudioSource -t input -c)"
  while IFS= read -r device; do
    COLOR=$GREY
    if [ "${device}" = "$CURRENT" ]; then
      COLOR=$WHITE
    fi
    args+=(--add item microphone.device.$COUNTER popup."$NAME"
      --set microphone.device.$COUNTER label="${device}"
      label.color="$COLOR"
      click_script="SwitchAudioSource -t input -s \"${device}\" && sketchybar --set /microphone.device\.*/ label.color=$GREY --set \$NAME label.color=$WHITE --set $NAME popup.drawing=off")
    COUNTER=$((COUNTER + 1))
  done <<<"$(SwitchAudioSource -a -t input)"

  sketchybar -m "${args[@]}" >/dev/null
}

toggle_mute() {
  if [ "$(osascript -e "input volume of (get volume settings)")" -eq 0 ]; then
    osascript -e "set volume input volume 100"
    sketchybar --set microphone icon=󰍬 # Microphone unmuted
  else
    osascript -e "set volume input volume 0"
    sketchybar --set microphone icon=󰍭 # Microphone muted
  fi
}

hide_popup() {
  sketchybar --set microphone popup.drawing=off
}

if [ "$BUTTON" = "right" ]; then
  toggle_microphones
elif [ "$BUTTON" = "left" ]; then
  toggle_mute
elif [ "$SENDER" = "mouse.clicked" ]; then
  hide_popup
fi
