#!/usr/bin/env bash

ps aux | grep [l]ibinput | awk '{print $2}' | xargs sudo kill -9
libinput-gestures 
