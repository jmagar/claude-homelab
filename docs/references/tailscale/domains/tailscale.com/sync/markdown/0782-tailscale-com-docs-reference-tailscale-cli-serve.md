tailscale serve command · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tailscale serve command
Last validated: Jan 26, 2026
The CLI commands for both Tailscale Funnel and Tailscale Serve have changed in the 1.52 version of the Tailscale client. If you've used Funnel or Serve in previous versions, we recommend reviewing the CLI documentation.
`tailscale serve` lets you share a local service securely within your Tailscale network (known as a tailnet).
```
`tailscale serve [flags] \<target\>
`
```
You can also choose to use [Tailscale Funnel](/docs/features/tailscale-funnel) with the [`tailscale funnel`](/docs/reference/tailscale-cli/funnel) command to expose your service publicly, open to the entire internet.
Subcommands:
* [`status`](#get-the-status) Gets the status
* [`reset`](#reset-tailscale-serve) Resets the configuration
* [`drain`](#drain) Drain a [Service](/docs/features/tailscale-services)
* [`advertise`](#advertise) Advertise a [Service](/docs/features/tailscale-services)
* [`get-config`](#get-service-config) Get [Service](/docs/features/tailscale-services) configuration
* [`set-config`](#set-service-config) Set [Service](/docs/features/tailscale-services) configuration
For various use cases and examples, refer to [Tailscale Serve examples](/docs/reference/examples/serve).
## [Serve command flags](#serve-command-flags)
Available flags:
* `--accept-app-caps=\<capability-1,capability-2,...\>` [App capabilities](/docs/features/access-control/grants/grants-app-capabilities) to forward to the server (specify multiple capabilities with a comma-separated list).
* `--bg` Determines whether the command should run as a background process.
* `--http=\<port\>` Expose an HTTP server at the specified port.
* `--https=\<port\>` Expose an HTTPS server at the specified port (default).
* `--proxy-protocol=\<version\>` PROXY protocol version (1 or 2) for TCP forwarding.
* `--service=\<virtual-ip\>` Serve for a [Tailscale Service](/docs/features/tailscale-services) with a distinct virtual IP instead of the device's IP address.
* `--set-path=\<path\>` Appends the specified path to the base URL for accessing the underlying service.
* `--tcp=\<port\>` Expose a TCP forwarder to forward TCP packets at the specified port.
* `--tls-terminated-tcp=\<port\>` Expose a TCP forwarder to forward TLS-terminated TCP packets at the specified port.
* `--tun` Configure a [Layer 3 Service](/docs/features/tailscale-services#layer-3-endpoints-network-layer) to forward all traffic to the local machine (default false); only supported for Services.
* `--yes` Update without interactive prompts.
The `tailscale serve` command accepts a target that can be a file, directory, text, or most commonly, the location to a service running on the local device. You can write the location to the local service as a port number (for example, `3000`), a partial URL (for example, `localhost:3000`), or a full URL including a path (for example, `tcp://localhost:3000/foo`, `https+insecure://localhost:3000/foo`).
## [Use HTTPS and HTTP servers](#use-https-and-http-servers)
```
`tailscale serve --https=\<port\> \<target\> [off]
tailscale serve --http=\<port\> \<target\> [off]
`
```
The `serve` offers an HTTPS and HTTP server that has a few modes: a reverse proxy, a file server, and a static text server. HTTPS traffic uses an automatically provisioned TLS certificate. By default, the device's Tailscale daemon terminates the HTTPS connection.
* `--https=\<port\>` or `http=\<port\>` Specifies the port to listen on
* `--set-path` Is a slash-separated URL path. The root-level mount point would be `/` and would be matched by making a request to `https://my-node.example.ts.net/`, for example. For more information on how these path patterns are matched, refer to the Go [ServeMux](https://pkg.go.dev/net/http#ServeMux) documentation. Our mount points behave similarly.
* `\<target\>` Serve provides 4 options for serving content: an HTTP reverse proxy, a file, a directory, and static text. A reverse proxy lets you forward requests to a local HTTP web server. Providing a local file path provides the ability to serve files or directories of files. Serving static text is available mostly for debugging purposes and serves a static response.
* **Reverse proxy**
To serve as a reverse proxy to a local backend, provide the location of the `\<target\>` argument. You can write the location to the local service as a port number (for example, `3000`), a partial URL (for example, `localhost:3000`), or a full URL including a path (for example, `tcp://localhost:3000/foo`, `https+insecure://localhost:3000/foo`). Note that only `http://127.0.0.1` is supported for proxies.
Example: `tailscale serve localhost:3000`
Or, to serve over HTTP:
Example: `tailscale serve --http=80 localhost:3000`
HTTP servers are accessible using short MagicDNS names like `http://my-node`
* **File server**
Provide a full, absolute path to the file or directory of files you wish to serve. If you specify a directory, this renders a directory listing with links to files and subdirectories.
Example: `tailscale serve /home/alice/blog/index.html`
Due to macOS app sandbox limitations, this option only works when using Tailscale's [open source variant](/docs/concepts/macos-variants). If you've installed Tailscale on macOS through the Mac App Store or as a Standalone variant system extension, you can use Serve to share ports but not files or directories.
* **Static text server**
Specifying `text:\<value\>` as a `\<target\>` configures a static plain-text server.
Example: `tailscale serve text:"Hello, world!"`
## [Use the PROXY protocol](#use-the-proxy-protocol)
```
`tailscale serve --proxy-protocol=\<version\> \<target\>
`
```
For most situations, users will likely use version `2`.
The [PROXY protocol](https://www.haproxy.com/blog/use-the-proxy-protocol-to-preserve-a-clients-ip-address) is a minimal network protocol that preserves information about a proxied connection (typically, the source IP address) through a proxy or load balancer and to the backend target. This lets the service that you're exposing with Serve determine the original IP address and port for connecting clients.
For example:
```
`tailscale serve --proxy-protocol=2 --tls-terminated-tcp=443 tcp://127.0.0.1:9899
`
```
This command will return information similar to the following:
```
`Available within your tailnet:
|-- tcp://serve-test.example.ts.net:443 (TLS terminated, PROXY protocol v2)
|-- tcp://100.101.102.103:443
|-- tcp://[fd7a:115c:a1e0::1111:2222]:443
|--\> tcp://127.0.0.1:9899
Press Ctrl+C to exit.
`
```
The backend (running on `localhost:9899`) then gets the original source IP and port through the PROXY protocol.
## [Use a TCP forwarder](#use-a-tcp-forwarder)
```
`tailscale serve --tcp=\<port\> tcp://localhost:\<local-port\> [off]
tailscale serve --tls-terminated-tcp=\<port\> tcp://localhost:\<local-port\> [off]
`
```
The `serve` command offers a TCP forwarder that you can use to forward both raw TCP packets and TLS-terminated TCP packets to a local TCP server like Caddy or other TCP-based protocols such as SSH or RDP. By default, the TCP forwarder forwards raw packets.
* `--tcp=\<port\>` Sets up a raw TCP forwarder listening on the specified port. You can use any valid port number.
* `--tls-terminated-tcp=\<port\>` Sets up a TLS-terminated TCP forwarder listening on the specified port. You can use any valid port number.
* `tcp://localhost:\<local-port\>` Specifies the local port to forward packets to.
## [Use a valid certificate](#use-a-valid-certificate)
```
`tailscale serve \<https:target\>
`
```
If you have a valid certificate, use `https` in the `\<target\>` argument.
Example: `tailscale serve https://localhost:8443`
## [Ignore invalid and self-signed certificate checks](#ignore-invalid-and-self-signed-certificate-checks)
```
`tailscale serve \<https+insecure:target\>
`
```
If you run a local web server using HTTPS with a self-signed or otherwise invalid certificate, you can specify `https+insecure` as a special pseudo-protocol for your `tailscale serve` commands.
Example: `tailscale serve https+insecure://localhost:8443`
## [Get the status](#get-the-status)
```
`tailscale serve status [--json]
`
```
To get the status of your servers, you can use the `status` subcommand. This lists all the servers that are currently running on your device.
* `--json` If you want to get the status in JSON format, you can provide the `--json` argument.
Example: `tailscale serve status --json`
Currently, `tailscale serve status` and `tailscale serve status --json` return different information. If you are seeking a list of Services, you can use the following command:
```
`tailscale serve get-config --all
`
```
For more information, refer to our [GitHub issue](https://github.com/tailscale/tailscale/issues/18289).
## [Reset Tailscale Serve](#reset-tailscale-serve)
```
`tailscale serve reset
`
```
To clear out the current `tailscale serve` configuration, use the `reset` subcommand.
## [Disable Tailscale Serve](#disable-tailscale-serve)
* `[off]` To turn off a `tailscale serve` command, you can add `off` to the end of the command you used to turn it on. This will remove the server from the list of active servers. In `off` commands, the `\<target\>` argument is optional, but all original flags are required.
If this command turned on a server:
```
`tailscale serve --https=443 /home/alice/blog/index.html
`
```
You can turn it off by running:
```
`tailscale serve --https=443 /home/alice/blog/index.html off
`
```
You can omit the `\<target\>` argument, so these 2 commands are equivalent:
```
`tailscale serve --https=443 --set-path=/foo /home/alice/blog/index.html off
tailscale serve --https=443 --set-path=/foo off
`
```
## [Get service config](#get-service-config)
```
`tailscale serve get-config \<file\> [flags]
`
```
Get the configuration for [Services](/docs/features/tailscale-services) that this node is currently hosting in a format that can later be provided to `set-config`. This can be used to declare the configuration for a service host.
Available flags:
* `--all` Read configuration from all services.
* `--service=\<name\>` Read configuration from a specific service.
## [Set service config](#set-service-config)
```
`tailscale serve set-config \<file\> [flags]
`
```
Read the provided [configuration file](/docs/reference/tailscale-services-configuration-file) and use it to declare the configuration for either a single [Service](/docs/features/tailscale-services) or for all Services that this node is hosting.
* `--all` Apply configuration to all services.
* `--service=\<name\>` Apply configuration to a specific service.
## [Drain](#drain)
```
`tailscale serve drain \<service\>
`
```
Drain a [Service](/docs/features/tailscale-services) from the current node.
Use this command to gracefully remove a Service from the current node without disrupting existing connections. No new connections will be accepted, but existing connections will continue to work until they are closed.
`\<service\>` should be a Service name. For example: `svc:my-service`.
## [Advertise](#advertise)
```
`tailscale serve advertise \<service\>
`
```
Advertise this node as a [Service](/docs/features/tailscale-services) host for the tailnet.
This command can be useful to bring a Service host back online after it has been [drained](#drain). This is not needed if you are using `tailscale serve` to initialize a Service.
`\<service\>` should be a Service name. For example: `svc:my-service`.
Available flags:
* `--service=\<name\>` Apply config to a particular service.
## [Effects of rebooting and restarting](#effects-of-rebooting-and-restarting)
If you use the `tailscale serve` command with the [`-bg`](#serve-command-flags) flag, it runs persistently in the background until you [disable](#disable-tailscale-serve) it. When you reboot the device or restart Tailscale from the command line using [`tailscale down`](/docs/reference/tailscale-cli#down) and [`tailscale up`](/docs/reference/tailscale-cli#up), Serve automatically resumes sharing.
If you use the `tailscale serve` command without the `-bg` flag, then reboot the device or restart Tailscale from the command line, you must restart Serve manually to resume sharing.
When you use the `tailscale serve` command with [Tailscale Services](/docs/features/tailscale-services), it runs in the background by default.
On this page
* [Serve command flags](#serve-command-flags)
* [Use HTTPS and HTTP servers](#use-https-and-http-servers)
* [Use the PROXY protocol](#use-the-proxy-protocol)
* [Use a TCP forwarder](#use-a-tcp-forwarder)
* [Use a valid certificate](#use-a-valid-certificate)
* [Ignore invalid and self-signed certificate checks](#ignore-invalid-and-self-signed-certificate-checks)
* [Get the status](#get-the-status)
* [Reset Tailscale Serve](#reset-tailscale-serve)
* [Disable Tailscale Serve](#disable-tailscale-serve)
* [Get service config](#get-service-config)
* [Set service config](#set-service-config)
* [Drain](#drain)
* [Advertise](#advertise)
* [Effects of rebooting and restarting](#effects-of-rebooting-and-restarting)
Scroll to top