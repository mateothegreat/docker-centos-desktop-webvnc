#!/bin/bash

docker rm -f novnc

docker run -it  -e CONF_VNC_HTTP_PORT=6901 \
                -e CONF_VNC_REMOTE=146.148.76.226:5901 \
                -p 6901:6901 \
                --name novnc \
                appsoa/docker-centos-desktop-webvnc