# ant-media-server-docker

> Ant Media Server is a highly Scalable Real-Time Video Streaming Platform - WebRTC Server. Ultra-Low Latency & Adaptive WebRTC Streaming Software.

This aims to build Ant Media Server Docker Image.

This improves the [original image](https://github.com/ant-media/Ant-Media-Server/wiki/Building-and-Running-Docker-Container-for-Ant-Media-Server)
  - Persistent Data Volume
  - Auto pull latest antmedia artifact for easy rebuilds (removed artifact param)
  - No longer running container in privileged mode
  - No longer running inside as root (using antmedia:antmedia)
  - Java 11.x
  - SSL Certs with Traefik


![size](https://badgen.net/docker/size/fluential/antmediaserver) ![starts](https://badgen.net/docker/stars/fluential/antmediaserver?icon=docker&label=stars) ![pulls](https://badgen.net/docker/pulls/fluential/antmediaserver)

## Build

```
docker build -t antmediaserver  .
```

## Run

Container with built-in data volume

```
docker-compose up
```

```
docker create --name antmediadata
docker run --volumes-from antmediadata --network=host -it --rm fluential/antmediaserver

# root@antmedia:~/antmedia# docker-compose up -d
Starting antmediaserver ... done

# root@antmedia:~/antmedia# docker volume ls
DRIVER    VOLUME NAME
local     antmedia_datastore
```

### SSL with Traefik

See `docker-compose.traefik.yml`

## Use

#### Ant Media Server Default Ports
  - TCP:1935 (RTMP)
  - TCP:5080 (HTTP)
  - TCP:5443 (HTTPS)
  - TCP:5554 (RTSP)
  - UDP:5000-65000 (WebRTC and RTSP)


#### See also
* https://antmedia.io
* https://ant-media-docs.readthedocs.io
* https://github.com/ant-media/Ant-Media-Server/wiki


