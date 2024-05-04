#!/bin/bash

alacritty_config="$HOME/.config/alacritty/alacritty.toml"
sed -i 's/github_light/github_dark/g' $alacritty_config

hx_config="$HOME/.config/helix/config.toml"
sed -i '1s/theme = "github_light"/theme = "github_dark"/' $hx_config
pkill -USR1 hx
