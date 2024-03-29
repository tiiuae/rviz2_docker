FROM ghcr.io/tiiuae/fog-ros-baseimage:sha-ddd3341
COPY scripts /scripts
COPY rviz /rviz
COPY config/menu.xml /etc/xdg/openbox/menu.xml

RUN apt update

ENV PATH=${PATH}:/scripts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

