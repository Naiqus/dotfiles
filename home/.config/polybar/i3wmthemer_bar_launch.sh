#!/bin/sh

pkill polybar

sleep 1;

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -l error i3wmthemer_bar &
  done
else
  polybar --reload -l error i3wmthemer_bar &
fi

