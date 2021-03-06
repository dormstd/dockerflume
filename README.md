[![Docker Build Status](https://img.shields.io/docker/build/rruizs/dockerflume.svg)](https://hub.docker.com/r/rruizs/dockerflume/builds/)
# rruizs/dockerflume

  Self-contained Docker image containing Java and [Apache Flume 1.8](https://flume.apache.org/) based on [probablyfine/flume](https://hub.docker.com/r/probablyfine/flume/)

## Usage

```Bash
$ docker pull rruizs/dockerflume
```
```BASH
$ docker run \
  --env FLUME_AGENT_NAME=agent\
  --volume /tmp/config.conf:/opt/flume-config/flume.conf \
  --detach \
  rruizs/dockerflume:latest
```

Note: the `FLUME_AGENT_NAME` environment variable and presence of `/opt/flume-config/flume.conf` on the image are **required**.

## Building your own

Set up configuration directory and required environment variables in a Dockerfile

    FROM rruizs/dockerflume
    ENV FLUME_AGENT_NAME <your_agent_name>
    ADD flume.conf /opt/flume-config/flume.conf

Build and run image

    $ docker build -t my-flume-image .
    $ docker run -d my-flume-image