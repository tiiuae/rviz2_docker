#!/bin/bash
source /opt/ros/humble/setup.bash

# make VNC port configurable (prepare for moving to a dedicated port)
vnc_port="${VNC_PORT:=3000}"

# start X11 server
Xvfb :0 -screen 0 1920x1080x16 &

# start VNC server
x11vnc -display :0 -rfbport "$vnc_port" -forever -xkb -noxrecord -noxfixes -noshm -nopw -wait 5 -shared &

# start window manager
HOME=/root DISPLAY=:0 USER=root openbox
