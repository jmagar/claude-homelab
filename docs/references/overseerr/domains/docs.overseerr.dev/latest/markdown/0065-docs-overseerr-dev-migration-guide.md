Migration guide | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
important
Read our [release announcement](/blog/seerr-release) to learn what Seerr means for Jellyseerr and Overseerr users.
Whether you come from Overseerr or Jellyseerr, you don't need to perform any manual migration steps, your instance will automatically be migrated to Seerr.
This migration will run automatically the first time you start your instance using the Seerr codebase (Docker image or source build or Kubernetes, etc.).
An additional migration will happen for Overseerr users, to migrate their configuration to the new codebase.
danger
Before doing anything you should backup your existing instance so that you can rollback in case something goes wrong.
See [Backups](/using-seerr/backups) for details on how to properly backup your instance.
warning
Installation methods are now divided into two categories: official and third-party methods.
The Seerr team is only responsible for official installation methods, while third-party methods are maintained by the community.
Some methods are currently not maintained, but this does not mean they are permanently discontinued. The community may restore and support them if they choose to do so.
* **Snap package:** Not maintained
## Docker[​](#docker)
Refer to [Seerr Docker Documentation](/getting-started/docker), all of our examples have been updated to reflect the below change.
info
Seerr provides a secure, fully featured image with everything you need included.
We sincerely appreciate the past contributions from third-party maintainers, which helped enhance this image and its capabilities.
To maintain consistency and security, we encourage everyone to use the features available in the official Seerr image.
If you feel something is missing, please submit a feature request—your feedback is always welcome!
Our Docker images are available with the following tags:
* `latest`: Always points to the most recent stable release.
* Version tags (e.g., `v3.0.0`): For specific stable versions.
* Major version aliases (e.g., `v3`): Alias for the latest stable release in the respective major version series.
* Minor version aliases (e.g., `v3.0`): Alias for the latest stable release in the respective minor version series.
* `develop`: Rolling release/nightly builds for using the latest changes (use with caution).
Changes :
* Renamed all references from `overseerr` or `jellyseerr` to `seerr`.
* The container image reference has been updated.
* The container can now be run as a non-root user (`node` user); remove the `user` directive if you have configured it.
* The container no longer provides an init process, so you must configure it by adding `init: true` for Docker Compose or `--init` for the Docker CLI.
#### Config folder permissions[​](#config-folder-permissions)
info
Since the container now runs as the `node` user (UID 1000), you must ensure your config folder has the correct permissions. The `node` user must have read and write access to the `/app/config` directory.
If you're migrating from a previous installation, you may need to update the ownership of your config folder:
```
`docker run --rm -v /path/to/appdata/config:/data alpine chown -R 1000:1000 /data
`
```
This ensures the `node` user (UID 1000) owns the config directory and can read and write to it.
### Unix[​](#unix)
Summary of changes :
* Docker compose
* Docker CLI
```
`---
services:
seerr:
image: ghcr.io/seerr-team/seerr:latest
init: true
container\_name: seerr
environment:
- LOG\_LEVEL=debug
- TZ=Asia/Tashkent
- PORT=5055 #optional
ports:
- 5055:5055
volumes:
- /path/to/appdata/config:/app/config
healthcheck:
test: wget --no-verbose --tries=1 --spider http://localhost:5055/api/v1/settings/public || exit 1
start\_period: 20s
timeout: 3s
interval: 15s
retries: 3
restart: unless-stopped
`
```
### Windows[​](#windows)
Summary of changes :
* Docker compose
* Docker CLI (PowerShell)
* Docker CLI (CMD)
```
`---
services:
seerr:
image: ghcr.io/seerr-team/seerr:latest
init: true
container\_name: seerr
environment:
- LOG\_LEVEL=debug
- TZ=Asia/Tashkent
ports:
- 5055:5055
volumes:
- seerr-data:/app/config
healthcheck:
test: wget --no-verbose --tries=1 --spider http://localhost:5055/api/v1/settings/public || exit 1
start\_period: 20s
timeout: 3s
interval: 15s
retries: 3
restart: unless-stopped
volumes:
seerr-data:
external: true
`
```
## Build From Source[​](#build-from-source)
Refer to [Seerr Build From Source Documentation](/getting-started/buildfromsource), all of our examples have been updated to reflect the below change.
Install from scratch by following the documentation, restore your data as described in [Backups](/using-seerr/backups), and then start Seerr. No additional steps are required.
## Kubernetes[​](#kubernetes)
Refer to [Seerr Kubernetes Documentation](/getting-started/kubernetes), all of our examples have been updated to reflect the below change.
Changes :
* All references to `jellyseerr` have been renamed to `seerr` in the manifests.
* The container image reference has been updated.
* The default `securityContext` and `podSecurityContext` have been updated to support running the container without root permissions.
Summary of changes :
* Old values
* New values
```
`image:
repository: fallenbagel/jellyseerr
podSecurityContext: {}
securityContext: {}
`
```
## Nix[​](#nix)
Refer to [Seerr Documentation](/getting-started/nixpkg), all of our examples have been updated to reflect the below change.
The seerr service and package are available in the unstable channel and will be officially included in the 26.05 release.
## Third-party installation methods[​](#third-party-installation-methods)
warning
Third-party installation methods are maintained by the community. The Seerr team is not responsible for these packages.
### AUR[​](#aur)
See [https://aur.archlinux.org/packages/seerr](https://aur.archlinux.org/packages/seerr)
### TrueNAS[​](#truenas)
Refer to [Seerr TrueNAS Documentation](/getting-started/third-parties/truenas), all of our examples have been updated to reflect the below change.
* Host Path
* ixVolume
**This guide describes how to migrate from Host Path storage (not ixVolume).**
1. Stop Jellyseerr/Overseerr
2. Install Seerr and use the same Host Path storage that was used by Jellyseerr/Overseerr
3. Start Seerr app
4. Delete Jellyseerr/Overseerr app
### Unraid[​](#unraid)
Refer to [Seerr Unraid Documentation](/getting-started/third-parties/unraid), all of our examples have been updated to reflect the below change.
Seerr will automatically migrate your existing Overseerr or Jellyseerr data on first startup. No manual database migration is needed.
**1. Stop the existing container**
In the Unraid **Docker** tab, stop your Overseerr (or Jellyseerr) container.
**⚠️ Do not remove the container or delete the appdata folder yet ⚠️**
**2. Copy existing data to Seerr appdata**
Open the Unraid terminal and copy your existing appdata folder into the new Seerr appdata directory:
```
`cp -a /mnt/user/appdata/overseerr /mnt/user/appdata/seerr
`
```
*(For Jellyseerr users, replace `overseerr` with `jellyseerr` in the paths).*
**3. Set permissions and install Seerr**
Follow the [Unraid Installation Guide](/getting-started/third-parties/unraid#2-set-folder-permissions), **starting from step 2** — this covers setting the correct folder permissions and adding the Docker container. The guide offers two permission methods (**Seerr Default** and **Unraid Default**), each with trade-offs — read the descriptions before choosing.
**4. Start the new Seerr app**
Start the newly created Seerr container. Check the container logs to confirm the automatic migration completed successfully.
**5. Remove the old app**
Once you have confirmed Seerr is working properly and your data has successfully migrated, you can safely **Remove** the old Overseerr (or Jellyseerr) container from Unraid.
* [Docker](#docker)
* [Unix](#unix)
* [Windows](#windows)
* [Build From Source](#build-from-source)
* [Kubernetes](#kubernetes)
* [Nix](#nix)
* [Third-party installation methods](#third-party-installation-methods)
* [AUR](#aur)
* [TrueNAS](#truenas)
* [Unraid](#unraid)