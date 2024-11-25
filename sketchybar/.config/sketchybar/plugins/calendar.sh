#!/bin/bash

# sketchybar --set "$NAME" label="$(date +'%a %d %b %H:%M:%S')"
sketchybar --set "$NAME" icon="$(date '+%a %d. %b')" label="$(date '+%H:%M')"
