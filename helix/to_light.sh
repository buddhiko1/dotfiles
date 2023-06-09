#!/bin/bash

# Set file path
file_path="$HOME/.config/helix/config.toml"

# Set theme
light_theme="github_light"

# Replace theme value in first line of file with 'data'
sed -i '1s/theme = .*/theme = "github_light"/' $file_path

pkill -USR1 hx

alacritty-themes $light_theme > /dev/null
