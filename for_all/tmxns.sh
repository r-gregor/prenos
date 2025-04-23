#! /usr/bin/env bash

DT=$(date +"%H%M%S")
# tmux new-session -s "${DT}"\; split-window -v \; send-keys "${HOME}/majstaf_en/majbin_en/BrthReminder/BrthReminder_c_color.exe" Enter
tmux new-session -s "${DT}"\; send-keys "${HOME}/majstaf_en/majbin_en/BrthReminder/BrthReminder_c_color.exe" Enter

