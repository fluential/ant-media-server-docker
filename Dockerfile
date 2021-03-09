# This docker file can be used in kubernetes. 
# It accepts all cluster related parameters at run time. 
# It means it's very easy to add new containers to the cluster 

#  Ant Media Server Default Ports
#
#    TCP:1935 (RTMP)
#    TCP:5080 (HTTP)
#    TCP:5443 (HTTPS)
#    TCP:5554 (RTSP)
#    UDP:5000-65000 (WebRTC and RTSP)

FROM ubuntu:18.04

# Keep this value ARGs for compatibility
ARG MongoDBServer=
ARG MongoDBUsername=
ARG MongoDBPassword=

RUN apt-get update && apt-get install -y curl libcap2 jq net-tools openjdk-8-jdk

RUN /bin/bash -c 'cd home \
    && curl -sfLO https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh \
    && chmod 755 install_ant-media-server.sh \
    && curl -sfLO $(curl -sfL https://api.github.com/repos/ant-media/Ant-Media-Server/releases/latest| jq -r '.assets[].browser_download_url'|head -n1) \
    && set -x && ./install_ant-media-server.sh *.zip -s false > /dev/null'

# Keep this for compatibility
RUN /bin/bash -c 'if [ ! -z "${MongoDBServer}" ]; then \
                    /usr/local/antmedia/change_server_mode.sh cluster ${MongoDBServer} ${MongoDBUsername} ${MongoDBPassword}; \
                 fi'

RUN apt-get clean autoclean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/ /home/

VOLUME /usr/local/antmedia

ENTRYPOINT service antmedia restart && bash

# Options
# -g: Use global(Public) IP in network communication. Its value can be true or false. Default value is false.
#
# -s: Use Public IP as server name. Its value can be true or false. Default value is false.
#
# -r: Replace candidate address with server name. Its value can be true or false. Default value is false
#
# -m: Server mode. It can be standalone or cluster. Its default value is standalone. If cluster mode is
#     specified then mongodb host, username and password should also be provided
#
# -h: MongoDB host
#
# -u: MongoDB username
#
# -p: MongoDB password
ENTRYPOINT ["/sbin/start-stop-daemon", "--start", "--chuid" ,"antmedia:antmedia", "--exec", "/usr/local/antmedia/start.sh"]
