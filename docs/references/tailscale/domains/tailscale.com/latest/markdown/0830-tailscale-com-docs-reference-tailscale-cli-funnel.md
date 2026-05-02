tailscale funnel command · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tailscale funnel command
Last validated: Jan 26, 2026
The CLI commands for both Tailscale Funnel and Tailscale Serve have changed in the 1.52 version of the Tailscale client. If you've used Funnel or Serve in previous versions, we recommend reviewing the CLI documentation.
`tailscale funnel` lets you share a local service over the internet. You can also choose to use [Tailscale Serve](/docs/features/tailscale-serve) using the [`tailscale serve`](/docs/reference/tailscale-cli/serve) command to limit sharing within your tailnet.
```
`tailscale funnel [flags] \<target\>
`
```
Subcommands:
* [`status`](#get-the-status) Gets the status
* [`reset`](#reset-tailscale-funnel) Resets the configuration
To explore various use cases and examples, refer to [Tailscale Funnel examples](/docs/reference/examples/funnel).
## [Funnel command flags](#funnel-command-flags)
Available flags:
* `--bg` Determines whether the command should run as a background process.
* `--https=\<port\>` Expose an HTTPS server at the specified port (default).
* `--proxy-protocol=\<version\>` PROXY protocol version (1 or 2) for TCP forwarding.
* `--set-path=\<path\>` Appends the specified path to the base URL for accessing the underlying service.
* `--tcp=\<port\>` Expose a TCP forwarder to forward TCP packets at the specified port.
* `--tls-terminated-tcp=\<port\>` Expose a TCP forwarder to forward TLS-terminated TCP packets at the specified port.
* `--yes` Update without interactive prompts.
The `tailscale funnel` command accepts a target that can be a file, directory, text, or most commonly, the location to a service running on the local machine. The location to the local service can be expressed as a port number (for example, `3000`), a partial URL (for example, `localhost:3000`), or a full URL including a path (for example, `tls-terminated-tcp://localhost:3000/foo`).
## [Use HTTPS and HTTP servers](#use-https-and-http-servers)
```
`tailscale funnel --https=\<port\> \<target\> [off]
`
```
The `funnel` offers an HTTPS server that has a few modes: a reverse proxy, a file server, and a static text server. HTTPS traffic is secured using an automatically provisioned TLS certificate. By default, termination is done by your node's Tailscale daemon itself.
* `--https=\<port\>` Specifies the port to listen on. For Funnel, you must use one of the allowed ports: `443`, `8443`, or `10000`.
* `--set-path` Is a slash-separated URL path. The root-level mount point would simply be `/` and would be matched by making a request to `https://my-node.example.ts.net/`, for example. For more information on how these path patterns are matched, refer to the Go [ServeMux](https://pkg.go.dev/net/http#ServeMux) documentation. Our mount points behave similarly.
* `\<target\>` Funnel provides 4 options for serving content: an HTTP reverse proxy, a file, a directory, and static text. A reverse proxy lets you forward requests to a local HTTP web server. Providing a local file path provides the ability to serve files or directories of files. Serving static text is available mostly for debugging purposes and serves a static response.
* **Reverse proxy**
To serve as a reverse proxy to a local backend, provide the location of the `\<target\>` argument. The location to the local service can be expressed as a port number (for example, `3000`), a partial URL (for example, `localhost:3000`), or a full URL including a path (for example, `tls-terminated-tcp://localhost:3000/foo`). Note that only `http://127.0.0.1` is currently supported for proxies.
Example: `tailscale funnel localhost:3000`
* **File server**
Provide a full, absolute path, to the file or directory of files you wish to serve. If a directory is specified, this will render a simple directory listing with links to files and subdirectories.
Example: `tailscale funnel /home/alice/blog/index.html`
Due to macOS app sandbox limitations, this option is only available when using Tailscale's [open source variant](/docs/concepts/macos-variants). If you've installed Tailscale on macOS through the Mac App Store or as a Standalone variant system extension, you can use Funnel to share ports but not files or directories.
* **Static text server**
Specifying `text:\<value\>` as a `\<target\>` configures a simple static plain-text server.
Example: `tailscale funnel text:"Hello, world!"`
## [Use the PROXY protocol](#use-the-proxy-protocol)
```
`tailscale funnel --proxy-protocol=\<version\> \<target\>
`
```
For most situations, users will likely use version `2`.
The [PROXY protocol](https://www.haproxy.com/blog/use-the-proxy-protocol-to-preserve-a-clients-ip-address) is a minimal network protocol that preserves information about a proxied connection (typically, the source IP address) through a proxy or load balancer and to the backend target. This lets the service that you're exposing with Funnel determine the original IP address and port for connecting clients.
For example:
```
`tailscale funnel --proxy-protocol=2 --tls-terminated-tcp=443 tcp://127.0.0.1:9899
`
```
This command will return information similar to the following:
```
`Available on the internet:
|-- tcp://funnel-test.example.ts.net:443 (TLS terminated, PROXY protocol v2)
|-- tcp://100.101.102.103:443
|-- tcp://[fd7a:115c:a1e0::1111:2222]:443
|--\> tcp://127.0.0.1:9899
Press Ctrl+C to exit.
`
```
The backend (running on `localhost:9899`) then gets the original source IP and port through the PROXY protocol.
## [Use a TCP forwarder](#use-a-tcp-forwarder)
```
`tailscale funnel --tcp=\<port\> tcp://localhost:\<local-port\> [off]
tailscale funnel --tls-terminated-tcp=\<port\> tcp://localhost:\<local-port\> [off]
`
```
The `funnel` command offers a TCP forwarder to forward TLS-terminated TCP packets to a local TCP server like Caddy or other TCP-based protocols such as SSH or RDP. By default, the TCP forwarder forwards raw packets.
* `--tcp=\<port\>` Sets up a raw TCP forwarder listening on the specified port. For Funnel, you must use one of the allowed ports: `443`, `8443`, or `10000`.
* `--tls-terminated-tcp=\<port\>` Sets up a TLS-terminated TCP forwarder listening on the specified port. For Funnel, you must use one of the allowed ports: `443`, `8443`, or `10000`.
## [Use valid certificates](#use-valid-certificates)
```
`tailscale funnel \<https:target\>
`
```
If you have a valid certificate, use `https` in the `\<target\>` argument.
Example: `tailscale funnel https://localhost:8443`
## [Ignore invalid and self-signed certificate checks](#ignore-invalid-and-self-signed-certificate-checks)
```
`tailscale funnel \<https+insecure:target\>
`
```
If you run a local web server using HTTPS with a self-signed or otherwise invalid certificate, you can specify `https+insecure` as a special pseudo-protocol for your `tailscale funnel` commands.
Example: `tailscale funnel https+insecure://localhost:8443`
## [Get the status](#get-the-status)
```
`tailscale funnel status [--json]
`
```
To get the status of your servers, you can use the `status` subcommand. This will list all the servers that are currently running on your node.
* `--json` If you wish to get the status in JSON format, you can provide the `--json` argument.
Example: `tailscale funnel status --json`
## [Reset Tailscale Funnel](#reset-tailscale-funnel)
```
`tailscale funnel reset
`
```
To clear the current `tailscale funnel` configuration, use the `reset` subcommand.
## [Turn Tailscale Funnel off](#turn-tailscale-funnel-off)
* `[off]` To turn off a `tailscale funnel` command, you can add `off` to the end of the command you used to turn it on. This will remove the server from the list of active servers. In `off` commands, the `\<target\>` argument is optional, but all original flags are required.
If this command turned on a server:
```
`tailscale funnel --https=443 /home/alice/blog/index.html
`
```
You can turn it off by running:
```
`tailscale funnel --https=443 /home/alice/blog/index.html off
`
```
You can omit the `\<target\>` argument, so these 2 commands are equivalent:
```
`tailscale funnel --https=443 --set-path=/foo /home/alice/blog/index.html off
tailscale funnel --https=443 --set-path=/foo off
`
```
## [Effects of rebooting and restarting](#effects-of-rebooting-and-restarting)
If you use the `tailscale funnel` command with the [`-bg`](#funnel-command-flags) flag, it runs persistently in the background until you [turn it off](#turn-tailscale-funnel-off). When you reboot the device or restart Tailscale from the command line using [`tailscale down`](/docs/reference/tailscale-cli#down) and [`tailscale up`](/docs/reference/tailscale-cli#up), Funnel will automatically resume sharing.
If you use the `tailscale funnel` command without the `-bg` flag, then reboot the device or restart Tailscale from the command line, you must restart Funnel manually to resume sharing.
On this page
* [Funnel command flags](#funnel-command-flags)
* [Use HTTPS and HTTP servers](#use-https-and-http-servers)
* [Use the PROXY protocol](#use-the-proxy-protocol)
* [Use a TCP forwarder](#use-a-tcp-forwarder)
* [Use valid certificates](#use-valid-certificates)
* [Ignore invalid and self-signed certificate checks](#ignore-invalid-and-self-signed-certificate-checks)
* [Get the status](#get-the-status)
* [Reset Tailscale Funnel](#reset-tailscale-funnel)
* [Turn Tailscale Funnel off](#turn-tailscale-funnel-off)
* [Effects of rebooting and restarting](#effects-of-rebooting-and-restarting)
Scroll to top