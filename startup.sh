#!/usr/bin/env bash

#
swaymsg 'exec fcitx -d --replace'

# webwork space
swaymsg 'workspace 1; exec vivaldi --remote-debugging-port=9222'

# swaymsg 'workspace 2; exec ~/.config/nvim/start.sh'
swaymsg 'workspace 2'

# temp workspace 3
swaymsg 'workspace 3'

# reading workspace 
swaymsg 'workspace 4'

# set workspace 2 as home workspace
swaymsg 'workspace number 2'

# start goldendict
# swaymsg 'exec ~/.local/bin/dict.AppImage'

# get wireguard port
# ~/.config/sway/get_wireguard_port.sh
