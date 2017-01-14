#
# docker build -t appsoa/centos-base-java:testing .
#
FROM centos:7

# RUN mkdir -p $NO_VNC_HOME/utils/websockify \
    # && wget -qO- https://github.com/kanaka/noVNC/archive/v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
    # && wget -qO- https://github.com/kanaka/websockify/archive/v0.8.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
    # && chmod +x -v /root/noVNC/utils/*.sh

COPY src/home /home
COPY src/bin /bin

RUN useradd user && \
    chown -R user:user /home/user/noVNC && \
    yum -y install net-tools which

WORKDIR /home/user/noVNC
# RUN /bin/entrypoint.sh
EXPOSE 6901
ENTRYPOINT ["/bin/entrypoint.sh"]