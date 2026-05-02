tailscaled daemon · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tailscaled daemon
Last validated: Jan 5, 2026
The Tailscale software that runs on your devices is split across
several binaries and processes.
## [Platform differences](#platform-differences)
On most platforms, the [CLI](/docs/reference/tailscale-cli) is a binary named
`tailscale` (or `tailscale.exe`) and the more privileged daemon that
does all the network handling is called `tailscaled` (or
`tailscaled.exe`). Note the final `d` for "daemon". The majority of the
CLI commands accessible by using the `tailscale` command require that the daemon
be running on the machine.
There are [three ways to run Tailscale on macOS](/docs/concepts/macos-variants).
Only the third non-GUI way contains the typical `tailscale` vs
`tailscaled` split. The two GUI variants bundle all components into
one binary that macOS loads in different contexts: the GUI, the daemon
(named either `IPNExtension` for the App Store variant or
`io.tailscale.ipn.macsys.network-extension` for the zip file
download), and the CLI (which is the same binary as the GUI, but goes
into CLI mode when run from a terminal). The daemons for the two macOS
GUI variants, despite having different names, are virtually
identical. But they're not technically `tailscaled`, the subject of this topic, despite sharing the majority of the same code. Notably,
any `tailscaled` behavior that involves changing flags to `tailscaled`
is not always available on the macOS GUI variants.
## [Where does tailscaled run?](#where-does-tailscaled-run)
On Linux and other Unix-like platforms, `tailscaled` typically runs as a
systemd service, or whatever your distro or OS's init system is.
On macOS, `tailscaled` (when not using a GUI build, as mentioned
above) runs as a `launchd` service.
On Windows, `tailscaled` runs as a Windows service named "Tailscale".
## [Stopping and starting tailscaled](#stopping-and-starting-tailscaled)
You should not normally need to manually stop and start the
`tailscaled` process. It should go into an idle state when you use the
CLI command `tailscale down`. If you're debugging something or
changing flags, though, the instructions vary by platform.
On systemd, you can run `sudo systemctl $VERB tailscaled`, where the verb is one of `stop`, `start`, `restart`, or the like.
On Windows, you can run `net stop Tailscale` or `net start Tailscale`,
or use the Windows Service Manager.
## [Getting logs from tailscaled](#getting-logs-from-tailscaled)
A portable way to attach to the daemon and stream its logs is to use
the CLI and run `tailscale debug daemon-logs`. That does not currently support
getting any retroactive logs, however.
On systemd, you can use `journalctl -u tailscaled --since="1 hour ago"`.
On Windows, refer to `C:\\ProgramData\\Tailscale\\Logs`.
On macOS, for the GUI builds, use `Console.app` and search for
`Tailscale` or `IPNExtension`.
## [Flags to tailscaled](#flags-to-tailscaled)
`tailscaled` has a number of flags (command-line arguments) that do
various things. Some are not stable interfaces and meant primarily for
debugging. Some of the more frequently used and stable ones are:
* `--tun=NAME` to specify the TUN device name, or `userspace-networking` as a magic value to not use kernel support and do everything in-process.
* `--port=N` to set the UDP port to listen on for peer-to-peer traffic; 0 means to auto-select.
* `--verbose=N`, where N defaults to 0. Values 1 or higher are increasingly verbose.
* `--debug=localhost:8080`, to run a debug HTTP server serving paths such as `/debug/pprof`, `/debug/metrics`, `/debug/ipn`, or `/debug/magicsock`. The exact details of what's accessible over the debug server is subject to change over time.
* `--no-logs-no-support` disables telemetry and opts you out of getting any support that would then require such telemetry for debugging
To control where and how state (including preferences and keys) is stored, use:
* `--statedir=` for a directory on disk where to store config, keys,
Taildrop files, and other state.
* `--state=` to either a `/path/to/file`, `kube:\<secret-name\>` to use
Kubernetes secrets, `arn:aws:ssm:...` to store state in AWS SSM, or
`mem:` to not store state and register as an ephemeral node. By default, if not
provided, the state is stored in `\<statedir\>/tailscaled.state`.
* `--encrypt-state` to optionally encrypt the state file using the local TPM
device on Linux.
There are also two flags to run proxies:
* `--socks5-server=[host]:port`, to run a SOCK5 server, making your tailnet accessible by using SOCKS5
* `--outbound-http-proxy-listen=[host]:port`, to run an HTTP proxy server, making your tailnet accessible by using HTTP.
The SOCK5 and HTTP proxy may have the same value in which case only
one port is opened but will automatically vary which protocol it
speaks based on what the client says first.
The following flags take an action and exit:
* `--version` prints version info and exists
* `--cleanup` cleans up system state from a previous run
## [Setting flags](#setting-flags)
Setting `tailscaled` flags varies by platform.
On Linux, you can modify the `FLAGS` in `/etc/default/tailscaled`,
which the systemd unit definition will include.
## [Environment variables](#environment-variables)
### [Windows](#windows)
You can set some environment variables on Windows by doing the following:
* Create a `tailscaled-env.txt` file in `C:\\ProgramData\\Tailscale`.
* In the `tailscaled-env.txt` file you can set `PORT=N` (for example, to change the default UDP listen port).
* Save the file and run `net stop Tailscale`, `net start Tailscale` to apply the changes.
On this page
* [Platform differences](#platform-differences)
* [Where does tailscaled run?](#where-does-tailscaled-run)
* [Stopping and starting tailscaled](#stopping-and-starting-tailscaled)
* [Getting logs from tailscaled](#getting-logs-from-tailscaled)
* [Flags to tailscaled](#flags-to-tailscaled)
* [Setting flags](#setting-flags)
* [Environment variables](#environment-variables)
* [Windows](#windows)
Scroll to top