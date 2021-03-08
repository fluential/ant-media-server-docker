# ant-media-server-docker

> Ant Media Server is a highly Scalable Real-Time Video Streaming Platform - WebRTC Server. Ultra-Low Latency & Adaptive WebRTC Streaming Software.

* https://antmedia.io
* https://ant-media-docs.readthedocs.io
* https://github.com/ant-media/Ant-Media-Server/wiki

This aims to build Ant Media Server Docker Image.

## Build

```
docker build -t antmediaserver  .
```

## Run

Container with built-in data volume

```
docker create --name antmediadata
docker run --volumes-from antmediadata --network=host -it --rm antmediaserver

# root@antmedia:~/antmedia# docker-compose up -d
Starting antmediaserver ... done

# root@antmedia:~/antmedia# docker volume ls
DRIVER    VOLUME NAME
local     antmedia_datastore
```

## Use

#### Ant Media Server Default Ports
  - TCP:1935 (RTMP)
  - TCP:5080 (HTTP)
  - TCP:5443 (HTTPS)
  - TCP:5554 (RTSP)
  - UDP:5000-65000 (WebRTC and RTSP)
