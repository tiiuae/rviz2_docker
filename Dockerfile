FROM ghcr.io/tiiuae/fog-ros-baseimage:stable
# FROM ghcr.io/tiiuae/fog-ros-baseimage:sha-1cabd43

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    xvfb x11vnc openbox xfce4-terminal ros-galactic-rviz2 vim ros-galactic-rviz-default-plugins ros-galactic-rviz-visual-tools ros-galactic-fognav-msgs\
    && rm -rf /var/lib/apt/lists/* 

COPY scripts /scripts
COPY rviz /rviz
COPY config/menu.xml /etc/xdg/openbox/menu.xml

ENV PATH=${PATH}:/scripts


COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

