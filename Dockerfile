FROM ghcr.io/tiiuae/fog-ros-baseimage:sha-c51e8f8

COPY scripts /scripts
COPY rviz /rviz
COPY config/menu.xml /etc/xdg/openbox/menu.xml

ENV PATH=${PATH}:/scripts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

