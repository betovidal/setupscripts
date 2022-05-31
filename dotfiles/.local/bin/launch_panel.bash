#!/usr/bin/bash

# Adapted from https://github.com/polybar/polybar/issues/763#issuecomment-392960721

killall -q panel.sh

panel.sh &
