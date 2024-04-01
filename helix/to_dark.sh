#!/bin/bash

# Set file path
file_path="$HOME/.config/helix/config.toml"

# Set theme
dark_theme="github_dark"


# Replace theme value in first line of file with 'data'
sed -i '1s/theme = .*/theme = "github_dark"/' $file_path

pkill -USR1 hx

alacritty-themes github_dark > /dev/null
rm -rf ~/.config/alacritty/*.bak
