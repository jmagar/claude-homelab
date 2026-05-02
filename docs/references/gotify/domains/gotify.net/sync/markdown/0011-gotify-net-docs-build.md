Build Gotify | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# Build Gotify [​](#build-gotify)
1. [Setup development environment](./dev-setup)
2. Build the UI
bash
```
`$ (cd ui && yarn build)`
```
3. Build the Go Binary
It is recommended to build gotify/server via the [gotify/build docker images](https://github.com/gotify/build), this ensures that [plugins](./plugin) will be compatible with the built binary (because the same build environment is used).
Set the LD\_FLAGS with meta information like the version or the commit:
bash
```
`$ export LD\_FLAGS="-w -s -X main.Version=$(git describe --tags | cut -c 2-) -X main.BuildDate=$(date "+%F-%T") -X main.Commit=$(git rev-parse --verify HEAD) -X main.Mode=prod";`
```
Execute [gotify/server Makefile](https://github.com/gotify/server/blob/master/Makefile) tasks to build gotify/server.
bash
```
`# builds all supported platforms
$ make build
# builds a specific platform
$ make build-linux-amd64
$ make build-linux-arm-7
$ make build-linux-arm64
$ make build-linux-386
$ make build-windows-amd64
$ make build-windows-386`
```
If you do not want to use the docker images you can build gotify/server like this:
bash
```
`$ go build -ldflags="$LD\_FLAGS" -o gotify-server`
```
*The project has a CGO reference (because of sqlite3), therefore a CGO cross compiler is needed for compiling for other platforms (the gotify/build docker images already contain the needed cross compilers).*
bash
```
`$ CGO\_ENABLED=1 CC=${CROSS\_GCC} CXX=${CROSS\_G++} GOOS=${TARGET\_GOOS} GOARCH=${TARGET\_GOARCH} \\
go build -ldflags="$LD\_FLAGS" -o gotify-server`
```