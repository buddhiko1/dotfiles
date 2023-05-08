#!/usr/bin/env bash

# webwork space
swaymsg 'workspace 1; exec vivaldi --remote-debugging-port=9222'

# editor workspace
sleep 3
# swaymsg 'workspace 2; exec ~/.config/nvim/start.sh'
swaymsg 'workspace 2'

# temp workspace 3
swaymsg 'workspace 3'

# reading workspace 
swaymsg 'workspace 4'

# start other app
# swaymsg 'exec goldendict'

# set workspace 2 as home workspace
swaymsg 'workspace number 2'

# audio
swaymsg 'exec pulseaudio -D'

# get wireguard port
sudo ~/.config/sway/get_wireguard_port.sh
