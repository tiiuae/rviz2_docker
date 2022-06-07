FROM ghcr.io/tiiuae/fog-ros-baseimage:stable
# FROM ghcr.io/tiiuae/fog-ros-baseimage:sha-1cabd43

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    xvfb x11vnc openbox xfce4-terminal ros-galactic-rviz2 vim \
    && rm -rf /var/lib/apt/lists/* 

COPY rviz /rviz
COPY config/menu.xml /etc/xdg/openbox/menu.xml

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

