#!/bin/bash
killall agsv1
sleep 1
hyprctl dispatch exec agsv1
sleep 5
notify-send "ags has been restarted."