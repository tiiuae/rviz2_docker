FROM ghcr.io/tiiuae/fog-ros-baseimage:sha-c51e8f8

COPY scripts /scripts
COPY rviz /rviz
COPY config/menu.xml /etc/xdg/openbox/menu.xml

RUN apt update

RUN apt install -y ros-${ROS_DISTRO}-fognav-msgs=0.1.0-33~git20221007.a0451ca

ENV PATH=${PATH}:/scripts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

