#!/bin/bash
source /opt/ros/galactic/setup.bash

# start X11 server
Xvfb :0 -screen 0 1920x1080x24 &

# start VNC server
x11vnc -display :0 -rfbport 3000 -forever -xkb -noxrecord -noxfixes -nopw -wait 5 -shared &

# start window manager
HOME=/root DISPLAY=:0 USER=root openbox
