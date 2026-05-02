Secure node state storage · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Secure node state storage
Last validated: Jan 12, 2026
Tailscale node state contains [node keys](/docs/concepts/node-keys) and other sensitive data necessary for identifying the device to your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)) and for encrypting and decrypting traffic to other devices on the tailnet. This document covers how to configure Tailscale to encrypt the node state.
Secure node state storage is available for [all plans](/pricing).
## [Why it matters](#why-it-matters)
Secure node state storage can help protect against a malicious actor copying node state from one device to another, effectively cloning the node. By using [platform-specific](#platform-support) capabilities, Tailscale ensures node state encrypts at rest, making theft from disk and node cloning more difficult.
## [Platform support](#platform-support)
Secure node state storage implementations vary by platform and Tailscale client version.
|**Platform**|**Implementation**|**Version support**|
|Android|[EncryptedSharedPreferences](https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences)|All versions|
|Linux|Trusted Platform Module (TPM)|Tailscale [v1.86](/changelog#2025-07-24) and later|
|macOS/iOS/tvOS from Mac App Store|[Keychain](https://support.apple.com/guide/keychain-access/what-is-keychain-access-kyca1083/mac)|All versions|
|[macOS standalone](/docs/concepts/macos-variants#standalone-variant)|[Keychain](https://support.apple.com/guide/keychain-access/what-is-keychain-access-kyca1083/mac)|Tailscale [v1.86](/changelog#2025-07-24) and later|
|Windows|TPM|Tailscale [v1.86](/changelog#2025-07-24) and later|
## [Prerequisites](#prerequisites)
* Refer to [platform support](#platform-support) for the minimum required Tailscale version for your client platforms.
* On Linux and Windows, your device must have a functioning TPM 2.0 device.
## [Configure secure node state storage](#configure-secure-node-state-storage)
Configuration of node state storage differs by platform and version:
* Tailscale 1.90.2 to 1.92.4: node state storage encryption is enabled by default on all supported platforms.
* Tailscale 1.92.5 or later: node state storage encryption is opt-in on Windows and Linux, and enabled by default on all other supported platforms.
### [Android](#android)
Secure node state storage encrypts by default and does not require extra configuration.
### [Linux](#linux)
Configure secure node state storage by passing the [`--encrypt-state`](/docs/reference/tailscaled#flags-to-tailscaled) flag to `tailscaled`. Apply the changes by [restarting `tailscaled`](/docs/reference/tailscaled#stopping-and-starting-tailscaled).
### [macOS/iOS/tvOS (from Mac App Store)](#macosiostvos-from-mac-app-store)
Secure node state storage encrypts by default and does not require extra configuration.
### [macOS standalone](#macos-standalone)
Configure secure node state storage by setting the [`EncryptState`](/docs/features/tailscale-system-policies#encrypt-node-state-file) system policy. Apply the changes by [restarting `tailscaled`](/docs/reference/tailscaled#stopping-and-starting-tailscaled). Refer to [Deploy Tailscale on macOS using MDM](/docs/integrations/mdm/mac) for how to configure this on macOS.
### [Windows](#windows)
Configure secure node state storage by setting the [`EncryptState`](/docs/features/tailscale-system-policies#encrypt-node-state-file) system policy. Apply the changes by [restarting `tailscaled`](/docs/reference/tailscaled#stopping-and-starting-tailscaled). Refer to [Deploy Tailscale on Windows using MDM](/docs/integrations/mdm/windows-mdm) for how to configure this on Windows.
## [Disabling secure node state storage](#disabling-secure-node-state-storage)
On supported platforms, disabling secure node state storage will migrate encrypted state to the prior plaintext format.
## [Device posture attribute](#device-posture-attribute)
Devices have a `node:tsStateEncrypted` [device posture attribute](/docs/features/device-posture#device-posture-attributes) indicating whether the Tailscale node state encrypts.
## [Recover from TPM failures](#recover-from-tpm-failures)
On [Linux and Windows](/blog/encrypting-data-at-rest#windowslinux), the Tailscale client
encrypts the node state file with a TPM device. To read or modify the state
file, Tailscale has to decrypt it with the exact same TPM device.
In some uncommon situations the TPM device can get reset or disappear entirely,
usually due to a bad firmware update or hardware failure. When this happens,
Tailscale is unable to decrypt the state file, which causes the client to fail
to start.
You can verify that this is the reason for Tailscale not running by looking for
errors containing `failed to unseal state file` in the [client
logs](/docs/features/logging#client-logs).
If you are unable to determine why the TPM device is misbehaving and fix it, the
only remaining solution is to reset the node state and register it again.
1. [Remove the old device](/docs/features/access-control/device-management/how-to/remove) from the admin console.
2. Remove the node state files.
[Windows](/docs/features/secure-node-state-storage?tab=windows)[Linux](/docs/features/secure-node-state-storage?tab=linux)
Remove the following directories:
```
`C:\\ProgramData\\Tailscale
C:\\Users\\%USERNAME%\\AppData\\Local\\Tailscale
`
```
3. Follow the usual login flow to register the node again.
## [Limitations](#limitations)
* If secure node state storage is enabled on a Linux or Windows
device without TPM 2.0 support, Tailscale will fail to start.
* Enabling secure node state storage can only be done using system policies or CLI flags, not through the graphical settings screen.
On this page
* [Why it matters](#why-it-matters)
* [Platform support](#platform-support)
* [Prerequisites](#prerequisites)
* [Configure secure node state storage](#configure-secure-node-state-storage)
* [Android](#android)
* [Linux](#linux)
* [macOS/iOS/tvOS (from Mac App Store)](#macosiostvos-from-mac-app-store)
* [macOS standalone](#macos-standalone)
* [Windows](#windows)
* [Disabling secure node state storage](#disabling-secure-node-state-storage)
* [Device posture attribute](#device-posture-attribute)
* [Recover from TPM failures](#recover-from-tpm-failures)
* [Limitations](#limitations)
Scroll to top