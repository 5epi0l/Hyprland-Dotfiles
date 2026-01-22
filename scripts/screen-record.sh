!/bin/bash

DISPLAY="$(hyprctl monitors | head -n 1 | cut -d ' ' -f 2)"

notify-send -u normal -i video-display "Recording Screen" "Display: $DISPLAY"

wf-recorder -a -Dyf ~/Videos/recordings/video.mp4

