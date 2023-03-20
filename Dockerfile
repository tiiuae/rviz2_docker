FROM ghcr.io/tiiuae/fog-ros-baseimage:sha-11bedfa

RUN apt-get update -y && apt-get install -y \
  ros-humble-rviz2

COPY scripts /scripts
COPY rviz /rviz
COPY config/menu.xml /etc/xdg/openbox/menu.xml

ENV PATH=${PATH}:/scripts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
