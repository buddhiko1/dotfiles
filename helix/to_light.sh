#!/bin/bash

alacritty_config="$HOME/.config/alacritty/alacritty.toml"
sed -i 's/github_dark/github_light/g' $alacritty_config

hx_config="$HOME/.config/helix/config.toml"
sed -i '1s/theme = "github_dark"/theme = "github_light"/' $hx_config
pkill -USR1 hx
