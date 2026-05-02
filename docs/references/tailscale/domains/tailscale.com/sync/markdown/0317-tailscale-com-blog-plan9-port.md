Porting Tailscale to Plan 9
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsApril 02, 2025
# Porting Tailscale to Plan 9
It’s been said that nothing helps land a joke like explaining it, so here we are to explain yesterday’s [Tailscale Plan 9 announcement](https://tailscale.com/blog/tailscale-enterprise-plan-9-support), even at the risk of killing the joke.
But really, if we had to kill a joke by explaining it, there’s no better type of joke to kill than a corporate April Fools’ Day post. They’re admittedly pretty terrible in general. I’m of the opinion that if you’re going to do such a joke, you better put some effort into it; [it](https://groups.google.com/g/golang-dev/c/ZEntxvHLIt0/m/BdvtIdJNIOMJ) [should](https://go-review.googlesource.com/c/go/+/21400) [actually](https://go-review.googlesource.com/q/quaternions) [work](https://github.com/bradfitz/campher). (Otherwise it’s 100% sad instead of whatever percent sad yesterday’s post was.)
And to be super clear today on April 2nd because nobody believes anything on April 1st: Tailscale now actually works on Plan 9. For reals.
We were amused to find everybody in shock that there was [a PR](https://github.com/tailscale/tailscale/pull/15491) attached to yesterday’s blog post so let’s dig into that PR a bit, and other work that went on.
First off: I don’t really know Plan 9. I know *of* Plan 9, and I know people who know Plan 9, but I’m a Plan 9 newbie and I apologize in advance if I offend any Plan 9 people with my ignorance. I tried to check my cluelessness with others to make sure it’s not *too* stupid, but there are surely some inaccuracies in these posts and bugs and shortcuts and simplifying assumptions in the code.
Anyway.
As the quip goes, “We chose to port Tailscale to Plan 9 not because it was easy, but because we thought it would be easy.” Naively it kinda seems like you’d take Tailscale’s two Go binaries and build them with `GOOS=plan9 GOARCH=386 go install ./cmd/tailscale{,d}` and call it a day. Sure, I expected some `syscall` or `x/net` or `x/sys/unix` symbols to not exists with `GOOS=plan9` and some `//go:build` tag adjustments and some special cases for `runtime.GOOS == "plan9"` to use different default disk paths like we previously [did for AIX](https://github.com/tailscale/tailscale/commit/a1abd12f351cfb625c5ac9bca243d0bc46dbdbfd), etc. So that’s [what I tried](https://github.com/tailscale/tailscale/pull/9082) in August 2023 when a local acquaintance here in Seattle [asked me for Plan 9 support](https://github.com/tailscale/tailscale/issues/5794#issuecomment-1690411613) and I finally caved and said okay (after initially rejecting the idea). I tweaked some build tags & paths & compiled it and …. [Boom](https://github.com/golang/go/issues/62507). The binary crashed at runtime in weird ways. Turns out the Go compiler support for Plan 9 had bitrot. Plan 9 wasn’t one of Go’s [first-class ports](https://go.dev/wiki/PortingPolicy) and nobody had noticed the regressions. Or maybe Tailscale just pushed Go a bit harder than it had been pushed on Plan 9 before.
In any case, the Tailscale Plan 9 effort stalled out through all of 2024, beyond my time and/or ability to fix.
At the beginning of March 2025, a coworker mentioned April Fools’ Day and I suddenly remembered our Plan 9 port.
I reached out to [Russ Cox](https://swtch.com/~rsc/) (a former coworker from the Go team with a lot of Plan 9 history) and told him I thought it’d be fun (& funny) to finish up in time for April 1st. He replied:
*“Sure I’m in.*
*We should fix the plan 9 kernel to save those registers and then not have that special case anymore.”*
It’s possible that Russ didn’t know what he was signing himself up for.
## SSE
In 1999, Intel introduced the Pentium III processor with [SSE instructions](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions). Yesterday’s blog post is dated 1999 because that’s kinda where this whole adventure begins.
The “special case” that Russ was referring to above is how the Go compiler [tried to avoid using SSE anywhere](https://github.com/golang/go/issues/62507#issuecomment-1710636507) for Plan 9 targets because the Plan 9 kernel doesn’t allow SSE in “note handlers” (think: signal handlers), as it didn’t save/restore them. And because the Go compiler didn’t know which code was being used during a note handler, it conservatively tried to disable SSE everywhere. But that code was regularly breaking and there were too many `plan9` [special](https://github.com/golang/go/blob/go1.24.0/src/cmd/compile/internal/ssa/config.go#L369-L379) [cases](https://github.com/golang/go/blob/go1.24.0/src/cmd/compile/internal/amd64/ggen.go#L67-L88) throughout the compiler.
Ideally the Plan 9 kernel would just save/restore the SSE registers/context in note handlers, then Go could remove the Plan 9 special cases and treat it like every other operating system. So Russ did that.
For 386, the Plan 9 fix was [sys/src/9: allow floating point in note handlers](https://github.com/rsc/plan9/commit/3715bf9b86a86ed6a3a857cabfc7dff5d70b409b) (and updating the docs in [sys/man/2: update notify](https://github.com/rsc/plan9/commit/dd95b25897369ff2575b2ad744e18954c4620464)).
For amd64 (the 9k kernel), we ran into a [bunch more issues](https://9fans.topicbox.com/groups/9fans/Taf6b900592afc500/9k-amd64-kernel-and-floating-point). Russ fixed various things:
* [sys/src/9k: fix bug aliasing parent and child FP state after fork](https://github.com/rsc/plan9/commit/3b001d133aa0e1661f64d2df0a683aa6d10bc955)
* [sys/src/9k: allow floating point and simd in note handlers](https://github.com/rsc/plan9/commit/c30ca5483b9fb3a438510110580cacaddb88f8e9)
* [sys/src/9k: fix noted(NCONT) losing registers](https://github.com/rsc/plan9/commit/aa00f938f6b3c6a5b4502c25605666f479a22c16)
* [sys/src/libmach: fix default amd64 binary mapping](https://github.com/rsc/plan9/commit/04c7c708c2640586536bd31e01fbb8f05628bd71)
* [sys/src/cmd/ktrace: fix for new k10 kernel trap routine](https://github.com/rsc/plan9/commit/aea4b577cd1b7f1402bdd880487cdf436b168b1e)
… but by this time we’d both pretty much resigned to just focusing on making the demo work on `GOARCH=386`.
With the corresponding Go fix to [stop (incorrectly) special casing Plan 9’s code generation](https://go-review.googlesource.com/c/go/+/655875), `tailscaled` could now start up and run (for longer) without crashing. I could then start working on the bits that I could fix.
## IPC
Now it was crashing due to out of memory errors instead of stack corruption. It turns out an earlier attempt at porting Tailscale to Plan 9 had a bug resulting in launching an infinite number of goroutines. Fixing that bug in our `safesocket` IPC package to just boringly using localhost TCP fixed that and now `tailscaled` would run without crashing. I thought using localhost TCP wasn’t very Plan-9-everything-is-a-file-like but Russ pointed out that some other Plan 9 services do that, so I felt a bit better, at least to unblock forward progress.
Later it’d be nicer to use the [srv9p package](https://pkg.go.dev/9fans.net/go/plan9/srv9p) that Russ [ported to Go](https://github.com/9fans/go/commit/3835d560e21f033c0c05c44e7e0f61f7ccfb9e21) and make the LocalAPI go over that. Or we should at least make localhost use authentication as we do on other platforms. I ran out of time, unfortunately. For now, don’t use this on shared Plan 9 machines.
## Dev Environment
Up to this point, I was running Plan 9 in a VM that I’d installed from a [9legacy CD image download](http://9legacy.org/download.html). Because I didn’t (and still don’t) know [the Acme editor](https://research.swtch.com/acme) too well, I was developing on my normal machines and cross-compiling the Plan 9 binaries, and then running `hget http://10.0.0.x:8080/tailscaled \> tailscaled` and `chmod +x tailscaled` and `./tailscaled` on Plan 9 to pull the binaries over HTTP from my LAN. Because I wasn’t even using virtio for my disk or network, this process (just the copy over the LAN!) took multiple minutes per iteration. That’s long enough for me to get distracted and forget what I was working on and context switch to Slack or email or other projects.
Russ, perhaps sensing my pain without me even whining about it, created [https://github.com/rsc/plan9](https://github.com/rsc/plan9). That’s a repo with not only the Plan 9 source code, but also pre-compiled binaries, and a `./boot/qemu` script that runs a diskless Plan 9 qemu VM that netboots with a [9P](https://en.wikipedia.org/wiki/9P_(protocol)) root filesystem over the network to a localhost 9P server that serves out of that git repo. That meant no more copying files around… my laptop’s filesystem and my Plan 9 filesystem were shared, the way Plan 9 is meant to be used. Also, as a bonus, qemu was wired up to use virtio, making it much faster.
I now had a nice dev environment with iteration time in seconds instead of minutes.
## TUN mode
While Tailscale now ran and “worked” on Plan 9, we were only running Tailscale’s “[userspace networking](https://tailscale.com/kb/1112/userspace-networking)” mode that doesn’t involve the kernel’s networking stack and instead does all the TCP/UDP/ICMP/etc via [gVisor](https://github.com/google/gvisor)’s [netstack](https://gvisor.dev/docs/user_guide/networking/). That’s better than nothing, and where our AIX port is still at, but it’s not ideal— it means the only access from a Plan 9 machine back to your tailnet is via the tailscaled HTTP/SOCKS5 proxy, and you’d have to get all your programs to then use that proxy. But few to zero Plan 9 programs recognize and support an “HTTP\_PROXY” or “ALL\_PROXY” environment variable to support that. Maybe there’s a Plan 9 `/net` server that uses SOCKS5, but I didn’t look too hard.
So, how to get the kernel involved in the network path? On most Unix platforms you use [TUN](https://en.wikipedia.org/wiki/TUN/TAP) (or [wintun](https://www.wintun.net/) on Windows) which give you a virtual network device on which you set addresses and assign routes, handling the incoming and outgoing packets in userspace. The [Plan 9 equivalent is trivial](https://github.com/tailscale/wireguard-go/commit/91a0587fb251a72c28724ee111fe04cf1436ca4c): you open `/net/ipifc/clone`, read a decimal number back of the new interface you just created, write `"bind pkt\\n"` to the `ctl` control fd returned by opening `clone`, and then you have a new interface at e.g. `/net/ipifc/2/\*` where you can then open `/net/ipifc/2/data` and read and write IP packets. (`/net/ipifc/0` and and `/1` are typically localhost and your normal physical LAN).
When I sent this code to [@raggi](https://github.com/raggi) for review his reaction was basically, *“whoa, cute. no ioctls!”* But even more beautiful than no ioctls is that the reads and writes to the data file don’t even need extra framing to prepend the length. You just read and write the IP packets. It’s really the most simple “TUN” implementation we have for any platform.
## Routing tables
I could now get packets in to exactly my interface’s address, but not out to the peers in my tailnet.
Now I’d need to implement Tailscale’s `router` interfaces.
Manipulating the routing tables on Plan 9 is just about as easy as making the interface. You open `/net/iproute`, write `"tag tail\\n"` to it to set the “tail” routing protocol tag on all future routes you add on that fd (to make it easy to clean up after ourselves, knowing what we added), and then write little messages like `"add 100.64.0.0 /106 100.102.103.104"` , giving it our own IP address as the nexthop value. The only surprise was that the CIDR length there (“/106”) is 106 and not the /10 you’d expect from the [CGNAT range](https://en.wikipedia.org/wiki/Carrier-grade_NAT)’s 10.64.0.0/10. It turns out (or seems like) Plan 9 internally is IPv6 primarily, and IPv4 is just a special case of that, so writing “100.64.0.0” is just a shorthand way of writing [IPv4-mapped IPv6 addresses](https://en.wikipedia.org/wiki/IPv6#IPv4-mapped_IPv6_addresses) like `::ffff:100.64.0.0`.
## The missing three button mouse
At this point I took a little trip and forgot to pack my three-button USB mouse.
As mentioned yesterday, Plan 9 basically requires a three-button mouse to use. This makes development on a Mac laptop very difficult to the point of not being fun.
Russ once again took pity on me and [modified Plan 9 to support holding down modifier keys](https://9fans.topicbox.com/groups/9fans/T492596e3a67612c6) while clicking to emulate button 2 and button 3.
## Tailscale SSH
In a moment of overconfidence (or boredom waiting for my delayed flight home), I decided to tackle Tailscale SSH support. Tailscale SSH is tailscaled’s built-in SSH server that handles authentication by using your Tailscale identity as known by your WireGuard™ keys associated with all your packets.
Naively, I tried just running the Plan 9 shell (`/bin/rc`) with `os/exec.Command` and wiring up stdin/stdout to it.
That “worked” but was kinda terrible— things didn’t echo or navigate correctly. You couldn’t interrupt processes, etc.
Russ explained to me how to do it properly but he probably sensed how overwhelming it seemed so he went off and added a [“netshell” example](https://github.com/9fans/go/blob/main/plan9/srv9p/example/netshell/main.go) to the [9fans/go](https://github.com/9fans/go) repo. That “netshell” was basically the world’s most insecure telnet server, but it was all I needed to put behind Tailscale SSH instead of running `/bin/rc` directly.
Now SSH worked. Conveniently, this also meant I could get text output out of Plan 9 more easily: I could `ssh glenda@plan9 cat /dev/snarf` from my laptop (the VM host) and get the copy/paste buffer from my Plan 9 guest VM. (`cat /dev/snarf` is like macOS `pbpaste`) Of course, that’s primarily because I wasn’t thinking and hadn’t realized I had a shared filesystem and could’ve also just redirected `/dev/snarf` to a file and read that file from my laptop. Oh well.
But Tailscale SSH also made it easier for me to write Go tests on my laptop and then easily cross-compile and run them “remotely” over SSH.
## Service collection
One thing that tailscaled can optionally do (disabled by default), is to look what services you’re running on your machine and report them to the control plane for discoverability, so you know for example that you’re running some dev service and its process name on port 8080.
I was curious how to do that. Basically you just walk over `/proc/NNN/fd` (similar to Linux) and find process PIDs who have e.g. `/net/tcp/clone` open. You then look at their “QID” and line it up with `/net/tcp/NNN/{status,local}` to see if they’re listening and on what port. Overall it’s very similar to other platforms but not as beautiful as I would’ve hoped for. The fact that you have to do `tcpN := (qid \>\> 5) & (1\<\<12 - 1)` to map the FD’s QID (basically its inode number?) to a TCP number and hope the kernel implementation doesn’t change is a little sad. It would be better if we had changed Plan 9 to support that operation explicitly, but we ran out of time. Oh well.
## MagicDNS
Next up was making [MagicDNS](https://tailscale.com/kb/1081/magicdns) work. Ideally you could just refer to peers as “foo” from Plan 9 (e.g. `ip/ping foo`) or at least with its `foo.tailnet-name.ts.net` FQDN.
There’s a bunch of docs in [ndb(6)](https://9p.io/magic/man2html/6/ndb) and [ndb(8)](https://9p.io/magic/man2html/8/ndb) and [dial(2)](https://9p.io/magic/man2html/2/dial) elsewhere about the life of a name lookup on Plan 9 and which layers do what. The Go standard library code was also easy to read to see how it all worked, at least from the client side.
We debated just intercepting all the `/net/dns` or `/net/cs` queries and blending in Tailscale names, but in the end [Russ again patched Plan 9](https://9fans.topicbox.com/groups/9fans/T9c9d81b5801a0820) to permit specifying alternate DNS servers for specific DNS name suffixes, similar to what `systemd-networkd` [permits on Linux](https://tailscale.com/blog/sisyphean-dns-client-linux).
For extra fun, I kept randomly hitting a bug where DNS queries got incorrectly negatively cached even after I wrote “refresh” to `/net/dns`. Russ [fixed that too](https://github.com/rsc/plan9/commit/8cafd26a7c4ba3e34d7eb4c76bc854c1433bf03c).
## Random time crashes
Sometimes I noticed `tailscaled` crashing from an assertion deep in gVisor’s netstack from it observing that its [monotonic time](https://pkg.go.dev/time#hdr-Monotonic_Clocks) had gone backwards. Monotonic time should never go backwards; that’s its one job. But it turns out Go’s time implementation on Plan 9 was just using the wall time as its monotonic time, and when ntpd adjusted the clock backwards, gVisor crashed.
Once again Russ jumped in and [added monotonic time to Plan 9’s /dev/bintime](https://9fans.topicbox.com/groups/9fans/T59810df4fe34a033/monotonic-time-and-randomness-on-plan-9) and [patched Go to use it](https://go-review.googlesource.com/c/go/+/656755).
## Time to blog
The final boss was writing a blog post and figuring how to get access to the blog again. (Sorry, long time no see. I’ll try to write more often!)
I thought it’d be fun to date the first blog post as “April 1, 1999” for nostalgic reasons. Also the world seemed happier back then.
I pestered some former Go colleagues who’d worked at Bell Labs for quotes too. I’m thrilled they wanted to play along. I defensively assured them that Plan 9 was not the butt of the joke and the joke was …. ourselves perhaps? (I’m not exactly sure why we did this.)
## Running on the web
With a few days remaining, we decided to tackle running Plan 9 on the web. A few weeks prior I had first looked at using [PCjs](https://www.pcjs.org/) and met up with its author for coffee & donuts in my neighborhood. Without networking support, though, the demo wasn’t as interesting. Adding [ne2000](https://en.wikipedia.org/wiki/NE1000) support might’ve been possible, but there wasn’t a lot of time. Jeff recommended looking at [copy/v86](https://github.com/copy/v86#readme). It runs 32-bit operating systems using WASM and includes [various forms of networking](https://github.com/copy/v86/blob/master/docs/networking.md) support. (another reason for us to focus on `GOARCH=386` and not `GOARCH=amd64`!)
So far I had been doing development using the [qemu-based shared filesystem environment](https://github.com/rsc/plan9) that Russ had prepared. But now we needed a disk image to boot from on the web.
While Russ worked on dusting off & modernizing an old compressed root filesystem kernel he’d worked on 25 years ago, I worked at exploring networking options.
One of the networking options passes Layer 2 ethernet frames over websockets to a relay. I [added wsproxy protocol support](https://github.com/tailscale/tailscale/commit/2a12e634bfe7fc4f89fa8f37b1bd0ff9866e776b) to our network simulation environment used for integration tests. That environment fakes everything with the help of gVisor’s [netstack](https://gvisor.dev/docs/architecture_guide/networking/): ARP, DHCP, DNS w/ fake IPs, various flavors of NAT, optionally bridging controlplane & DERP servers to their real connections behind the scenes, etc. That ended up working, but it wasn’t ideal. The VM did DHCP before it brought up `rio` (the Plan 9 GUI) and DHCP took several round trips over the faked ethernet-over-websockets. If the relay was far away, the GUI would start slowly.
So then I instead implemented a “[WISP](https://github.com/MercuryWorkshop/wisp-protocol)” server instead. This made the GUI start up without any network roundtrips at all: the DHCP all happened faked inside the browser.
I was in the middle of productionizing the WISP proxy when I ran out of time and decided to just launch with the [copy.sh/v86](http://copy.sh/v86) default network relay settings.
I built Tailscale, added it to `/386/bin`, prepared a disk image (`cd /sys/lib/dist/mini; mk` in [rsc/plan9](https://github.com/rsc/plan9) after adding `tailscale` & `tailscaled` to the image’s `proto` template file), and then it spit out a 16MB disk image with all of Plan 9 and Tailscale, which itself is a 23MB binary after decompression. That’s why you’ll notice the “gunzip…” step when you boot the image, now included as an example image at [https://copy.sh/v86/?profile=9legacy](https://copy.sh/v86/?profile=9legacy)
Maybe I’ll finish up the WISP backend later.
## Future directions
There are two main forks of Plan 9: a very minimal one ([9legacy](http://9legacy.org/)) and a more modified one ([9front](https://9front.org/)). So far Tailscale has only been tested on 9legacy. Some of the patches that Russ wrote for 9legacy might still need to be ported to 9front.
We should also verify that 64-bit `GOARCH=amd64` support works. We’d mostly ignored that during development.
I also didn’t implement exit node support or Go’s `net/netns` package support. Doing that might require rethinking how Tailscale presents itself on Plan 9, probably [as its own `/net`](https://9fans.topicbox.com/groups/9fans/T4cecdedbabdedc00/tailscale-on-plan-9).
But largely I’ll be relying on the Plan 9 community to take this over if they’d like to.
## What was the point?
I’m trying to remember now why we did all this. Mostly it was because [Skip](https://github.com/9nut) asked. Partly it was fun & educational, working in an alternate reality and learning new things. And working with a totally busted `tailscaled` crashing and deadlocking in weird ways always seems to lead to finding existing problems that affect all other platforms or assumptions that aren’t true in general.
And Go’s support for Plan 9 got better:
* [cmd/compile: use FMA on plan9, and drop UseFMA](https://go-review.googlesource.com/c/go/+/655877)
* [runtime: remove nextSampleNoFP from plan9](https://go-review.googlesource.com/c/go/+/655879)
* [cmd/compile, runtime: remove plan9 special case avoiding SSE](https://go-review.googlesource.com/c/go/+/655875)
* [net: fix parsing of interfaces on plan9 without associated devices](https://go-review.googlesource.com/c/go/+/654055)
* [os: guarantee min buffer size for ReadFile reads on /proc-like files](https://go-review.googlesource.com/c/go/+/654315)
* [net: unblock UDP Reads upon Close on plan9, add test](https://go-review.googlesource.com/c/go/+/656395)
* [runtime: fix plan9 monotonic time, crypto randomness](https://go-review.googlesource.com/c/go/+/656755)
In particular, removing the `plan9` special cases from the Go compiler makes the Go compiler cleaner and easier to hack on, so that’s nice.
## Final surprise
When we launched the blog post on Tuesday, we discovered that the v86 author had launched his own April Fools’ Day joke— everything on v86, including the VGA text output from emulated VMs, was all in fake Dutch or something.
I panicked a little, as it made our demo more confusing (“Plun 9”, “goonzeep…” instead of “gunzip…”, etc), and I’d just run out of time trying to finish hosting our own HTML page with v86 Javascript & WASM embedded, but fortunately the author pointed out that the page took a `&nojoke` query argument.
## Thanks
Thanks to everybody who made this possible:
* [Skip Tavakkolian](https://github.com/9nut) for the nerdsnipe
* [Jeff Parsons](https://github.com/jeffpar) for talking me through [PCjs](https://www.pcjs.org/) and web-based 32-bit emulation
* [Fabian](https://github.com/copy/) for [v86](https://github.com/copy/v86). I have so many new non-April Fools ideas to do with v86 now. Stay tuned.
* [David du Colombier](https://github.com/0intro/) for all the plan9 Go maintenance & reviews over the years and hosting the [9p.io](https://9p.io/plan9) docs I relied on constantly
* [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike) and [Peter J. Weinberger](https://en.wikipedia.org/wiki/Peter_J._Weinberger) and [Charlotte Brandhorst-Satzkorn](https://bsky.app/profile/catzkorn.dev) for playing along with the quotes
* [Russ Cox](https://swtch.com/~rsc/) for doing all the hard work fixing up stuff in Plan 9 and Go’s Plan 9 support and telling me how to use Plan 9; I stalled out doing this joke for over a year. Russ made this possible.
## Questions?
If you miss our [Plan 9 Google Meet GChat Hangout](https://ftp.plan9.ts.net/webinar), we’ll also be answering any questions we see pop up on Hacker News, [Reddit](https://www.reddit.com/r/Tailscale/comments/1jprsqo/porting_tailscale_to_plan_9/), or Bluesky.
## In conclusion
Maybe I’ll skip April Fools’ Day next year, like I skipped [Advent of Code](https://adventofcode.com/) this past year.
And if you actually wanted to pay us dumptruck loads of money for Plan 9 support, please don’t— dumptrucks will dirty the cash. Please wire it instead.
Share
Author
Brad Fitzpatrick
Author
Brad Fitzpatrick
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