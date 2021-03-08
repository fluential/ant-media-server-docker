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
docker run --volumes-from antmediadata --network=host --privileged=true -it --rm antmediaserver
```
