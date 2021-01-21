#!/bin/bash

echo "KITTY_PANE_KEY_$(tmux display -p "#D")" | sed "s/%//g"
