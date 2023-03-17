FROM ghcr.io/tiiuae/fog-ros-baseimage-builder:sha-11bedfa

COPY scripts /scripts
COPY rviz /rviz
COPY config/menu.xml /etc/xdg/openbox/menu.xml

RUN apt update

ENV PATH=${PATH}:/scripts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

