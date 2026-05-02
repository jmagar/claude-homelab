Tailscale daemon configuration file · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale daemon configuration file
Last validated: Jan 8, 2026
The `tailscaled` configuration file support is in alpha and the schema might change in future releases. Tailscale intends to preserve compatibility with earlier versions when possible. If breaking changes occur, a new version designation will be used.
You can configure the [Tailscale daemon](/docs/reference/tailscaled) (`tailscaled`) using a JSON configuration file instead of command-line flags passed to the [Tailscale CLI](/docs/reference/tailscale-cli). This approach is useful for headless deployments, containers, Kubernetes, and [infrastructure-as-code workflows](/docs/integration-infrastructure-as-code).
## [Basic usage](#basic-usage)
The `tailscaled` configuration file only requires you to set the `version` field manually. The following example shows a minimal configuration example:
```
`{
"version": "alpha0",
"authKey": "tskey-auth-example-XXXXX",
"hostname": "my-server",
"acceptRoutes": true
}
`
```
To start `tailscaled` with a configuration file, use the `--config` flag:
```
`tailscaled --config=/etc/tailscale/config.json
`
```
The Tailscale daemon does not automatically discover configuration files. You must specify the path explicitly using the `--config` flag.
## [Configuration options](#configuration-options)
The configuration file uses JSON or [HuJSON](https://github.com/tailscale/hujson) format. The following tables describe all available options. This section organizes all configuration options by category.
### [Required options](#required-options)
The `version` field is the only required option because all other necessary options have default values. If you omit optional fields, the Tailscale daemon uses the default values.
|Option|Type|Description|
|`version`|String|Required. The version of the configuration file schema. The only supported value is `"alpha0"`.|
### [Authentication](#authentication)
The following configuration options are for authenticating with the Tailscale [control plane](/docs/concepts/control-data-planes).
|Option|Type|Default|Description|
|`serverURL`|String|`https://controlplane.tailscale.com`|Specify the URL of a [custom control server](/docs/how-to/set-up-custom-control-server).|
|`authKey`|String|None|Specify an [Auth key](/docs/features/access-control/auth-keys) or [OAuth client secret](/docs/features/oauth-clients) for authentication. Prefix with `file:` to read from a file path (for example, `file:/etc/tailscale/authkey`). The daemon re-reads the file each time it authenticates with the [control plane](/docs/concepts/control-data-planes).|
### [General settings](#general-settings)
The following configuration options are options for general Tailscale behavior.
|Option|Type|Default|Description|
|`locked`|Boolean|`true`|Set to `true` to prevent configuration changes by using the [`tailscale set`](/docs/reference/tailscale-cli#set) command, ensuring the configuration stays consistent with the file. Set to `false` to allow runtime modifications.|
|`enabled`|Boolean|`true`|Specify whether Tailscale should be running. Setting this to `false` has the same effect as running `tailscale down`.|
|`hostname`|String|OS hostname|Specify the hostname for the device as displayed in the admin console and used for [MagicDNS](/docs/features/magicdns).|
|`operatorUser`|String|None|Specify a local Unix username allowed to operate `tailscaled` without root privileges.|
### [DNS and routing](#dns-and-routing)
The following configuration options are options for DNS and subnet routing.
|Option|Type|Default|Description|
|`acceptDNS`|Boolean|`true`|Set to `false` to disable using the [DNS configuration](/docs/reference/dns-in-tailscale) from the tailnet.|
|`acceptRoutes`|Boolean|[Platform-dependent](#acceptroutes-defaults)|Set to `true` to accept [subnet routes](/docs/features/subnet-routers) advertised by other devices.|
|`advertiseRoutes`|Array of Strings|None|An array of [subnet routes](/docs/features/subnet-routers) to advertise to the tailnet. Use the format `["\<CIDR\>"]`.|
|`disableSNAT`|Boolean|`false`|Set to `true` to disable source NAT for traffic to advertised subnet routes.|
Platform-dependent default values for `acceptRoutes`:
* Defaults to `true` for Windows, iOS, Android, the macOS App Store variant, and the macOS Standalone variant.
* Defaults to `false` Unix platforms (Linux, BSD, and the macOS open source variant).
### [Exit nodes](#exit-nodes)
The following configuration options are options for [exit nodes](/docs/features/exit-nodes).
|Option|Type|Default|Description|
|`exitNode`|String|None|[Exit node](/docs/features/exit-nodes) to use. You can use an IP address, stable node ID, or MagicDNS base name. It accepts any value supported by the [`tailscale set --exit-node=\<identifier\>`](/docs/reference/tailscale-cli#set) command.|
|`allowLANWhileUsingExitNode`|Boolean|`false`|Set to `true` to permit access to the local network (LAN) while routing traffic through an exit node.|
You can find the stable node ID of a device in the [Machines](https://login.tailscale.com/admin/machines) of the admin console.
### [Features](#features)
The following configuration options are for enabling or disabling specific Tailscale features.
|Option|Type|Default|Description|
|`runSSHServer`|Boolean|`false`|Set to `true` to enable [Tailscale SSH](/docs/features/tailscale-ssh) server.|
|`runWebClient`|Boolean|`false`|Set to `true` to enable the Tailscale [web client interface](/docs/features/client/device-web-interface).|
|`shieldsUp`|Boolean|`false`|Set to `true` to block all incoming connections from other tailnet regardless of access control policies. You might consider this if you only want to permit outbound connections. This is similar to how you can configure [incoming connections in the Tailscale client](/docs/features/client/manage-preferences#allow-incoming-connections).|
|`postureChecking`|Boolean|`false`|Set to `true` to enable [device posture](/docs/features/device-posture) data collection.|
|`advertiseServices`|Array of Strings|None|Specify [services](/docs/features/services) to advertise (for example, `["svc:my-api"]`). Used with Tailscale Service virtual IP addresses for high availability.|
|`appConnector`|Object|None|[App connector](/docs/features/app-connectors) configuration. Set `{"advertise": true}` to run as an [app connector](/docs/features/app-connectors/how-to/setup).|
### [Auto-update](#auto-update)
The following configuration options are options for automatic updates.
|Option|Type|Default|Description|
|`autoUpdate`|Object|None|Auto-update preferences. Set to `check` to enable checking for updates. Set to `apply` to automatically apply updates. For example: `{"check": true, "apply": false}`.|
### [Linux-specific options](#linux-specific-options)
Linux-specific configuration options.
|Option|Type|Default|Description|
|`netfilterMode`|String|`"on"`|Set the firewall management mode: `"on"`, `"nodivert"`, or `"off"`. This specifies how `tailscaled` manages `iptables`/`nftables` rules on Linux.|
|`noStatefulFiltering`|Boolean|`false`|Set to `true` to disable stateful packet filtering for subnet routers and exit nodes.|
#### [`netfilterMode` values](#netfiltermode-values)
* `on`: Normal operation. In this mode, `tailscaled` creates `iptables`/`nftables` chains and adds a rule to start of the relevant standard chains that jumps into them. For example, it inserts a jump to `ts-input` at the start of the `filter` table `INPUT` chain, to `ts-forward` from `FORWARD`, to `ts-output` from `OUTPUT`, and so on. It also adds a `ts-postrouting` in the `nat` table.
* `nodivert`: No divert mode. In this mode, `tailscaled` creates `iptables`/`nftables` chains as usual, but does not send traffic to them. For the system to work correctly, you must configure those rules manually (for example, add a jump from `INPUT` to `ts-input`). This makes it possible to have other rules take effect before the Tailscale rules. Using `nodivert` also means that `tailscaled` won't rewrite the jumps occasionally because this would move the Tailscale rules back to the start.
* `off`: In this mode, `tailscaled` does not make any changes to `iptables`/`nftables`. There usually isn't a good reason to use this mode.
### [Advanced options](#advanced-options)
The following configuration options are options for advanced use cases, such as customizing the Kubernetes Operators.
|Option|Type|Default|Description|
|`staticEndpoints`|Array of Strings|None|Specify an array of additional [WireGuard](/docs/concepts/wireguard) endpoints to advertise alongside discovered endpoints. Use the format `["\<address\>:\<port\>"]`. Refer to [Kubernetes Operator customization](/docs/features/kubernetes-operator/how-to/customize#static-endpoints) for more information.|
## [Schema reference](#schema-reference)
The following schema shows all available options in a single block. Remove all comments before using this in a JSON file, or use [HuJSON](https://github.com/tailscale/hujson) format to keep them.
```
`{
"version": "alpha0", // Required.
"serverURL": "https://controlplane.tailscale.com", // Optional.
"authKey": "\<auth-key\>", // Optional.
"locked": true, // Optional.
"enabled": true, // Optional.
"hostname": "\<hostname\>", // Optional. Default: OS hostname.
"operatorUser": "\<username\>", // Optional.
"acceptDNS": \<true|false\>, // Optional. Default: platform-dependent.
"acceptRoutes": \<true|false\>, // Optional. Default: platform-dependent.
"advertiseRoutes": ["\<CIDR\>"], // Optional.
"disableSNAT": false, // Optional.
"exitNode": "\<IP-address|stable-node-ID|MagicDNS-name\>", // Optional.
"allowLANWhileUsingExitNode": false, // Optional.
"runSSHServer": false, // Optional.
"runWebClient": false, // Optional.
"shieldsUp": false, // Optional.
"postureChecking": false, // Optional.
"advertiseServices": ["svc:\<service-name\>"], // Optional.
"appConnector": {"advertise": \<true|false\>}, // Optional.
"autoUpdate": {"check": \<true|false\>, "apply": \<true|false\>}, // Optional.
"netfilterMode": "on", // Optional (Linux-specific). Values: "on", "nodivert", "off".
"noStatefulFiltering": false, // Optional.
"staticEndpoints": ["\<address\>:\<port\>"], // Optional.
}
`
```
## [Read configuration from cloud metadata](#read-configuration-from-cloud-metadata)
Instead of using a configuration file, you can read configuration options directly from cloud instance metadata.
Cloud metadata support is limited to Amazon EC2. Support for Google Cloud Platform (GCP), Azure, and [cloud-init](/docs/install/with-cloud-init) is planned for future releases.
To read configuration from an [Amazon EC2](https://docs.aws.amazon.com/ec2/) instance, store the configuration in the instance's user data and use the special path `vm:user-data`:
```
`tailscaled --config=vm:user-data
`
```
This tells the `tailscaled` daemon to read the configuration from the EC2 instance metadata service at `http://\<ip-address\>/latest/user-data`.
## [Reload configuration changes](#reload-configuration-changes)
The Tailscale daemon reads the configuration file one time at startup and does not automatically monitor it for changes. To apply configuration changes, you have the following options:
### [Manually reload the configuration](#manually-reload-the-configuration)
Use the `tailscale debug reload-config` command to reload the configuration file without restarting the daemon:
```
`tailscale debug reload-config
`
```
This command calls the LocalAPI endpoint `/localapi/v0/reload-config` and applies any changes from the configuration file.
### [Restart the daemon](#restart-the-daemon)
Restart `tailscaled` to reload the configuration:
```
`sudo systemctl restart tailscaled
`
```
Automatic configuration file watching for standalone `tailscaled` deployments is not currently supported. If you need this functionality outside of Kubernetes, consider using a file watcher that calls `tailscale debug reload-config` when it detects changes.
## [Limitations](#limitations)
You can use configuration files on Linux and other Unix-like systems where you run `tailscaled` directly. For macOS, refer to [tailscaled on macOS](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS). iOS and Android do not support configuration files.
On this page
* [Basic usage](#basic-usage)
* [Configuration options](#configuration-options)
* [Required options](#required-options)
* [Authentication](#authentication)
* [General settings](#general-settings)
* [DNS and routing](#dns-and-routing)
* [Exit nodes](#exit-nodes)
* [Features](#features)
* [Auto-update](#auto-update)
* [Linux-specific options](#linux-specific-options)
* [netfilterMode values](#netfiltermode-values)
* [Advanced options](#advanced-options)
* [Schema reference](#schema-reference)
* [Read configuration from cloud metadata](#read-configuration-from-cloud-metadata)
* [Reload configuration changes](#reload-configuration-changes)
* [Manually reload the configuration](#manually-reload-the-configuration)
* [Restart the daemon](#restart-the-daemon)
* [Limitations](#limitations)
Scroll to top