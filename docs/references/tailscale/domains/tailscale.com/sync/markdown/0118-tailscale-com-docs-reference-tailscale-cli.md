Tailscale CLI · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale CLI
Last validated: Jan 26, 2026
The Tailscale client includes a built-in command-line interface (CLI) you can use to manage and troubleshoot your device within your Tailscale network (known as a tailnet).
The Tailscale CLI is available for [all plans](/pricing).
## [Using the Tailscale CLI](#using-the-tailscale-cli)
The location of the CLI varies depending on your platform:
[Linux](/docs/reference/tailscale-cli?tab=linux)[macOS](/docs/reference/tailscale-cli?tab=macos)[Windows](/docs/reference/tailscale-cli?tab=windows)
On Linux, the CLI is your primary interface to Tailscale. The `tailscale` binary is likely already in your `$PATH`, so you can run commands with:
```
`tailscale \<command\>
`
```
There is no CLI support for iOS and Android.
### [Tab completion](#tab-completion)
The Tailscale CLI supports tab-completion for commands, flags, and arguments. You can configure tab-completion with the [`completion` command](#completion).
```
`tailscale completion \<shell\> [--flags] [--descs]
`
```
Select your shell, then follow the instructions to load Tailscale CLI completions.
[Bash](/docs/reference/tailscale-cli?tab=bash)[Zsh](/docs/reference/tailscale-cli?tab=zsh)[Fish](/docs/reference/tailscale-cli?tab=fish)[PowerShell](/docs/reference/tailscale-cli?tab=powershell)
To load tab-completions for Bash, run the following command.
```
`source \<(tailscale completion bash)
`
```
Run the following command to load completions for every new session on Linux, then reload your shell.
```
`tailscale completion bash \> /etc/bash\_completion.d/tailscale
`
```
Run the following command to load completions for every new session on macOS, then reload your shell.
```
`tailscale completion bash \> $(brew --prefix)/etc/bash\_completion.d/tailscale
`
```
## [Command Reference](#command-reference)
Common flags for all commands:
* `--socket=\<path\>` Path to the tailscaled socket.
### [up](#up)
Connect your device to Tailscale and authenticate if needed.
```
`tailscale up [flags]
`
```
Running `tailscale up` without any flags connects to Tailscale.
Common flags:
* `--accept-routes` Accept [subnet routes](/docs/features/subnet-routers) that other nodes advertise. The default depends on the host operating system. For certain platforms - Windows, iOS, Android, the macOS App Store variant, and the macOS standalone variant - the default is to accept routes. All other platforms default to not accepting routes.
* `--advertise-exit-node` Offer to be an [exit node](/docs/features/exit-nodes) for outbound internet traffic from the Tailscale network. Defaults to not offering to be an exit node.
* `--advertise-routes=\<ip\>` Expose physical [subnet routes](/docs/features/subnet-routers) to your entire Tailscale network.
* `--exit-node=\<ip|name\>` Provide a [Tailscale IP](/docs/concepts/ip-and-dns-addresses) or [machine name](/docs/concepts/machine-names) to use as an exit node. To disable the use of an exit node, pass the flag with an empty argument: `--exit-node=`.
* `--exit-node-allow-lan-access` Allow the client node access to its own LAN while connected to an exit node. Defaults to not allowing access while connected to an exit node.
* `--force-reauth` Force re-authentication.
* `--snat-subnet-routes` (Linux only) Disable source NAT. In normal operations, a subnet device sees the traffic originating from the subnet router. This simplifies routing, but does not allow traversing multiple networks. By disabling source NAT, the end machine sees the LAN IP address of the originating machine as the source.
* `--stateful-filtering` Enable stateful filtering for [subnet routers](/docs/features/subnet-routers) and [exit nodes](/docs/features/exit-nodes). When enabled, inbound packets with another node's destination IP are dropped, unless they are a part of a tracked outbound connection from that node. Defaults to disabled.
* `--shields-up` [Block incoming connections](/docs/features/client/manage-preferences) from other devices on your Tailscale network. Useful for personal devices that only make outgoing connections.
* `--ssh` Run a [Tailscale SSH](/docs/features/tailscale-ssh) server, permitting access per the tailnet administrator's declared [access policy](/docs/features/access-control/acls), or the [default policy](/docs/reference/examples/acls#allow-all-default-acl) if none is defined. Defaults to false.
For a complete list of available flags, refer to the [`tailscale up`](/docs/reference/tailscale-cli/up) topic.
### [down](#down)
Disconnect from Tailscale. Running this command is the same as choosing to disconnect from or quit a Tailscale client.
```
`tailscale down
`
```
When disconnected, you cannot reach devices over Tailscale. To reconnect, re-run `tailscale up` without any flags.
Available flags:
* `--accept-risk=\<risk\>` Accept risk and skip confirmation for risk type. This can be either `lose-ssh` or `all`, or an empty string to not accept risk.
* `--reason="\<description\>"` Specify the reason (inside quotes) for disconnecting Tailscale when the [system policies](/docs/features/tailscale-system-policies) `AlwaysOn.Enabled` and `AlwaysOn.OverrideWithReason` are enabled. For example, `tailscale down --reason="DNS issues"`.
### [bugreport](#bugreport)
The `bugreport` command is available in Tailscale v1.8 or later. If you don't see this command, consider [updating](/docs/features/client/update) your Tailscale client.
Generate a bug report with diagnostic information.
The `bugreport` command makes it easier to report bugs to the Tailscale team by marking diagnostic logs with indicators to make triage easier.
If you encounter a connectivity issue, run `tailscale bugreport` on the device experiencing the issue at the time you encounter it.
```
`tailscale bugreport
`
```
This command prints a random identifier into diagnostic logs, which you can share with our team.
Identifiers look like this:
```
`BUG-1b7641a16971a9cd75822c0ed8043fee70ae88cf05c52981dc220eb96a5c49a8-20210427151443Z-fbcd4fd3a4b7ad94
`
```
This command shares no personally identifiable information and is unused unless you share the bug identifier with our team.
Available flags:
* `--diagnose` Prints additional verbose information about the system to the Tailscale logs after generating a `bugreport` identifier, which can then be viewed by our support team. Defaults to `false`.
* `--record` Pause and then write another `bugreport`. Use this flag to create an initial `bugreport` identifier. During the pause, perform the action that reproduces your issue. Then, press Enter to create a second `bugreport` identifier. Share both bug identifiers with our team. Defaults to `false`.
### [cert](#cert)
Generate Let's Encrypt certificate and key files on the host for [HTTPS certificates](/docs/how-to/set-up-https-certificates) in your tailnet.
If you are trying to serve a folder of files or reverse proxy to an HTTP service, use the [`tailscale serve`](#serve) command instead.
```
`tailscale cert hostname.tails-scales.ts.net
`
```
Alternatively, if you want to save the certificate and private key to files, you can use the `--cert-file` and `--key-file` arguments:
```
`tailscale cert --cert-file=cert.pem --key-file=key.pem hostname.tails-scales.ts.net
`
```
The certificates provided by Let's Encrypt have a 90-day expiry and require periodic renewal. When a certificate is delivered as files on disk which you then move to an install location, such as when using `tailscale cert`, the [`tailscaled` daemon](/docs/reference/tailscaled) doesn't know where to place a renewed certificate or how to install it. As a result, you are responsible for renewing any certificates that you create using `tailscale cert`.
If a certificate is handled without the user initiating any file-based certificate installation (such as when using the [Caddy integration of Tailscale](https://github.com/tailscale/caddy-tailscale)) then the certificate will automatically renew without the user doing anything.
Available flags:
* `--cert-file=\<cert\>` Specify the certificate output path.
* `--key-file=\<key\>` Specify the private key output path.
* `--min-validity=\<duration\>` Request a specified minimum remaining validity on the returned certificate. `duration` can be any value parseable by [`time.ParseDuration()`](https://pkg.go.dev/time#ParseDuration). For example, use `120h` to set the duration to five days.
* `--serve-demo` Serve on port `:443` using the cert as a demo, instead of writing out the files to disk.
The `--min-validity` flag lets you ensure that the returned certificate is valid for at least the specified duration. If you specify a duration longer than the [certification lifetime set by Let's Encrypt](https://letsencrypt.org/docs/faq#what-is-the-lifetime-for-let-s-encrypt-certificates-for-how-long-are-they-valid), it uses the maximum lifetime set by Let's Encrypt.
### [dns](#dns)
The `dns` command lets you access [Tailscale DNS settings](/docs/reference/dns-in-tailscale). It's available in Tailscale v1.74.0 and later.
Subcommands:
* `status` Print the configuration of the local DNS forwarder and the tailnet-wide [MagicDNS](/docs/features/magicdns) configuration.
* `query` Perform a DNS query using the local DNS forwarder. It's available in Tailscale v1.76.0 and later.
Available flags for `status`:
* `--all` Outputs advanced debugging information.
Available flags for `status` and `query`:
* `--json` Output in JSON format.
### [drive](#drive)
Share a directory with your tailnet using [Taildrive](/docs/features/taildrive).
```
`tailscale drive share \<name\> \<path\>
tailscale drive rename \<oldname\> \<newname\>
tailscale drive unshare \<name\>
tailscale drive list
`
```
Subcommands:
* `share` Create or modify a share.
* `rename` Rename a share.
* `unshare` Remove a share.
* `list` List current shares.
### [completion](#completion)
Configure tab-completion for the Tailscale CLI.
```
`tailscale completion \<subcommand\> [flags]
`
```
Subcommands:
* `bash` Configure tab-completion for the `bash` shell.
* `zsh` Configure tab-completion for the `zsh` shell.
* `fish` Configure tab-completion for the `fish` shell.
* `powershell` Configure tab-completion for PowerShell.
Available flags:
* `--flags=\<true|false\>` Configure whether to suggest flags (in addition to subcommands). Set to `true` by default.
* `--descs=\<true|false\>` Configure whether to include descriptions of subcommands in the suggestions. Set to `true` by default.
### [configure](#configure)
Configure resources that you want to include in your tailnet.
```
`tailscale configure \<subcommands\>
`
```
Subcommands:
* `kubeconfig` (alpha) Configure `kubectl` to connect to a Kubernetes cluster using Tailscale.
* `mac-vpn` Install or uninstall the VPN configuration on [App Store](/docs/concepts/macos-variants#mac-app-store-variant) and [Standalone variant](/docs/concepts/macos-variants#standalone-variant) of macOS.
* `synology` Configure Synology to enable outbound connections needed for Tailscale.
* `sysext` Activate, deactivate, or manage the state of the Tailscale [system extension](/docs/concepts/macos-sysext) on the [Standalone variant](/docs/concepts/macos-variants#standalone-variant) of macOS.
* `systray` Manage the `systray` client for Linux.
Available flags for `kubeconfig`:
* `--http` Use HTTP instead of HTTPS to connect to the auth proxy. Ignored if you include a scheme in the hostname argument.
Available subcommands for `mac-vpn`:
* `install` Write the Tailscale VPN configuration to the macOS settings.
* `uninstall` Delete the Tailscale VPN configuration from the macOS settings.
Available subcommands for `sysext`:
* `activate` Register the Tailscale system extension with macOS.
* `deactivate` Deactivate the Tailscale system extension on macOS.
* `status` Print the enablement status of the Tailscale system extension.
Available flags for `systray`:
* `--enable-startup=\<init-system\>` Install the startup script for the init system. The only currently supported value is `systemd`.
Examples:
* To configure your local `kubeconfig` file for authentication with a Kubernetes auth proxy:
```
`tailscale configure kubeconfig \<hostname-or-fqdn\>
`
```
* To configure Synology to enable outbound connections:
```
`tailscale configure synology
`
```
### [exit-node](#exit-node)
Get information about [exit-nodes](/docs/features/exit-nodes) in your tailnet.
```
`tailscale exit-node \<subcommands\>
`
```
Available subcommands:
* `list` Lists the exit nodes in your tailnet.
* `suggest` Suggests a [recommended exit node](/docs/features/exit-nodes/auto-exit-nodes).
Available flags for `list`:
* `--filter=\<country\>` Filter exit nodes by country.
### [file](#file)
Access and make files available to [Taildrop](/docs/features/taildrop).
```
`tailscale file cp \<files...\> \<target\>:
tailscale file get \<target-directory\>
`
```
Available commands:
* `cp` Copy files to a host.
* `get` Move files out of the Tailscale file inbox.
Available flags for `cp`:
* `--name=\<name\>` Alternate filename to use, especially useful when `\<file\>` is `-` (`stdin`).
* `--targets` List possible file `cp` targets.
* `--verbose` Verbose output.
Available flags for `get`:
* `--conflict=\<behavior\>` `behavior` when a conflicting (same-named) file already exists in the target directory.
* `skip` Skip conflicting files: leave them in the Taildrop inbox and print an error. Get any non-conflicting files.
* `overwrite` Overwrite existing file.
* `rename` Write to a new number-suffixed filename.
* `--loop` Run get in a loop, receiving files as they come in.
* `--verbose` Verbose output.
* `--wait` Wait for a file to arrive if inbox is empty.
### [funnel](#funnel)
Serve content and local servers from your Tailscale node to the internet.
To limit local service access to your tailnet, use the [`serve`](#serve) command.
```
`tailscale funnel \<target\>
tailscale funnel \<subcommand\> [flags] \<args\>
`
```
Subcommands:
* [`status`](/docs/reference/tailscale-cli/funnel#get-the-status) Gets the status.
* [`reset`](/docs/reference/tailscale-cli/funnel#reset-tailscale-funnel) Resets the configuration.
For more information, refer to the [`tailscale funnel`](/docs/reference/tailscale-cli/funnel) topic.
### [ip](#ip)
Get a device's Tailscale IP address.
```
`tailscale ip [flags] [\<hostname\>]
`
```
By default, this command returns both an [`100.x.y.z` IPv4 address](/docs/concepts/ip-and-dns-addresses) and an IPv6 address for the current device. You can return only an IPv4 or IPv6 address by passing either the `-4` or `-6` flags.
```
`tailscale ip -4
`
```
For example, this command will return information similar to the following:
```
`100.121.112.23
`
```
You can also find the Tailscale IP for other devices on your network by adding the device hostname after the command. For example:
```
`tailscale ip raspberrypi
`
```
This command will return information similar to the following:
```
`100.126.153.111
fd7a:115c:a1e0:ab12:4843:cd96:627e:9975
`
```
Available flags:
* `--4` Only return an IPv4 address.
* `--6` Only return an IPv6 address.
* `--1` Only return one address, preferring IPv4.
* `--assert=\<specific-ip-address\>` Assert that the node's IP (or one of the node's IPs) matches this IP address.
### [licenses](#licenses)
Get open source license information.
```
`tailscale licenses
`
```
### [lock](#lock)
Manage [Tailnet Lock](/docs/features/tailnet-lock) for your tailnet.
```
`tailscale lock \<subcommand\> [flags] \<args\>
`
```
Common subcommands:
* [`init`](/docs/reference/tailscale-cli/lock#lock-init) Initializes Tailnet Lock.
* [`status`](/docs/reference/tailscale-cli/lock#lock-status) Outputs the state of Tailnet Lock.
* [`add`](/docs/reference/tailscale-cli/lock#lock-add) Adds one or more trusted signing keys to Tailnet Lock.
* [`remove`](/docs/reference/tailscale-cli/lock#lock-remove) Removes one or more trusted signing keys from Tailnet Lock.
* [`sign`](/docs/reference/tailscale-cli/lock#lock-sign) Signs a node key and transmits the signature to the coordination server.
Running `tailscale lock` with no subcommand and no arguments is equivalent to running [`tailscale lock status`](/docs/reference/tailscale-cli/lock#lock-status).
For a complete list of subcommands and flags, refer to the [`tailscale lock`](/docs/reference/tailscale-cli/lock) topic.
### [login](#login)
Log into Tailscale (and add this device to your Tailscale network). For more information about logging in, refer to [fast-user-switching](/docs/features/client/fast-user-switching).
```
`tailscale login [flags]
`
```
Available flags:
* `--accept-dns` Accept [DNS configuration](/docs/reference/dns-in-tailscale) from the admin console. Defaults to accepting DNS settings.
* `--accept-routes` Accept [subnet routes](/docs/features/subnet-routers) that other nodes advertise. The default depends on the host operating system. For certain platforms - Windows, iOS, Android, the macOS App Store variant, and the macOS standalone variant - the default is to accept routes. All other platforms default to not accepting routes.
* `--advertise-connector` Offer to be an [app connector](/docs/features/app-connectors) for domain-specific internet traffic for the tailnet.
* `--advertise-exit-node` Offer to be an [exit node](/docs/features/exit-nodes) for outbound internet traffic from the Tailscale network. Defaults to not offering to be an exit node.
* `--advertise-routes=\<ip\>` Expose physical [subnet routes](/docs/features/subnet-routers) to your entire Tailscale network.
* `--advertise-tags=\<tags\>` Give tagged permissions to this device. You must be [listed in `"TagOwners"`](/docs/reference/syntax/policy-file#tag-owners) to be able to apply tags.
* `--auth-key=\<key\>` Provide an [auth key](/docs/features/access-control/auth-keys) to automatically authenticate the node as your user account. For a best practice when handling the `--auth-key` value, refer to [Securely handle an auth key](/docs/features/access-control/auth-keys/how-to/secure-auth-keys).
* `--client-id` Client ID used to generate [auth keys](/docs/features/access-control/auth-keys) by using
[workload identity federation](/docs/features/workload-identity-federation).
* `--client-secret` [OAuth Client](/docs/features/oauth-clients) secret used to generate
[auth keys](/docs/features/access-control/auth-keys); if it begins with `file:`, then it's a path to a
file containing the secret.
* `--exit-node=\<ip|name\>` Provide a [Tailscale IP](/docs/concepts/ip-and-dns-addresses) or [machine name](/docs/concepts/machine-names) to use as an exit node. To disable the use of an exit node, pass the flag with an empty argument: `--exit-node=`.
* `--exit-node-allow-lan-access` Allow the client node access to its own LAN while connected to an exit node. Defaults to not allowing access while connected to an exit node.
* `--hostname=\<name\>` Provide a hostname to use for the device instead of the one provided by the OS. Note that this will change the machine name used in [MagicDNS](/docs/features/magicdns).
* `--id-token` ID token from the identity provider to exchange with the control
server for [workload identity federation](/docs/features/workload-identity-federation); if it begins
with `file:`, then it's a path to a file containing the token.
* `--audience` Audience used when requesting an ID token from an identity provider for auth keys generated by [workload identity federation](/docs/features/workload-identity-federation).
* `--login-server=\<url\>` Provide the base URL of a control server instead of `https://controlplane.tailscale.com`. If you are using [Headscale](/blog/opensource#the-open-source-coordination-server) for your control server, use your Headscale instance's URL.
* `--netfilter-mode=\<mode\>` Netfilter mode (one of `on`, `nodivert`, `off`). Refer to [Tailscale netfilter modes](/docs/reference/netfilter-modes) for more information.
* `--nickname=\<name\>` [Nickname](/docs/features/client/fast-user-switching#setting-a-nickname) for the current account.
* `--operator=\<user\>` Provide a Unix username other than `root` to operate `tailscaled`.
* `--qr` Generate a QR code for the web login URL. Defaults to not showing a QR code.
* `--qr-format=\<format\>` QR code formatting: `small` or `large`. Defaults to `small`.
* `--stateful-filtering` Enable stateful filtering for [subnet routers](/docs/features/subnet-routers) and [exit nodes](/docs/features/exit-nodes). When enabled, inbound packets with another node's destination IP are dropped, unless they are a part of a tracked outbound connection from that node. Defaults to disabled.
* `--shields-up` [Block incoming connections](/docs/features/client/manage-preferences) from other devices on your Tailscale network. Useful for personal devices that only make outgoing connections.
* `--snat-subnet-routes` Source NAT traffic to local routes advertised with `--advertise-routes`.
* `--ssh` Run a [Tailscale SSH](/docs/features/tailscale-ssh) server, permitting access per the tailnet administrator's declared [access policy](/docs/features/access-control/acls), or the [default policy](/docs/reference/examples/acls#allow-all-default-acl) if none is defined. Defaults to false.
* `--timeout=\<duration\>` Maximum amount of time to wait for the Tailscale service to initialize. `duration` can be any value parseable by [`time.ParseDuration()`](https://pkg.go.dev/time#ParseDuration). Defaults to `0s`, which blocks forever.
* `--unattended`(Windows only) Run in [unattended mode](/docs/how-to/run-unattended) where Tailscale keeps running even after the current user logs out.
### [logout](#logout)
Disconnect from Tailscale and expire the current log in. The next time you run `tailscale up`, you'll need to reauthenticate your device.
```
`tailscale logout
`
```
If you run `tailscale logout` on an [ephemeral node](/docs/features/ephemeral-nodes), the node will be removed from your tailnet immediately.
Available flags:
* `--reason` Reason for the logout, if required by a [system policy](/docs/features/tailscale-system-policies).
### [metrics](#metrics)
Expose and collect [Tailscale client metrics](/docs/reference/tailscale-client-metrics) for use with third-party monitoring systems.
```
`tailscale metrics
`
```
Subcommands:
* `print` Shows client metrics in the current terminal session.
* `write` Writes metric values to a text file.
### [netcheck](#netcheck)
Get a report on your current physical network conditions. This command is provided to help debug connection troubles.
```
`tailscale netcheck
`
```
`netcheck` will output a report like this:
```
`Report:
\* Time: 2025-03-13T16:35:03.336481Z
\* UDP: true
\* IPv4: yes, \<ipv4-address\>
\* IPv6: yes, \<ipv6-address\>
\* MappingVariesByDestIP: false
\* PortMapping:
\* Nearest DERP: Seattle
\* DERP latency:
- sea: 24.2ms (Seattle)
- sfo: 50.5ms (San Francisco)
- lax: 57.2ms (Los Angeles)
- den: 58.5ms (Denver)
- dfw: 63ms (Dallas)
- ord: 73.3ms (Chicago)
`
```
(In the example output, the list of [DERP servers](/docs/reference/derp-servers) is truncated for brevity.)
* `UDP` shows whether UDP traffic is enabled on the current network. If this is false, it's unlikely Tailscale will be able to make point-to-point connections, and will instead rely on our [encrypted TCP relays (DERP)](/docs/reference/derp-servers)
* `IPv4` and **IPv6** show your network public IP addresses and support for both protocols.
* `MappingVariesByDestIP` describes whether your device is behind a difficult NAT that varies the device's IP address depending on the destination.
* `HairPinning` describes whether your router can route connections from endpoints on your LAN back to your LAN using those endpoints' globally-mapped IPv4 addresses/ports.
* `PortMapping` describes a list of which three port-mapping services exist on your router. Possible values are "UPnP", "NAT-PMP", and "PCP".
* `DERP latency` and `Nearest DERP` describe latency from our [encrypted TCP relays (DERP)](/docs/reference/derp-servers). The lowest latency ("nearest") server is used for traffic.
If any fields are blank, it means Tailscale wasn't able to measure that network property.
All the information from `tailscale netcheck` is also available in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, by selecting a particular machine.
Available flags:
* `--every=\<duration\>` If non-zero, do an incremental report with the given frequency.
* `--format=\<format\>` Output format; empty (for human-readable), `json` or `json-line`.
* `--verbose` Verbose logs.
* `--bind-address` Send and receive connectivity probes using this locally bound IP address.
* `--bind-port` Send and receive connectivity probes using this UDP port.
### [nc](#nc)
Connect to a port on a host, connected to stdin/stdout.
```
`tailscale nc \<hostname-or-IP\> \<port\>
`
```
### [ping](#ping)
Attempt to ping another device exclusively over Tailscale.
The regular `ping` command often works fine over Tailscale, but `tailscale ping` provides more details about the connection over Tailscale that can be helpful when troubleshooting connectivity.
```
`tailscale ping \<hostname-or-ip\>
`
```
You can call `tailscale ping` using either a [100.x.y.z address](/docs/concepts/ip-and-dns-addresses) or a [machine name](/docs/concepts/machine-names).
Available flags:
* `--c` Maximum number of pings to send. Defaults to 10.
* `--icmp`, `--icmp=false` Perform an ICMP-level ping (through WireGuard, but not the local host OS stack). Defaults to false.
* `--peerapi`, `--peerapi=false` Try hitting the peer's PeerAPI HTTP server. Defaults to false.
* `--size=\<size\>` Size of the ping message (default pings only). 0 for minimum size.
* `--tsmp`, `--tsmp=false` Perform a TSMP-level ping (through WireGuard, but not either host's OS stack). Defaults to false.
* `--timeout=\<duration\>` Maximum amount of time to wait before giving up on a ping. `duration` can be any value parseable by [`time.ParseDuration()`](https://pkg.go.dev/time#ParseDuration). Defaults to `5s`.
* `--until-direct`, `--until-direct=false` Stop once a direct path is established. Defaults to true.
* `--verbose`, `--verbose=false` Show verbose output. Defaults to false.
There are [four types of ping messages](/docs/reference/ping-types) supported by the `tailscale ping` command.
### [serve](#serve)
Serve content and local servers from your Tailscale node to your tailnet.
To publicly share the local service to the internet, use the [`funnel`](#funnel) command.
```
`tailscale serve \<target\>
tailscale serve \<subcommand\> [flags] \<args\>
`
```
Subcommands:
* [`status`](/docs/reference/tailscale-cli/serve#get-the-status) Gets the status.
* [`reset`](/docs/reference/tailscale-cli/serve#reset-tailscale-serve) Resets the configuration.
For more information, refer to the [`tailscale serve`](/docs/reference/tailscale-cli/serve) topic.
### [set](#set)
Change specified preferences.
Unlike [`tailscale up`](#up), this command does not require the complete set of desired settings. It only updates the settings you explicitly set. There are no default values. Note that when using [Fast User Switching](/docs/features/client/fast-user-switching), changes made are only for the currently connected tailnet.
```
`tailscale set [flags]
`
```
Available flags:
* `--accept-dns` Accept [DNS configuration](/docs/reference/dns-in-tailscale) from the admin console.
* `--accept-risk=\<risk\>` Accept risk and skip confirmation for risk type. This can be either `lose-ssh` or `all`, or an empty string to not accept risk.
* `--accept-routes`, `--accept-routes=false` Accept [subnet routes](/docs/features/subnet-routers) that other nodes advertise. The default depends on the host operating system. For certain platforms - Windows, iOS, Android, the macOS App Store variant, and the macOS standalone variant - the default is to accept routes. All other platforms default to not accepting routes.
* `--advertise-connector` Offer to be an [app connector](/docs/features/app-connectors) for domain-specific internet traffic for the tailnet.
* `--advertise-exit-node`, `--advertise-exit-node=false` Offer to be an exit node for internet traffic for the tailnet.
* `--advertise-routes=\<ip\>` Expose physical [subnet routes](/docs/features/subnet-routers) to your entire Tailscale network. This is a comma-separated string, such as "10.0.0.0/8,192.168.0.0/24", or an empty string to not advertise routes.
* `--auto-update`, `--auto-update=false` Enable or disable [auto-updates](/docs/features/client/update#auto-updates) for the client.
* `--exit-node=\<ip|name\>` Provide a [Tailscale IP](/docs/concepts/ip-and-dns-addresses) or [machine name](/docs/concepts/machine-names) to use as an exit node. You can also use `--exit-node=auto:any` to track the suggested exit node and automatically switch to it when available exit nodes or network conditions change. To disable the use of an exit node, pass the flag with an empty argument using `--exit-node=`.
* `--exit-node-allow-lan-access`, `--exit-node-allow-lan-access=false` Allow the client node access to its own LAN while connected to an exit node.
* `--hostname=\<name\>` Hostname to use for the device instead of the one provided by the OS. Note that this will change the machine name used in [MagicDNS](/docs/features/magicdns).
* `--netfilter-mode=\<mode\>` Netfilter mode (one of `on`, `nodivert`, `off`). Refer to [Tailscale netfilter modes](/docs/reference/netfilter-modes) for more information.
* `--nickname=\<name\>` [Nickname](/docs/features/client/fast-user-switching#setting-a-nickname) for the current account.
* `--operator=\<user\>` A Unix username other than `root` to operate `tailscaled`.
* `--relay-server-port=\<port\>` Specify a UDP port to accept peer relay connections on. UDP port number (`0` will pick a random unused port) for the relay server to bind to, on all interfaces, or empty string to disable relay server functionality. Refer to [Tailscale Peer Relays](/docs/features/peer-relay) for more information.
* `--relay-server-static-endpoints` Use static endpoints for [Tailscale Peer Relays](/docs/features/peer-relay).
* `--report-posture` Allow management plane to gather [device posture](/docs/features/device-posture) information.
* `--shields-up`, `--shields-up=false` [Block incoming connections](/docs/features/client/manage-preferences) from other devices on your Tailscale network.
Useful for personal devices that only make outgoing connections.
* `--snat-subnet-routes` Source NAT traffic to local routes advertised with `--advertise-routes`.
* `--ssh`, `--ssh=false` Run a [Tailscale SSH](/docs/features/tailscale-ssh) server, permitting access per the tailnet administrator's declared [access policy](/docs/features/access-control/acls), or the [default policy](/docs/reference/examples/acls#allow-all-default-acl) if none is defined.
* `--stateful-filtering` Apply stateful filtering to forwarded packets (subnet routers, exit nodes, and so on).
* `--update-check` Notify about available Tailscale updates.
* `--webclient`, `--webclient=false` Expose the [web interface](/docs/features/client/device-web-interface) to your tailnet persistently in the background on port `:5252.`
### [ssh](#ssh)
Establish a [Tailscale SSH](/docs/features/tailscale-ssh) session to a Tailscale machine.
You can often use the regular `ssh` command or another SSH client to make an SSH session to a Tailscale machine. However, when your local node is in [userspace-networking](/docs/reference/kernel-vs-userspace-routers#userspace-netstack-mode) mode and can't make a direct connection, use `tailscale ssh`. This sets up an SSH `ProxyCommand` to connect through the local `tailscaled` daemon. You can also use `tailscale ssh` when your local node is in [kernel](/docs/reference/kernel-vs-userspace-routers#kernel-mode) mode.
The `tailscale ssh` command automatically checks the destination server's SSH host key against the node's SSH host key as advertised by using the Tailscale coordination server.
```
`tailscale ssh \<args\>
`
```
`\<args\>` is one of the following forms:
* `host` The destination server. An interactive session will prompt you for the user name to use for the session.
* `user@host` The user name for the session and the destination server.
For both forms, `host` can be the destination server's [MagicDNS](/docs/features/magicdns) name (even if `--accept-dns=false` was set on the local node) or the destination server's [Tailscale IP address](/docs/concepts/ip-and-dns-addresses).
`tailscale ssh` is not available on sandboxed macOS builds—use the regular `ssh` client instead.
### [status](#status)
Get the status of your connections to other Tailscale devices.
```
`tailscale status
`
```
This command returns a condensed table of information in human-readable format:
```
`1 2 3 4 5
100.1.2.3 device-a apenwarr@ linux active; direct \<ip-port\>, tx 1116 rx 1124
100.4.5.6 device-b crawshaw@ macOS active; relay \<relay-server\>, tx 1351 rx 4262
100.7.8.9 device-c danderson@ windows idle; tx 1214 rx 50
100.0.1.2 device-d ross@ iOS -
`
```
From left-to-right, these columns represent:
* Column 1 is a [**Tailscale IP**](/docs/concepts/tailscale-ip-addresses), which you can use to connect to the device.
* Column 2 is the [**machine name**](/docs/concepts/machine-names) of the device. If you use [MagicDNS](/docs/features/magicdns), you can also use this name to connect.
* Column 3 is the **email address** for the owner of the device.
* Column 4 is the **device OS**.
* Column 5 shows the current **connection status**.
Connection status (column 5) is shown using three terms:
* `active` means traffic is currently being sent/received from this device. It also includes the connection type, which can be `direct`, `relay`, or `peer-relay`.
* If the connection is `direct`, it includes peer device's IP address.
* If the connection is `relay`, it includes the [DERP server](/docs/reference/derp-servers)'s city code (`nyc`, `fra`, `tok`, `syd`) for the respective location.
* If the connection is [`peer-relay`](/docs/features/peer-relay), it includes the Tailscale IP address of the peer relay and the VNI (virtual network interface) used.
* `idle` means traffic is not currently being sent/received from this device.
* `-` means no traffic has ever been sent/received from this device.
`active` and `idle` connection statuses will also include `tx`/`rx` values indicating the number of bytes sent (`tx`) and received (`rx`) from this device.
Running `tailscale status` with the `--json` flag returns a machine-readable JSON response.
```
`tailscale status --json
`
```
Unlike `tailscale status`, using this flag gives a detailed list of peers and users in your tailnet that makes it well-suited for automation tasks. It also includes additional metadata associated with your device.
Combine this with [`jq`](https://stedolan.github.io/jq) to automate data collection about your network. For example, the following command counts and sorts the relay servers your Tailscale peers are connected to.
```
`tailscale status --json | jq -r '.Peer[].Relay | select(.!="")' | sort | uniq -c | sort -nr
`
```
Available flags:
* `--active` Filter output to only peers with active sessions (not applicable to web mode).
* `--browser` Open a browser in web mode (default `true`).
* `--header` Show column headers in table format (default `false`).
* `--json` Output in JSON format (WARNING: format subject to change).
* `--listen=\<address\>` Listen address for web mode; use port 0 for automatic (default `127.0.0.1:8384`).
* `--peers` Show status of peers (default `true`).
* `--self` Show status of local machine (default `true`).
* `--web` Run webserver with HTML showing status.
### [switch](#switch)
Switch to a different Tailscale account. For more information about switching accounts, refer to [fast-user-switching](/docs/features/client/fast-user-switching).
```
`tailscale switch \<account\> [flags]
`
```
Examples:
* To switch to the `alice@example.com` account:
```
`tailscale switch alice@example.com
`
```
* To switch to the account that has the [nickname](/docs/features/client/fast-user-switching#setting-a-nickname) "work":
```
`tailscale switch work
`
```
Available flags:
* `--list` Lists available accounts.
* `--json` List available accounts in JSON format.
```
`tailscale switch --list --json
`
```
Subcommands:
* `remove \<id\>` removes a Tailscale account from the local machine. This does not delete the account itself, but it will no longer be available for switching to. You can add it back by logging in again. This command is currently in alpha and may change in the future.
### [syspolicy](#syspolicy)
List system policies, reload system policies, or inspect errors related to the [system policies](/docs/features/tailscale-system-policies) configured in your tailnet.
```
`tailscale syspolicy
`
```
Subcommands:
* `list` Shows system policies, reload system policies, or explore errors related to the [system policies](/docs/features/tailscale-system-policies) configured on the device.
* `reload` Forces the Tailscale client to reload and reapply system policy settings on the device.
Available flags:
* `--json` Return a machine-readable JSON response.
### [systray](#systray)
The `systray` command is available on the Linux client, is currently in [beta](/docs/reference/tailscale-release-stages#beta), and is available in Tailscale v1.88 or later.
Run the [system tray (`systray`) application](/docs/features/client/linux-systray) for Linux desktop clients to access some common actions like fast user switching and exit node selection.
```
`tailscale systray
`
```
Do not run `tailscale systray` as superuser (`sudo tailscale systray`), because systray is not designed to run as superuser and the command will fail.
### [update](#update)
The `update` command is available in Tailscale v1.36 or later for Windows and Ubuntu/Debian Linux, in v1.48.0 or later for the Mac Apple Store version and Synology, and in v1.54.0 or later for QNAP and the [Standalone variant of the macOS application](/docs/concepts/macos-variants#standalone-variant). If you don't see this command and you are running one of these operating systems, consider [updating your Tailscale client](/docs/features/client/update).
Update the Tailscale client version to the latest version, or to a different version.
```
`tailscale update [flags]
`
```
Available flags:
* `--dry-run` Show what update would do, without performing the update and without prompting to start the update.
* `--track` The track to check for updates, either "stable", "release-candidate", or unstable. If not specified, the update uses the track currently in effect for the client. For more information, refer to [Tailscale client versions and release tracks](/docs/reference/tailscale-client-versions#client-release-tracks).
* `--version` An explicit version to use for the update or downgrade. You cannot specify both `--track` and `--version`. This flag is not available on the macOS client.
* `--yes` Perform the update without interactive prompts. Defaults to false.
If you downgrade to a version that does not have the `tailscale update` functionality, you won't be able to run `tailscale update` to return to the prior version. You would need to [perform an update](/docs/features/client/update) without using the Tailscale CLI.
To determine the current version on a client, run [`tailscale version`](#version).
Examples:
Update to the latest version within your current track (stable or unstable, depending on what you're running):
```
`tailscale update
`
```
Update to the latest version within your current track without using interactive prompts:
```
`tailscale update --yes
`
```
Update to Tailscale v1.34:
```
`tailscale update --version=1.34.0
`
```
Update to the latest unstable version:
```
`tailscale update --track=unstable
`
```
### [version](#version)
Print the version of Tailscale.
```
`tailscale version [flags]
`
```
Available flags:
* `--daemon` Also print local node's daemon version. Defaults to false.
* `--json` Return a machine-readable JSON response.
* `--upstream` Print the latest upstream release version from `pkgs.tailscale.com`. Defaults to false.
* `--track`, `--track=[stable|unstable|release-candidate]` Check a specified track for updates. Empty value is the current track. For more information, refer to [Tailscale client versions and release tracks](/docs/reference/tailscale-client-versions#client-release-tracks).
Running `tailscale version` also prints other information, including the Go version. Here's an example of the output:
```
`tailscale version
1.72.0
tailscale commit: 9a0f00ea8ed08d1a94b357fb232ac9d44a512664
other commit: 387e0b40ad87031fb4444372ee80a97156e8deb9
go version: go1.22.5
`
```
### [wait](#wait)
Wait for Tailscale resources to become available for binding within a specified timeout or indefinitely.
The command returns exit code `0` on success. It returns a non-zero exit code on failure or timeout.
As of Tailscale version 1.96, the only resource available to wait for is the Tailscale interface and its IPs. A future version of this command may support waiting for other types of resources.
If running in userspace-networking mode, this command only waits for `tailscaled` and the `Running` state, as no physical network interface exists.
```
`tailscale wait [flags]
`
```
Available flags:
* `--timeout=\<duration\>` Set a timeout duration in seconds. Setting the duration to `0` will set the timeout to indefinite.
Examples:
To wait on a specific type of IP address, use `tailscale ip` in combination with the `tailscale wait` command. For example, to wait for an IPv4 address:
```
`tailscale wait && tailscale ip --assert=\<specific-ip-address\>
`
```
Linux `systemd` users can wait for the `tailscale-online.target` target, which runs this command.
A service that wants to bind to (listen on) a Tailscale interface or IP address, can use the following pattern to ensure Tailscale is ready before the program starts:
```
`tailscale wait && /path/to/service [...]
`
```
### [web](#web)
Start a web server for controlling the `tailscaled` daemon. Starting a web server is useful when the CLI or a native app is impractical (such as on NAS devices).
```
`tailscale web [flags]
`
```
Available flags:
* `--cgi=\<true|false\>` Run the web server as a CGI script. Defaults to false.
* `--listen=\<ip|name\>` Set the listen address. Use port `0` for automatic. Defaults to `localhost:8088`.
* `--origin=\<hostname\>` Origin at which the web UI is served (if behind a reverse proxy or used with CGI).
* `--prefix=\<string\>` Set the URL prefix added to requests (for CGI or reverse proxies).
* `--readonly` Run the web server in read-only mode.
### [whois](#whois)
Get the machine and user associated with a Tailscale IP.
```
`tailscale whois ip[:port]
`
```
For user devices, this command returns:
```
`Machine:
Name:
ID:
Addresses:
AllowedIPs:
User:
Name:
ID:
Capabilities:
`
```
For devices that are tagged, this command returns:
```
`Machine:
Name:
ID:
Addresses:
AllowedIPs:
Tags:
Capabilities:
`
```
For each of these fields:
* `Machine`, `Name` is the [machine name](/docs/concepts/machine-names) of the device. If you use [MagicDNS](/docs/features/magicdns), you can also use this name to connect.
* `Machine`, `ID` is the [node id](/docs/reference/glossary#node) of the device.
* `Machine`, `Addresses` are the [Tailscale IP](/docs/concepts/tailscale-ip-addresses), which you can use to connect to the device.
* `Machine`, `AllowedIPs` are the subnet routes available to the device.
* `Machine`, `Tags` are the tags to which the device belongs.
* `User`, `Name` is the email address for the owner of the device.
* `User`, `ID` is the unique ID of the user
* `Capabilities` show the grants for the device.
Running `tailscale whois` with the `--json` flag will return a machine-readable JSON response. (Note that the `--json` option must come before the `ip[:port]` argument.)
```
`tailscale whois --json ip[:port]
`
```
Available flags:
* `--json` Output in JSON format.
* `--proto=\<proto\>` Protocol for the WhoIs request; one of `tcp` or `udp`; empty mans both.
### [appc-routes](#appc-routes)
Print the current [app connector](/docs/features/app-connectors) route status.
By default this command prints the domains configured in the app connector
configuration and how many routes have been learned for each domain.
```
`tailscale appc-routes [flags]
`
```
Available flags:
* `--all` Print learned domains and routes and extra policy configured routes.
* `--map` Print the map of learned domains.
* `--n` Print the total number of routes this node advertises.
On this page
* [Using the Tailscale CLI](#using-the-tailscale-cli)
* [Tab completion](#tab-completion)
* [Command Reference](#command-reference)
* [up](#up)
* [down](#down)
* [bugreport](#bugreport)
* [cert](#cert)
* [dns](#dns)
* [drive](#drive)
* [completion](#completion)
* [configure](#configure)
* [exit-node](#exit-node)
* [file](#file)
* [funnel](#funnel)
* [ip](#ip)
* [licenses](#licenses)
* [lock](#lock)
* [login](#login)
* [logout](#logout)
* [metrics](#metrics)
* [netcheck](#netcheck)
* [nc](#nc)
* [ping](#ping)
* [serve](#serve)
* [set](#set)
* [ssh](#ssh)
* [status](#status)
* [switch](#switch)
* [syspolicy](#syspolicy)
* [systray](#systray)
* [update](#update)
* [version](#version)
* [wait](#wait)
* [web](#web)
* [whois](#whois)
* [appc-routes](#appc-routes)
Scroll to top