#!/bin/bash -e

_term() {
	# FILL UP PROCESS SEARCH PATTERN HERE TO FIND PROPER PROCESS FOR SIGINT:
	pattern="component_container_mt"

	pid_value="$(ps -ax | grep $pattern | grep -v grep | awk '{ print $1 }')"
	if [ "$pid_value" != "" ]; then
		pid=$pid_value
		echo "Send SIGINT to pid $pid"
	else
		pid=1
		echo "Pattern not found, send SIGINT to pid $pid"
	fi
	kill -s SIGINT $pid
}
# Use SIGTERM or TERM, does not seem to make any difference.
trap _term TERM

ROS_FLAGS=""
if [[ ${SIMULATION+x} != "" ]]; then
	ROS_FLAGS="use_sim_time:=true ${ROS_FLAGS}"
fi

source /opt/ros/humble/setup.bash

# make VNC port configurable (prepare for moving to a dedicated port)
vnc_port="${VNC_PORT:=3000}"

# start X11 server
Xvfb :0 -screen 0 1920x1080x16 &

# start VNC server
x11vnc -display :0 -rfbport "$vnc_port" -forever -xkb -noxrecord -noxfixes -noshm -nopw -wait 5 -shared &

# start window manager
HOME=/root DISPLAY=:0 USER=root openbox
