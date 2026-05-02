Version 7.3.0-rc.1 2026-04-22 | Unraid Docs
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
This release candidate includes onboarding and internal boot, TPM-based licensing, Docker and storage improvements, WebGUI improvements, virtualization updates, hardware support, and platform package updates.
This is RELEASE CANDIDATE software. Please use on test servers only.
Curious about what our different release types are? See [Unraid OS release types](/unraid-os/updating-unraid/release-types/).
## Upgrading[​](#upgrading)
For step-by-step instructions, see [Updating Unraid](/unraid-os/updating-unraid/). Questions about your [license](/unraid-os/troubleshooting/licensing-faq/)?
### Known issues[​](#known-issues)
See [Unraid OS Pre-release (Bugs & Feedback)](https://product.unraid.net/b/unraid-os-prerelease-bugs-feedback) for issues reported by other testers.
* During internal boot setup, the WebGUI may show **Array Offline** while internal boot configures. **DO NOT** manually restart or remove your flash drive during this process.
* Internal boot requires boot storage that can be accessed by in-tree Linux drivers during startup. Devices that require third-party drivers or post-boot configuration cannot be used for internal boot.
### Notes[​](#notes)
* Adding, removing, and replacing devices in the ZFS boot pool generally works correctly. One exception: if you start with a dedicated boot pool made from two small devices and replace them one at a time with larger devices, the pool may convert to a split pool.
* When boot-pool devices are added, removed, or replaced, Unraid does not currently update the server BIOS boot priority automatically. After making those changes, verify the BIOS boot order manually.
### Rolling back[​](#rolling-back)
* If you already enabled internal boot or switched to TPM-based licensing while testing the 7.3 pre-release, you can roll back to `7.3.0-beta.1` without issue.
* Do not roll back to `7.2.4` or earlier after enabling internal boot or TPM-based licensing.
* If you upgrade ZFS pool features, earlier Unraid releases may not be able to import those pools.
* If you need to roll back, follow the normal pre-release rollback process before moving between builds.
If you are considering any rollback path below `7.3.0-beta.1`, also see the [7.2.4 release notes](/unraid-os/release-notes/7.2.4/).
## Changes vs. [7.2.4](/unraid-os/release-notes/7.2.4/)[​](#changes-vs-724)
### Security[​](#security)
* Update `bind` to fix outstanding CVEs.
* Update Docker to include runc fixes for CVE-2025-31133, CVE-2025-52565, and CVE-2025-52881.
### Onboarding and internal boot[​](#onboarding-and-internal-boot)
New users automatically start in the onboarding wizard, where they choose language, time zone, theme, activation code settings, and boot option, including internal boot.
Existing users can go to ***Settings → Onboarding Wizard*** to review settings and migrate to internal boot.
For details, see [Onboarding](/unraid-os/getting-started/set-up-unraid/deploy-and-configure-unraid-os/).
* New: Add dedicated boot pool support as a distinct option from split boot pools.
* Improvement: Move the Onboarding Wizard under Tools and add a direct internal-boot device link when setup still needs attention.
* Improvement: Update many user-facing strings from "Flash" to "Boot".
* Improvement: Improve organization of boot-related settings.
* Fix: Force the expected reboot or shutdown flow after internal boot setup.
* Fix: Restore the Boot page browse icon on affected systems.
* Fix: Correct black-theme dropdown visibility in the Onboarding Wizard.
* Fix: Correct the GMT time zone selection state in the Onboarding Wizard.
* Fix: Correct the New Config tool so it handles boot pools properly.
* Fix: Allow pools that were previously configured as boot pools to be removed correctly.
* Fix: Keep the boot pool visible when an expected boot-pool disk is missing or a wrong disk is selected.
### Licensing[​](#licensing)
All new and replacement keys use TPM-based licensing when possible because it is more reliable than flash-based licensing.
To proactively switch to TPM-based licensing, see [How can I move from flash-based licensing to TPM-based licensing](/unraid-os/troubleshooting/tpm-licensing-faq/#tpm).
* Improvement: Improve handling of missing key file states.
### Containers / Docker[​](#containers--docker)
\*\*Important: Docker has been updated from v27 (in 7.2.4) to v29. This changes how MAC addresses are allocated to containers and randomizes them.
\*\*
* Improvement: Update Docker to `29.3.1`.
* New: Add an optional fixed MAC address field to Docker templates for containers that need a stable network identity across restarts, including DHCP reservations, router or firewall rules, switch ACLs, and monitoring.
* Improvement: Show Docker container MAC addresses in Advanced View alongside existing network and IP information.
* Fix: Migrate legacy `--mac-address=` values from Extra Parameters into the new fixed MAC field where safe, while leaving templates unchanged when networking is still owned by Extra Parameters.
* Fix: Prevent duplicate Docker user templates when container names and template filenames differ only by case on case-sensitive boot storage, such as ZFS internal boot.
* Fix: Hide stale dead or uninspectable "phantom" containers that became newly visible after the Docker 27 to 29 upgrade path. This filters confusing leftovers out of the WebGUI without mutating Docker state. Background: [Docker 29 release notes](https://docs.docker.com/engine/release-notes/29/).
* Fix: Add the missing support needed for Strix Point iGPU Docker workloads on affected systems. See the [user report](https://product.unraid.net/p/strix-point-igpu-support).
* Fix: Prevent VMs created from user-defined templates from inheriting the source VM MAC address.
### Storage[​](#storage)
* New: Show corrupted files in ZFS pool status.
* New: Add user-facing control for ZFS ARC max size on ***Settings → Disk Settings → Tunable (zfs\_arc\_max)***. This used to be controlled through a custom ZFS driver parameter. You may need to migrate your setting to the new location.
* Improvement: Improve visibility into pool and drive health information.
* Improvement: Improve duplicate drive detection and related messaging.
* Fix: Address sector-size compatibility regressions for 4Kn devices and some LSI HBA setups using 512e disks that affect XFS-formatted array disks.
* Fix: 4Kn devices formatted XFS with 7.3.0-beta.1 or newer can now be moved out of the array and mounted normally in pools or other Linux systems. Older XFS filesystems that were formatted inside the array on 4Kn disks in previous Unraid releases still cannot be corrected without reformatting.
* Fix: Prevent drives from spinning down during parity copy as part of parity swap.
* Fix: Correct mover availability when emptying an array disk with no pool assigned.
* Fix: Correct ZFS pools waking once every 24 hours in affected cases.
* Fix: Correct pool-device detection for larger device names, including devices such as `sdp` and `sdap`, so affected pool disks no longer appear as `Unknown`.
### WebGUI / System[​](#webgui--system)
* Improvement: Refresh WebGUI and system-device workflows for the 7.3 internal-boot and hardware-support work.
* Improvement: Add support for the Cooler Master Qube 500 case model.
* Fix: Handle CRLF line endings in Syslinux and GRUB configuration files so the Boot Parameters page can read settings edited from Windows.
* Fix: Correct File Manager styling on the Main tab so it follows the selected theme.
* Fix: Correct RAM display parsing after dmidecode unit label changes.
* Fix: Correct time zone label and identifier issues in affected regions.
* Fix: Restore the `Bind selected to vfio` action in System Devices on affected setups.
* Fix: Stop WebGUI and API requests from spinning up the full HDD array on affected systems.
* Fix: Restore CPU isolation saving so selected cores apply correctly again.
* Fix: Persist the built-in `rclone` configuration in a persistent location across reboot.
* Fix: Correct strict proxy connectivity checks when using HTTP proxies that block CONNECT on port 80.
* Fix: Correct rc.crond status typo.
* Fix: Auto-restart SSH daemon after network recovery.
* Fix: Correct Discord notification formatting issues.
* Fix: Correct interface parsing when `ip addr` output includes peer information.
* Fix: Correct custom image case model handling on the login page.
* Fix: Remove outdated ReiserFS warnings and stale references.
### File Manager[​](#file-manager)
* Improvement: Improve File Manager UI and overall performance.
* Improvement: Improve same-filesystem move operations.
* Improvement: Improve upload behavior.
* Fix: Correct path handling issues involving `/sub/` in file paths.
* Fix: Correct scrollbar interaction issues during copy or move operations.
* Fix: Correct handling of double quotes in directory names.
* Fix: Correct move and rename edge cases.
* Fix: Preserve empty directories during affected rename operations.
### Networking / Hardware[​](#networking--hardware)
* Improvement: Update kernel config for additional AMD XDNA and ACP support, including `CONFIG\_DRM\_ACCEL\_AMDXDNA`, `CONFIG\_DRM\_AMD\_ACP`, `CONFIG\_REMOTEPROC`, generic power-domain support, and `CONFIG\_REMOTEPROC\_CDEV`.
* Improvement: Add AMD NPU firmware, Intel Bluetooth firmware, Intel wireless firmware, and the `amdxdna` kernel module.
* New: Add ***Settings → Tailscale*** stub page for easier plugin discovery.
### Virtualization[​](#virtualization)
* Improvement: Improve System Devices visibility and VM template workflows.
* Improvement: Improve custom VNC port validation and defaults.
* Improvement: Update QEMU to `10.2.2`, libvirt to `12.2.0`, and refresh the OVMF firmware package.
* Fix: Address virtiofs hangs seen with affected Linux guests.
* Fix: Correct VM snapshot commit cleanup not updating snapshot metadata correctly.
* Fix: Correct libvirt startup issues encountered during testing.
### Unraid API[​](#unraid-api)
* `dynamix.unraid.net` 4.32.3 - [see changes](https://github.com/unraid/api/releases)
### Linux kernel[​](#linux-kernel)
* Linux kernel: version `6.18.23-Unraid`
### Base distro updates[​](#base-distro-updates)
* aaa\_libraries: version 15.1
* at-spi2-core: version 2.58.3
* bash: version 5.3.009
* bash-completion: version 2.17.0
* bind: version 9.20.20
* brotli: version 1.2.0
* btrfs-progs: version 6.19
* ca-certificates: version 20260212
* cifs-utils: version 7.5
* coreutils: version 9.10
* cryptsetup: version 2.8.4
* curl: version 8.18.0
* dmidecode: version 3.7
* dnsmasq: version 2.92
* docker: version 29.3.1
* dynamix.unraid.net: version 4.32.3
* efibootmgr: version 18
* efivar: version 20201015\_cff88dd
* elfutils: version 0.194
* elogind: version 255.22
* etc: version 15.1
* ethtool: version 6.19
* exfatprogs: version 1.3.1
* file: version 5.47
* freeglut: version 3.8.0
* freetype: version 2.14.2
* gawk: version 5.4.0
* gdk-pixbuf2: version 2.44.5
* gettext: version 1.0
* gettext-tools: version 1.0
* git: version 2.53.0
* glew: version 2.3.1
* glib2: version 2.86.4
* glibc-zoneinfo: version 2026a
* gnutls: version 3.8.12
* grub: version 2.14
* gtk+3: version 3.24.51
* harfbuzz: version 13.0.0
* icu4c: version 78.2
* iotop-c: version 1.30
* iperf3: version 3.20
* iproute2: version 6.19.0
* iptables: version 1.8.13
* jansson: version 2.15.0
* krb5: version 1.22.2
* less: version 692
* libarchive: version 3.8.5
* libcap-ng: version 0.9.1
* libdeflate: version 1.25
* libdisplay-info: version 0.3.0
* libdrm: version 2.4.131
* libevdev: version 1.13.6
* libfontenc: version 1.1.9
* libgcrypt: version 1.12.1
* libgpg-error: version 1.59
* libjpeg-turbo: version 3.1.3
* libnetfilter\_conntrack: version 1.1.1
* libnftnl: version 1.3.1
* libnl3: version 3.12.0
* libnvme: version 1.16.1
* libpcap: version 1.10.6
* libpng: version 1.6.55
* libtasn1: version 4.21.0
* libunistring: version 1.4.2
* liburing: version 2.14
* libvirt: version 12.2.0
* libvirt-php: version 0.5.8\_abf2ec0-x86\_64-1\_LT
* libX11: version 1.8.13
* libx86: version 1.1.1
* libXcomposite: version 0.4.7
* libXdamage: version 1.1.7
* libXext: version 1.3.7
* libXinerama: version 1.1.6
* libxkbcommon: version 1.13.1
* libxkbfile: version 1.2.0
* libxml2: version 2.15.2
* libXmu: version 1.3.1
* libXpm: version 3.5.18
* libXrandr: version 1.5.5
* libxslt: version 1.1.45
* libXxf86dga: version 1.1.7
* libXxf86vm: version 1.1.7
* lmdb: version 0.9.35
* lsof: version 4.99.6
* lvm2: version 2.03.38
* mcelog: version 210
* mesa: version 26.0.1
* nano: version 8.7.1
* ncurses: version 6.6
* nfs-utils: version 2.8.5
* nghttp2: version 1.68.0
* nghttp3: version 1.15.0
* noto-fonts-ttf: version 2026.03.01
* ntp: version 4.2.8p18
* nvme-cli: version 2.16
* openssl: version 3.5.5
* ovmf-stable: version 202508
* p11-kit: version 0.26.2
* pam: version 1.7.2
* pango: version 1.57.0
* pcre2: version 10.47
* php: version 8.4.15-x86\_64-1\_LT
* pkgtools: version 15.1
* procps-ng: version 4.0.6
* qemu: version 10.2.2
* rclone: version 1.72.0-x86\_64-1\_SBo\_LT
* readline: version 8.3.003
* shadow: version 4.19.4
* spirv-llvm-translator: version 20260218\_56778655
* sqlite: version 3.51.2
* sysstat: version 12.7.9
* talloc: version 2.4.4
* tdb: version 1.4.15
* telnet: version 0.17
* tpm2-tools: version 5.7
* tpm2-tss: version 4.1.3
* userspace-rcu: version 0.15.6
* util-linux: version 2.41.3
* virglrenderer: version 1.2.0
* virtiofsd: version 1.13.2
* wireguard-tools: version 1.0.20260223
* wireless-regdb: version 2026.02.04
* xauth: version 1.1.5
* xfsprogs: version 6.18.0
* xkbcomp: version 1.5.0
* xkeyboard-config: version 2.47
* xkill: version 1.0.7
* xorg-server: version 21.1.21
* xterm: version 407
* xz: version 5.8.2
* zfs: version 2.4.1
* zlib: version 1.3.2
## Pre-release tester notes[​](#pre-release-tester-notes)
### CHANGES FROM BETA.2[​](#changes-from-beta2)
* Docker template MAC handling now has a dedicated fixed MAC field and shows live MAC addresses in Advanced View.
* Docker template lookup now handles case-only filename differences on case-sensitive boot storage.
* Boot pool and pool-device display fixes for missing, wrong, or larger device names.
* CRLF handling for Syslinux and GRUB configuration files.
* File Manager theme fix on the Main tab.
* QEMU `10.2.2`, libvirt `12.2.0`, refreshed OVMF firmware, and a virtiofs hang fix.
* `dynamix.unraid.net` `4.32.3`.
* [Upgrading](#upgrading)
* [Known issues](#known-issues)
* [Notes](#notes)
* [Rolling back](#rolling-back)
* [Changes vs. 7.2.4](#changes-vs-724)
* [Security](#security)
* [Onboarding and internal boot](#onboarding-and-internal-boot)
* [Licensing](#licensing)
* [Containers / Docker](#containers--docker)
* [Storage](#storage)
* [WebGUI / System](#webgui--system)
* [File Manager](#file-manager)
* [Networking / Hardware](#networking--hardware)
* [Virtualization](#virtualization)
* [Unraid API](#unraid-api)
* [Linux kernel](#linux-kernel)
* [Base distro updates](#base-distro-updates)
* [Pre-release tester notes](#pre-release-tester-notes)
* [CHANGES FROM BETA.2](#changes-from-beta2)