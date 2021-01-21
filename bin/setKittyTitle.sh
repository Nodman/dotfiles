#!/bin/bash

# kitty_pid=$(ps -A | grep -m1 kitty | awk '{print $1}')

# kitty @ "--to=unix:/tmp/mykitty-${kitty_pid}" ls | jq ".[0].tabs[0].title" | awk -F " - " '{printf $2}' | sed -E 's/\\"|"//g' | sed 's/ *$//g'

kitty_title=$(kitty @ ls | jq ".[0].tabs[0].title" | awk -F " - " '{printf $2}' | sed -E 's/\\"|"//g' | sed 's/ *$//g')

tmux_pane_kitty_key=$(getKittyPaneTitleKey)

setenv_cmd="tmux setenv ${tmux_pane_kitty_key} '${kitty_title}'"

eval $setenv_cmd
