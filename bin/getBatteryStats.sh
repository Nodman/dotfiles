#!/bin/bash
pmset -g batt | tail -n -1 | awk '{printf "%d%%\n", $3}'
