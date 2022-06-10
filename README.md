# rviz2_docker

Docker container that runs VNC server inside. It's purpose is to provide debugging tools that require GUI inside hardended OS. It includes rviz2 and rqt tools. 

## Docker launch 

It is necessary to launch the docker with `--network=host` to enable networking inside the container. The container should start the vnc server by default. 

```
  docker run --network=host -it ghcr.io/tiiuae/tii-rviz2
```
It is then possible to connect to it using some remote desktop client (VNC client).

## VNC client

Docker container was tested using desktop client Remmina. To connect, start Remmina and choose VNC: `<drones-tailscale-ip>:<port>`

## Port

VNC server currently runs on the port 3000, which is port dedicated for grafana tool. Therefore it is first necessary to `docker rm -f grafana`. Port dedicated for vnc server might be presented in future updates.

## Rviz2

Docker container contains simple bash script that starts rviz2 with predefined configuration. This script accepts drones name as argument, renames the template rviz config and starts automatically the rviz2 this config

```
  rviz <drone_name>
```




