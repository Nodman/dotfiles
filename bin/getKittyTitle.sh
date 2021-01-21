#!/bin/bash

tmux_pane_kitty_key=$(getKittyPaneTitleKey)

# echo $tmux_pane_kitty_key
tmux showenv ${tmux_pane_kitty_key} | sed "s:^.*=::"
