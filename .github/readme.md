This is a drone open source edition, from offical repo, the newest version is 1.9.0

Pushed to docker, you can get this open source docker image from [https://hub.docker.com/r/taoxyz/drone-oss/tags](https://hub.docker.com/r/taoxyz/drone-oss/tags)

## Usage
Because open source edition has no documention, here is my own experience, with docker-compose
create docker-compose.yml like below

```yaml
version: "3"
services:
  server:
    image: taoxyz/drone-oss:1.9.0-linux-amd64
    ports:
      - "82:80"
    volumes:
      - ./data:/data
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - DRONE_AGENTS_DISABLED=true
      - DRONE_GIT_ALWAYS_AUTH=false
      - DRONE_GITLAB_SERVER=https://gitlab.com
      - DRONE_GITLAB_CLIENT_ID=yourclientid
      - DRONE_GITLAB_CLIENT_SECRET=yoursecret
      - DRONE_SERVER_HOST=123.123.123.123:82
      - DRONE_SERVER_PROTO=http
      - DRONE_TLS_AUTOCERT=false
      - DRONE_USER_FILTER=mygroup
      - DRONE_USER_CREATE=username:king,admin:true
      - DRONE_RUNNER_CAPACITY=4
    restart: always
```

### Notice
* `DRONE_AGENTS_DISABLED=true` is important for open source edition, use this env to enable single machine mode, which is open source edition can only support.
* Volumes `/var/run/docker.sock:/var/run/docker.sock` is setted at agent/runner with enterprise edition, but there's no agent/runner in open source edition, so you need set. Same with `DRONE_RUNNER_CAPACITY=4`, but optional.
* `DRONE_SERVER_HOST` must containe port, otherwise you will recieve callback error in you gitlab page
* Other env, you can see offical document [docs.drone.io/installation](http://docs.drone.io/installation/), but remember, there's no agent/runner in open source edition.
* Last warning, build your own open source edition just follow BUILDING_OSS is not possible, don't try.
