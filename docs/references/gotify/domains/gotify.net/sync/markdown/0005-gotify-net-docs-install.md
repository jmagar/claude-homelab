Installation | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# Installation [​](#installation)
## Docker [​](#docker)
Setting up gotify/server with docker is pretty easy, you basically just have to start the docker container and you are ready to go:
Before starting gotify/server you may read the [Configuration](./config) if you f.ex. use a different database.
bash
```
`$ docker run -p 80:80 -v /var/gotify/data:/app/data gotify/server
# or via GitHub registry
$ docker run -p 80:80 -v /var/gotify/data:/app/data ghcr.io/gotify/server`
```
[gotify/server](https://hub.docker.com/r/gotify/server) and [ghcr.io/gotify/server](https://github.com/gotify/server/pkgs/container/server) are multi-arch docker images, they will work for the architectures: amd64, i386, arm64, armv7, and riscv64.
`/app/data` contains the database file (if sqlite is used), images for applications and cert-files (if lets encrypt is enabled). In this example the directory is mounted to `/var/gotify/data` this directory should be included in a backup.
The time zone inside the container is configurable via the `TZ` environment variable:
bash
```
`$ docker run -p 80:80 -e TZ="Europe/Berlin" -v /var/gotify/data:/app/data gotify/server`
```
Example docker-compose.yaml
yml
```
`---
services:
gotify:
image: gotify/server
ports:
- 8080:80
environment:
GOTIFY\_DEFAULTUSER\_PASS: 'admin'
volumes:
- './gotify\_data:/app/data'
# to run gotify as a dedicated user:
# sudo chown -R 1234:1234 ./gotify\_data
# user: "1234:1234"`
```
## Binary [​](#binary)
Latest version: [](https://github.com/gotify/server/releases/latest)
### Supported Platforms: [​](#supported-platforms)
* linux-amd64 (64bit)
* linux-386 (32bit)
* linux-arm-7 (32bit used for Raspberry Pi)
* linux-arm64 (ARMv8)
* windows-386.exe (32bit)
* windows-amd64.exe (64bit)
Download the zip with the binary for your platform from [gotify/server Releases](https://github.com/gotify/server/releases).
This tutorial uses placeholders for the version and the platform. You have to replace `{VERSION}` with the most recent version and `{PLATFORM}` with one of the supported platforms.
bash
```
`$ wget https://github.com/gotify/server/releases/download/v{VERSION}/gotify-{PLATFORM}.zip`
```
Unzip the archive.
bash
```
`$ unzip gotify-{PLATFORM}.zip`
```
Make the binary executable.
bash
```
`$ chmod +x gotify-{PLATFORM}`
```
Execute gotify/server. (By default gotify/server is started on port 80 so it requires sudo)
Before starting gotify/server you may read the [Configuration](./config) if you f.ex. want to change the port or use a different database.
bash
```
`$ sudo ./gotify-{PLATFORM}`
```
## Source [​](#source)
See [build](./build).