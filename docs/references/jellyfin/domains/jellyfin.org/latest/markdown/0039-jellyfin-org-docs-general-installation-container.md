Container | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
## Container images[​](#container-images)
Official container image: `jellyfin/jellyfin` [](https://hub.docker.com/r/jellyfin/jellyfin).
This image is also published on the GitHub Container Registry: `ghcr.io/jellyfin/jellyfin`.
LinuxServer.io image: `linuxserver/jellyfin` [](https://hub.docker.com/r/linuxserver/jellyfin).
hotio image: `ghcr.io/hotio/jellyfin`.
Jellyfin distributes official container images on [Docker Hub](https://hub.docker.com/r/jellyfin/jellyfin/) and the [GitHub Container Registry](https://ghcr.io/jellyfin/jellyfin) for multiple architectures.
These images are based on Debian and [built directly from the Jellyfin source code](https://github.com/jellyfin/jellyfin-packaging/blob/master/docker/Dockerfile).
Several tags are available tracking different builds and [version](/docs/general/contributing/release-procedure/#versioning) levels.
* `latest` always tracks the latest stable release, including through major and minor version bumps
* `X` (e.g. `10`) tracks the major version, e.g. the latest 10.Y.Z
* `X.Y` (e.g. `10.11`) tracks the minor version, e.g. the latest 10.11.Z
* `X.Y.Z` (e.g. `10.11.0`) tracks a specific release
* `X.Y.Z.YYYYMMDD-HHMMSS` (e.g. `10.11.0.20251020-004604`) tracks a specific packaging build
Additionally, there are several third parties providing unofficial container images, including the [LinuxServer.io](https://www.linuxserver.io/) ([Dockerfile](https://github.com/linuxserver/docker-jellyfin/blob/master/Dockerfile)) project and [hotio](https://github.com/hotio) ([Dockerfile](https://github.com/hotio/jellyfin/blob/release/linux-amd64.Dockerfile)), which offer images based on Ubuntu and the official Jellyfin Ubuntu binary packages.
## Installation Instructions[​](#installation-instructions)
Replace `uid:gid` if you want to run jellyfin as a specific user/group. Exclude the `user` argument entirely if you want to use the default user.
* Docker
* Docker Compose
* Podman
warning
If you wish to use Windows or macOS, please install Jellyfin natively instead. [Windows](/docs/general/installation/windows) [macOS](/docs/general/installation/macos).
While it is possible to run Jellyfin in Docker on a Windows or macOS host, it is NOT supported. Some features are known to be broken when running in Docker on platforms other than Linux, Notably:
* Hardware Accelerated Transcoding
* [Scanning on macOS in Docker](https://github.com/jellyfin/jellyfin/issues/13093)
You WILL NOT receive any support for running Jellyfin in Docker on platforms other than Linux.
Create a `docker-compose.yml` file like the following.
```
`
services:
jellyfin:
image: jellyfin/jellyfin
container\_name: jellyfin
# Optional - specify the uid and gid you would like Jellyfin to use instead of root
user: uid:gid
ports:
- 8096:8096/tcp
- 7359:7359/udp
volumes:
- /path/to/config:/config
- /path/to/cache:/cache
- type: bind
source: /path/to/media
target: /media
- type: bind
source: /path/to/media2
target: /media2
read\_only: true
# Optional - extra fonts to be used during transcoding with subtitle burn-in
- type: bind
source: /path/to/fonts
target: /usr/local/share/fonts/custom
read\_only: true
restart: 'unless-stopped'
# Optional - alternative address used for autodiscovery
environment:
- JELLYFIN\_PublishedServerUrl=http://example.com
# Optional - may be necessary for docker healthcheck to pass if running in host network mode
extra\_hosts:
- 'host.docker.internal:host-gateway'
`
```
Then while in the same folder as the `docker-compose.yml` run:
```
`
docker compose up
`
```
To run the container in background add `-d` to the above command.
You can learn more about using Docker by [reading the official Docker documentation](https://docs.docker.com/).
* [Container images](#container-images)
* [Installation Instructions](#installation-instructions)