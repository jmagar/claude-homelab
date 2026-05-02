Verify Artifacts
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
> [!NOTE]These steps apply to every Arcane release after
`> v1.17.4
`> , including all
`> next
`> images.
If you want to double-check that the Arcane binary or image you downloaded is really the one we published, you can verify it with Cosign.
This includes binaries published to S3, binaries attached to GitHub Releases, and container images.
If you do not have Cosign installed yet, follow the [official Cosign installation guide](https://docs.sigstore.dev/cosign/system_config/installation/).
The Arcane public key lives at [getarcane.app/cosign.pub](https://getarcane.app/cosign.pub) or in the root of the arcane github repo.
## Verify checksums
For most people, the easiest flow is to verify the published checksum file first. Once that checks out, `sha256sum` can confirm the individual files you downloaded.
Copy
Copy
## Verify a release binary
If you would rather verify a single binary directly, use the matching Sigstore bundle for that file:
Copy
## Verify container images
Container images work the same way. Use the image digest you pulled, or the one published with the release:
Copy
> [!TIP]Need the image digest first? Here are a few easy ways to find it.
>
> For local images:
>
>
>
>
>
> Copy
>
>
>
>
>
>
> Copy
>
>
>
>
>
>
> Copy
>
>
> For remote images without pulling:
>
>
>
>
>
> Copy
>
>
> If you prefer the GitHub UI, open the Arcane repository on GitHub, go to
**> Packages
**> , open the
`> arcane
`> container package, and copy the digest for the tag you want.
>
> Once you have the digest, replace
`> sha256:...
`> in the Cosign command with the real value.
That works for both stable releases and `next` images.