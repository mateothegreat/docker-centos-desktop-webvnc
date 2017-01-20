#
# docker build -t appsoa/centos-base-java:testing .
#
FROM centos:7
ENV INSTALL4J_JAVA_HOME=/usr/java/jdk1.8.0_60 \
    TZ=America/Phoenix

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

COPY src/home /home
COPY src/bin /bin

RUN useradd user && \
    chown -R user:user /home/user/noVNC && \
    yum -y install net-tools which

WORKDIR /home/user/noVNC
EXPOSE 6901
ENTRYPOINT ["/bin/entrypoint.sh"]