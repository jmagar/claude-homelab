Reducing Tailscale’s binary size on macOS
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|February 16, 2023
# Reducing Tailscale’s binary size on macOS
A few months ago I was poking around the package contents of Tailscale’s macOS app when I happened to notice that the main `Tailscale` binary was surprisingly large — more than 37 megabytes. Some of the size is explained by it being a [universal app](https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary) — it includes both `x86\_64` (for Intel-based Macs) and `arm64` slices (for Apple silicon ones). However, even when accounting for that, it seemed too large for what is mostly a UI wrapper — the core logic lives in a [network extension](https://developer.apple.com/documentation/networkextension). In fact, looking at that extension (`IPNExtension.appex`), I was surprised to find that it was only slightly smaller (36.5 MB).
Inspecting the main executable with [Hopper](https://www.hopperapp.com/) showed a lot of unlabeled functions, which was not immediately helpful. Running `strings` on it showed a lot of Go package names, which was the clue that I needed: we were including Tailscale’s open source [Go core](https://github.com/tailscale/tailscale) not just in the extension (expected), but in the main app itself. This also explained the very similar binary sizes.
I thought this would be a quick size win, so I removed the static library that we generate from our Go code from the main app’s dependencies… and promptly got a linker error: “[`ActLikeCLI`](https://github.com/tailscale/tailscale/blob/71029cea2ddf82007b80f465b256d027eab0f02d/cmd/tailscale/cli/cli.go#L50-L94) is not defined.” I now had my explanation for why we included the Go code in the main app: Tailscale [has a CLI interface](/kb/1080/cli/), and on macOS it’s invoked by [running the regular app](/kb/1080/cli/?tab=macos) from the command line.
Knowing that the app only needed the CLI bits of the Go code, I set about generating a separate static library with just that, figuring it would be a lot smaller. However, as I started to get lost in a maze of twisty little [redo](https://github.com/apenwarr/redo) rules, [all alike](<https://en.wikipedia.org/wiki/Colossal_Cave_Adventure#:~:text=Additionally, in the,result.[39]>), I began to reconsider. Even if I got this to work, would there be a significant size savings? The CLI static library would still end up including its own copy of the Go runtime and code that is shared with the Tailscale backend. Looking at the Linux version of Tailscale, the `tailscale` binary (which is just the CLI) is still more than half the size of `tailscaled` (the backend daemon) — 14 MB vs. 24 MB.
I decided to approach the CLI invocation from first principles. All the Mac app really needs to do is invoke the [`Run` function](https://github.com/tailscale/tailscale/blob/71029cea2ddf82007b80f465b256d027eab0f02d/cmd/tailscale/cli/cli.go#L128-L129) from Tailscale’s `cli` Go package. Most of the time the Go code is already running (in the network extension), and there’s [a local HTTP server](https://github.com/tailscale/tailscale/blob/main/ipn/localapi/localapi.go) that the app uses. We could add a `/localapi/v0/cli` endpoint and have the app invoke it. However, I hesitated to do this. This was partly because it would add yet more states and edge cases: what if the backend is not running, or what if a local firewall blocks the request? We also knew that these local endpoints are scrutinized for security reasons, and are wary of adding such powerful ones.
Letting my mind wander a bit, I was reminded of two tidbits:
1. Tailscale can be built in a mode where it [combines the backend and CLI into one binary](/kb/1207/small-tailscale/), for extra size savings.
2. Some programs (most memorably [Chrome](<https://neugierig.org/software/chromium/notes/2009/01/startup.html#:~:text=Chrome is built as a .exe and .dll pair, where the exe just calls the one exported function from the DLL, called ChromeMain().>)) just have a very small shell binary, with the bulk of the logic being in a separate library that is loaded and invoked at startup.
I wondered if this approach could be taken here: the network extension already has the combined binary, including the CLI logic — so what if we treated it as a shared library that we could load and call functions from, when the app needs to run in CLI mode? Some playing around with `dlopen` and `dlsym` showed that it could work. Here’s a sketch of what I ended up with (all of the error-handling has been omitted):
```
`// Generate path to the app extension binary.
let plugInsURL = Bundle.main.builtInPlugInsURL
let extensionURL = plugInsURL.appendingPathComponent(
"IPNExtension.appex/Contents/MacOS/IPNExtension")
// Open the extension binary as a shared library and find
// the CLI entrypoint symbol.
let extensionHandle = dlopen(extensionURL.path, RTLD\_LOCAL)
let goBeCLISymbol = dlsym(extensionHandle, "goBeCLI"')
// Invoke the goBeCLI symbol.
typealias goBeCLIType = @convention(c) (UnsafePointer\<Int8\>) -\> Void
let dir = ... // URL to the app sandbox directory
goBeCLI(dir.path)
// Unreachable beyond this point, Go does an os.Exit.
`
```
The real code ended up being slightly more complicated, because it needs to handle Tailscale’s [standalone variant](/kb/1065/macos-variants/), which has the network extension at a different path. The only other gotcha was that we had to make sure that `goBeCLI` was in [our exported symbols list](https://developer.apple.com/documentation/xcode/build-settings-reference#Exported-Symbols-File); otherwise, the linker would remove it when doing dead code stripping.
This change shipped with Tailscale v1.36, and it was very satisfying to check the binary size for it — 35 MB smaller than v1.34. In addition to scratching my optimization itch, it should result in faster download and update times for everyone.
Share
Author
Mihai Parparita
Author
Mihai Parparita
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)