Buildables
Get Started
* [Installation](../../docs/setup/installation)
* [Podman](../../docs/setup/podman)
* [LXC Container Setup](../../docs/guides/lxc-container)
* [Migrate to 1.0](../../docs/setup/migrate-v1)
* [Next Builds](../../docs/setup/next-images)
Security
* [Verify Artifacts](../../docs/security/verify-artifacts)
* [Socket Proxy Setup](../../docs/setup/socket-proxy)
Configuration
* [Environment Variables](../../docs/configuration/environment)
* [Appearance](../../docs/configuration/appearance)
* [Notifications](../../docs/configuration/notifications)
* [OIDC Single Sign-On](../../docs/configuration/sso)
* [Analytics](../../docs/configuration/analytics)
Networking
* [HTTP Proxy](../../docs/configuration/proxy)
* [Websocket Configuration](../../docs/configuration/websockets-reverse-proxies)
* [TLS and HTTP/2](../../docs/configuration/tls)
Features
* [Projects](../../docs/features/projects)
* [Containers](../../docs/features/containers)
* [Images](../../docs/features/images)
* [Image Builds](../../docs/features/image-builds)
* [Volumes](../../docs/features/volumes)
* [Networks](../../docs/features/networks)
* [Vulnerability Scans](../../docs/features/vulnerability-scans)
* [Remote Environments](../../docs/features/environments)
* [Auto Updates](../../docs/guides/updates)
* [Custom Metadata](../../docs/guides/custom-metadata)
* [Using Templates](../../docs/templates)
* [Template Registries](../../docs/templates/registries)
* [Docker Swarm](../../docs/features/swarm)
Guides
* [Buildables](../../docs/guides/buildables)
* [GPU Monitoring Setup](../../docs/guides/gpu-setup)
CLI
* [Installation](../../docs/cli/install)
* [Configuration](../../docs/cli/config)
Development
* [Contributing to Arcane](../../docs/dev/contribute)
* [Translating Arcane](../../docs/dev/translate)
Community
* [Discord ](https://discord.gg/WyXYpdyV3Z)
Buildables are optional features that you add to Arcane when you build it. Most users do not need them.
These are usually niche features or ones that could add extra risk in standard builds, which is why they are opt-in.
## Overview
* Buildables are included with the `buildables` tag.
* Specific features are turned on with `buildables.EnabledFeatures`.
* Arcane checks for them with `buildables.HasBuildFeature("\<feature\>")`.
* When buildables are off, their settings and logic are removed from the build. ## Quick start
If you are building from source, enable the build tag and set the feature list when you build. If you are using Docker, build a custom image with the same settings.
## Build from source
Build with the `buildables` tag and set enabled features via `-ldflags`:
* Build tag: `buildables`
* Enabled features: `github.com/getarcaneapp/arcane/backend/buildables.EnabledFeatures`
Example flags:
Copy
Copy
## Build with Docker
If you want buildables in a container image, build your own image and pass the build tag plus the feature list. Here is a minimal example that uses the official image as the runtime base:
`# docker/Dockerfile.buildables
FROM --platform=$BUILDPLATFORM golang:1.25-trixie AS builder
ARG TARGETARCH
ARG BUILD\_TAGS="buildables"
ARG ENABLED\_FEATURES="autologin"
ARG VERSION="dev"
ARG REVISION="unknown"
WORKDIR /build
COPY go.work ./
COPY types ./types
COPY cli ./cli
COPY backend/go.mod backend/go.sum ./backend/
WORKDIR /build/backend
RUN --mount=type=cache,target=/go/pkg/mod go mod download
COPY backend ./
RUN --mount=type=cache,target=/root/.cache/go-build BUILD\_TIME=$(date -u '+%Y-%m-%dT%H:%M:%SZ') && CGO\_ENABLED=0 GOOS=linux GOARCH=$TARGETARCH go build -tags "$&#123;BUILD\_TAGS&#125;" -ldflags "-w -s -X github.com/getarcaneapp/arcane/backend/internal/config.Version=$&#123;VERSION&#125; -X github.com/getarcaneapp/arcane/backend/internal/config.Revision=$&#123;REVISION&#125; -X github.com/getarcaneapp/arcane/backend/internal/config.BuildTime=$&#123;BUILD\_TIME&#125; -X github.com/getarcaneapp/arcane/backend/buildables.EnabledFeatures=$&#123;ENABLED\_FEATURES&#125;" -trimpath -o /out/arcane ./cmd/main.go
FROM ghcr.io/getarcaneapp/arcane:latest
# For headless builds, use: ghcr.io/getarcaneapp/arcane-headless:latest
COPY --from=builder /out/arcane /app/arcane
`
Build it explicitly:
`docker build -f docker/Dockerfile.buildables --build-arg BUILD\_TAGS=buildables --build-arg ENABLED\_FEATURES=autologin -t arcane:buildables .
`
> [!NOTE]Official images do not include buildables. If you need them, use a custom image like the one above.
## Selecting features
`EnabledFeatures` is a comma-separated list. Feature names are case-insensitive and trimmed.
Example:
* `autologin`
* `feature-a,feature-b,feature-c` ## Runtime checks
Use `buildables.HasBuildFeature("feature")` to check whether a feature is available before running code for it.
## Configuration
Buildable-specific settings live in `BuildablesConfig` and only exist when buildables are enabled. For example, the `autologin` feature uses:
* `AUTO\_LOGIN\_USERNAME`
* `AUTO\_LOGIN\_PASSWORD` ## Available buildables
> [!NOTE]
**> Official
**> buildables are maintained by the Arcane team.
**> Community
**> buildables are built and supported by the community.
Current buildables
1 available
|Feature|Description|Source|Docs|Config|
|`autologin`|Automatically sign in using build-time enabled credentials.|Official|[Full docs](/docs/guides/buildables/autologin)|
`AUTO\_LOGIN\_USERNAME``AUTO\_LOGIN\_PASSWORD`
|
## Adding a new buildable feature
1. Guard feature entry points using `//go:build buildables` where appropriate.
2. Check `buildables.HasBuildFeature("your-feature")` before using the feature.
3. Add any buildable-only config to `BuildablesConfig`.
4. Make sure any tests for the feature are built with the `buildables` tag.