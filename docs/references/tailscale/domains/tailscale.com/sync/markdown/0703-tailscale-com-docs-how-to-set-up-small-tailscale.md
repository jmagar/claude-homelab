Smaller binaries for embedded devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Smaller binaries for embedded devices
Last validated: Jan 5, 2026
Tailscale provides downloads for a variety of operating systems and
architectures on our [downloads page](/download). However, there are cases
where you may want to build an "extra-small" Tailscale binary—one that
takes up a minimal amount of disk space. One common use case is building for an
embedded device like an OpenWrt router.
## [Prerequisites](#prerequisites)
Before you begin this guide, you'll need to have a Go development environment
already set up and working.
## [Step 1: Building Tailscale](#step-1-building-tailscale)
First, you can build a version of Tailscale that embeds both the client (the
`tailscale` binary) and the daemon (the `tailscaled` binary) into a single
binary. This is similar to how tools like `busybox` work, where the behavior
of the binary depends on how it's called (specifically, the value of
`argv[0]`). Essentially: if the file on-disk is named `tailscale`, then the
binary will behave like the `tailscale` binary, and if it's named `tailscaled`,
then it'll behave like `tailscaled`.
In the [Tailscale repository](https://github.com/tailscale/tailscale):
```
`go build -o tailscale.combined -tags ts\_include\_cli ./cmd/tailscaled
`
```
Use the `du` (disk usage) command to check the compiled binary size:
```
`du -hs tailscale.combined
`
```
The actual size of the output binary will depend on the version of Tailscale
and the operating system and architecture it's being built for. Exact sizes are
only for illustrative purposes.
By creating symlinks to the combined binary, you can run it as both
the daemon and the CLI:
```
`ln -s tailscale.combined tailscale
ln -s tailscale.combined tailscaled
`
```
Test your `tailscale` symlink with the `--help` flag:
```
`./tailscale --help
`
```
This command should return the help information:
```
`USAGE
tailscale [flags] \<subcommand\> [command flags]
For help on subcommands, add --help after: "tailscale status --help".
# ... omitted ...
`
```
Test your `tailscaled` symlink with the `--help` flag:
```
`./tailscaled --help
`
```
This command should return the help information:
```
`Usage of ./tailscaled:
-bird-socket string
path of the bird unix socket
-cleanup
clean up system state and exit
# ... omitted ...
`
```
## [Step 2: Building a smaller Tailscale binary](#step-2-building-a-smaller-tailscale-binary)
In addition to combining both the Tailscale client and daemon into the same
binary, you can also use the `--extra-small` flag to omit things like debug information and lesser
used features from the built binary.
```
`build\_dist.sh --extra-small
`
```
## [Step 3: Compressing Tailscale](#step-3-compressing-tailscale)
In cases where disk space is a premium, one of the more effective options is to
use compression. There's a class of tools called "packers", which compress a
binary on-disk and restore the original uncompressed version of the binary
when it is run.
**Using a packer can be dangerous!** These tools fundamentally change how a
binary interacts with the operating system in ways that can reduce that
binary's security. It's beyond the scope of this guide to go into the full
details, but as a specific example, most packers require that [W^X protection](https://en.wikipedia.org/wiki/W^X) be turned off or an executable temporary directory to
function.
Also, some antivirus software will treat packed binaries as malicious, since this
technique is often used by malware to obfuscate what it's doing.
In the case where it's necessary, though, the resulting space savings can be
impressive. Perhaps the most well-known packer is [UPX](https://upx.github.io), and it can be
used to compress the Tailscale combined binary that we built above.
```
`go build -o tailscale.combined -tags ts\_include\_cli -ldflags="-s -w" ./cmd/tailscaled
`
```
Use the `du` command to check the compiled binary size:
```
`du -hs tailscale.combined
`
```
For example, this returned the following size:
```
` 18M tailscale.combined
`
```
Next use the `upx` command:
```
`upx --lzma --best ./tailscale.combined
`
```
Use the `du` command to check the compiled binary size:
```
`du -hs tailscale.combined
`
```
For example, this returned the following compressed size:
```
` 4.5M tailscale.combined
`
```
After UPX compression, we've reduced the size of the (combined) Tailscale
binary from the original size of 23MiB down to only 4.5MiB, about 20% of the
original size!
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Building Tailscale](#step-1-building-tailscale)
* [Step 2: Building a smaller Tailscale binary](#step-2-building-a-smaller-tailscale-binary)
* [Step 3: Compressing Tailscale](#step-3-compressing-tailscale)
Scroll to top