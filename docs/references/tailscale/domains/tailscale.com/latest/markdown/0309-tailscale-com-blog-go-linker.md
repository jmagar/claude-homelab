Hey linker, can you spare a meg?
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 07, 2021
# Hey linker, can you spare a meg?
Tailscale on iOS runs as a special kind of app, a [Network Extension](https://developer.apple.com/documentation/networkextension). This lets us run in the background, so we can secure traffic from all of your applications, without them having to change anything. But with this power comes a memory straightjacket. Normal iOS apps can use 5GB or so of memory before iOS kills them. We get 15MB. With an “M”.
That has been a constant pain point for our users—and especially for us. When we use too much memory, iOS snipes our network extension, and your VPN access goes down. And the knowledge that doing more work caused more crashes caused us to leave important improvements out of the iOS app, like http2 and UPnP support. It was a constant low level drain on our engineering team and our product.
This blog post is about how we tackled the problem, with a bit of philosophizing and a surprise twist at the end.
### The easy stuff
The first step is to understand the problem. We added some logging about [our memory usage](https://developer.apple.com/documentation/os/3191911-os_proc_available_memory). This made it clear that baseline operation of Tailscale consumed 10-12MB, leaving only a few MB for anything else. The worst problems were for users with large tailnets: There was just more data. Plus, with many devices, we had to update that data more often. Still, with baseline operation taking 70-80% of the memory, we decided to start there.
The [core of the Tailscale VPN](https://github.com/tailscale/tailscale/) is written in Go. So another obvious step is to bust out [pprof](https://jvns.ca/blog/2017/09/24/profiling-go-with-pprof/) and optimize memory allocations. The internet has plenty of discussion of this kind of optimization, and they’re pretty standard stuff: eliminate [per-packet](https://github.com/tailscale/go/commit/f6fa4687a144cbfc8a8edcf2b7b35c38fda7eef6) [allocations](https://github.com/tailscale/go/commit/cff4b8d1c64767e8a888ad3da008c7b9a85afa0e), [re-use](https://github.com/tailscale/tailscale/commit/0c038b477ffce97c03664361663a68fd97b8a05a) [buffers](https://github.com/tailscale/tailscale/commit/93284209bca3c63620b4f042d3dfd8d85af1ab94), [break some layers](https://github.com/tailscale/tailscale/commit/a4e19f22339d9d618dcf459ca5709b2701aada56), and so on. That all helped, but not enough. Next topic.
### Inside the Go runtime
We made the Go garbage collector more aggressive, by calling [debug.SetGCPercent](https://pkg.go.dev/runtime/debug#SetGCPercent). This uses more CPU, but reduces memory usage by making it more likely that any given allocation can re-use freed memory. There’s an [exciting Go proposal](https://github.com/golang/go/issues/48409) to make this kind of setup easier and more automatic, but even that is not a panacea. If you need more memory than you have, even a theoretically perfect garbage collector will not save you.
We also set [GOMAXPROCS=1](https://pkg.go.dev/runtime#GOMAXPROCS) when starting the binary. This saves memory in two ways. First, it reduces the number of system threads. Each system thread takes hundreds of kilobytes of memory. Second, and less obvious, it reduces overhead from the Go memory allocator.
Go uses a slab allocator: It only allocates memory in specific sized chunks, or [size classes](https://commaok.xyz/post/discovering-size-classes/). And it requests memory from the OS in even larger chunks, or slabs. The first time a Go program allocates a single 24 byte struct, the allocator will ask the OS for 8KB, which it will use to satisfy other requests for 17-24 byte objects. After 341 such allocations, that 8KB has been used up, and the allocator will ask the OS for another 8KB, assuming the GC hasn’t freed anything in the meantime.
Allocations happen all the time. They need to be fast. And to avoid performance hits on a many-core machine, they need to avoid locking. So the Go runtime maintains a set of slabs per CPU. (Technically, [per P](https://morsmachine.dk/go-scheduler). Some things in this blog post have been intentionally simplified.) So on a 64 core machine, it is possible for the first 64 allocations of a 24 byte struct to each acquire a 8KB slab.
In a normal Go process, the slab overhead is negligible. But we were at a scale at which every 100KB really counted. The slab overhead from infrequently-allocated object sizes was enough to care about. Setting GOMAXPROCS to 1 cuts the potential slab overhead.
We considered [changing the size classes to be coarser and the slabs to be smaller](https://github.com/tailscale/go/pull/18). This is a balancing act. Fewer size classes means that allocations that might previously have been in separate slabs can end up in the same slab, leading to fewer slabs. But coarser slabs also means more waste: Allocating a 70 byte struct might suddenly use up 96 bytes instead of 80. Tweaking the size classes did in fact save memory, but it felt fragile and risky, so we didn’t move forward with it.
### iOS’s memory accounting
In practice, what mattered was not how much memory we used, but how much memory iOS thought we used. Trying to understand iOS’s memory accounting contained some [rabbit holes](https://github.com/golang/go/issues/47656), but ultimately provided some insights. (Hat tip to [Steeve Morin](https://fr.linkedin.com/in/steevemorin), who helped get us started on this front.)
Apple has a suite of tools for diagnosing memory usage and [pretty videos](https://developer.apple.com/videos/play/wwdc2021/10180) explaining them. These tools provided a way to answer the key question: “How does iOS account for our memory usage?”
The simplest of these tools is [footprint](https://www.unix.com/man-page/osx/1/footprint/). You can run footprint on a running process or a memgraph file captured via Xcode, and it’ll spit out something like this (taken from a recent dev version of Tailscale on iOS):
```
`======================================================================
IPNExtension [2921] (memgraph): 64-bit Footprint: 13 MB (16384 bytes per page)
======================================================================
Dirty Clean Reclaimable Regions Category
--- --- --- --- ---
9040 KB 0 B 304 KB 36 untagged ("VM\_ALLOCATE")
1568 KB 1040 KB 0 B 131 \_\_DATA\_CONST
514 KB 32 KB 0 B 123 \_\_DATA
416 KB 0 B 0 B 6 MALLOC\_TINY
416 KB 0 B 0 B 26 stack
384 KB 0 B 16 KB 6 MALLOC\_SMALL
262 KB 0 B 0 B 104 \_\_DATA\_DIRTY
257 KB 0 B 0 B 485 unused dyld shared cache area
112 KB 0 B 0 B 9 malloc metadata
85 KB 0 B 0 B 61 \_\_AUTH
80 KB 0 B 0 B 3 MALLOC\_LARGE
64 KB 0 B 0 B 1 libdispatch
48 KB 4528 KB 0 B 157 \_\_TEXT
48 KB 1216 KB 0 B 5 mapped file
32 KB 0 B 0 B 1 Activity Tracing
27 KB 0 B 0 B 132 \_\_AUTH\_CONST
16 KB 0 B 0 B 1 Foundation
16 KB 0 B 0 B 1 os\_alloc\_once
16 KB 0 B 0 B 1 \_\_OBJC\_RW
7160 B 0 B 0 B 47 \_\_OBJC\_CONST
0 B 256 KB 0 B 7 \_\_LINKEDIT
0 B 0 B 0 B 2 \_\_OBJC\_RO
0 B 0 B 0 B 1 \_\_UNICODE
--- --- --- --- ---
13 MB 7072 KB 320 KB 1347 TOTAL
Auxiliary data:
phys\_footprint\_peak: 13 MB
phys\_footprint: 13 MB
`
```
According to iOS, this process is using 13MB, perilously close to our 15MB limit. Most of that is normal memory allocations requested by the Go runtime (VM\_ALLOCATE). Another tool, [vmmap](https://www.unix.com/man-page/osx/1/vmmap/) gives you a much more fine-grained look at your memory usage.
After (mostly) running out of runway changing our Go code and messing with the Go runtime, we gave up on shrinking VM\_ALLOCATE and turned our attention to the second biggest entry above: \_\_DATA\_CONST.
### \_\_DATA\_CONST
What even is \_\_DATA\_CONST? And why would constant data have dirty pages? A dirty page in memory is a page that the OS can’t just throw away and recreate as needed; it must be stored somehow. But if a page contains constant data, it seems like iOS ought to be able to throw it away and grab that data from the executable again as needed.
To answer those questions requires a digression through [relocations](https://en.wikipedia.org/wiki/Relocation_(computing)) and [position-independent executables](https://en.wikipedia.org/wiki/Position-independent_code).
When running an executable, the code has to live somewhere in memory. Each function has an address. If you know exactly where the code will be in memory, then when one function calls another, you can hard-code its address right in the binary.
But knowing in advance exactly where everything will be in memory makes an [attacker’s job much easier](https://en.wikipedia.org/wiki/Address_space_layout_randomization), so iOS (among others) requires that an executable be able to function correctly no matter where in memory it is placed, that is, be position independent. This means that memory addresses cannot be hard-coded.
To make this work, executables contain relocations. These are instructions to the operating system telling it how to modify the executable based on its location in memory. A typical relocation might say: “change the 8 bytes at location X in the executable to be the base memory address of the executable plus offset Y, using little-endian encoding”. When iOS launches an executable, it picks a random base address, applies all relocations, and then runs the executable.
As another protection against attackers, memory can be marked as read-only. This can happen [at run time](https://man7.org/linux/man-pages/man2/mprotect.2.html), but you can also request that parts of the executable be marked as readonly at the time that the OS loads it into memory, before it starts running. As a special case, you can also request that the OS first apply all relocations, then mark the memory as read-only. And that memory is our \_\_DATA\_CONST category above. It is constant now, but it has been modified, and is thus dirty. (A sufficiently clever OS could still recreate it on demand by re-applying all relocations as needed, but iOS does not.)
### Improving the Go linker
If we could get rid of those relocations, then those pages would never get dirtied, and we’d save some memory. You can use [dyldinfo](https://www.unix.com/man-page/osx/1/dyldinfo/) tool to inspect the relocations in an executable. We wrote a [quick script](https://gist.github.com/josharian/4ed18ab0c2dd84b51cb45de14e8be36c) to model the relocations in our executable, and it matched iOS’s accounting. We then sampled the relocations, comparing them to the output of [go tool nm](https://pkg.go.dev/cmd/nm) to figure out what they were pointing to, and looked into whether we could get rid of any of them.
Our analysis suggested we could eliminate about half of them, which would generate memory savings of almost 1MB. And, just as importantly, would let us worry less about adding additional code to the app. The number of relocations scaled with the amount of code, so merely adding UPnP support would cost us precious memory right out of the gate. With fewer relocations, that cost would go down.
The relocations were in Go’s [pclntab](https://github.com/golang/go/blob/master/src/debug/gosym/pclntab.go), short for “PC line table”. It was originally used to associate parts of the executable code (program counters, or PCs) with the original lines of Go code, so that panics could print nice stack traces and you could use [runtime.Callers](https://pkg.go.dev/runtime#Callers) and friends. It has since grown to include lots of runtime metadata, for use by the garbage collector, the scheduler, and more.
These relocations were all of the form “add X to the executable’s base address”. But we can do addition at runtime too. Instead of a relocation, we could write only the offset, and then do the math as needed at runtime.
We reached out to the Go team and learned that this was something that they also wanted, so we proceeded to [make it so](https://github.com/tailscale/go/pull/20). The work spanned multiple packages and dozens of commits, with the usual amount of build breakage and yak shave-age. (Big, big hat tip to [Cherry Mui](https://github.com/cherrymui), whose assistance was invaluable throughout this effort.)
The impact of removing these relocations was not limited to our iOS memory woes. It helped all builds for which Go produces position independent executables (such as darwin/arm64), and to a lesser extent even those that don’t (such as linux/amd64).
Relocations are larger than offsets. Binary sizes shrank almost 5% for darwin/arm64 and almost 3% for linux/amd64.
Constructing, tracking, and writing a relocation is more work than writing an offset. The linker itself got faster and uses less memory. Linking the compiler got 30% faster and used 55% less RAM for darwin/arm64, and 4% faster with 10% less RAM for linux/amd64.
These improvements should be generally available as part of the [Go 1.18 release](https://github.com/golang/go/wiki/Go-Release-Cycle).
### Wait, you did what?
Time for the philosophizing I promised.
People are often surprised and sometimes horrified when they learn that Tailscale maintains its own fork of the Go toolchain. Tailscale is a small startup. Isn’t that a horrible distraction, a flagrant burning of [innovation tokens](https://mcfunley.com/choose-boring-technology)?
Maybe. But the thing is, you write code with the engineers you have.
We had a problem: We kept crashing on iOS, and in addition to being awful, it was preventing us from adding features.
Another team might have decided to cut even more features on iOS to try to achieve stability, or limited in some way the size of the tailnet that iOS could interact with.
Another team might have radically redesigned the data structures to squeeze every last drop out of them.
Another team might have rewritten the entire thing in Rust or C.
Another team might have decided to accept the crashes and attempted to mitigate the pain by making re-establishment of connections faster.
Another team might have decided to just live with it and put their focus elsewhere.
The Tailscale team has Go expertise, spanning the standard library to the toolchain to the runtime to the ecosystem. [It’s an asset](https://danluu.com/in-house/), and it would be foolish not to use it when the occasion arises. And the fun thing about working on low level, performance-sensitive code is that that occasion arises with surprising frequency.
Blog posts about how people solve their problems are fun and interesting, but they must always be taken with a healthy dose of context. There may be no other startups in existence for which working on the Go linker would be a sensible choice, but it was for us.
### Surprise twist ending
With the Go linker work [newly completed](https://github.com/tailscale/go/pull/20), we set out to confirm our analysis. What would footprint say?
As expected, footprint approved:
```
` 708 KB 1664 KB 0 B 218 \_\_DATA\_CONST
`
```
Down from 1568KB to 708KB. Not bad. And did footprint still match iOS’s opinion?
We expected to see our free memory reported go up by about 1MB. And instead it went up…36MB.
Huh?
While we were busy fixing the linker to save 1MB, iOS 15 launched and quietly gave us 35MB more.
Thanks, iOS!
Share
Author
Josh Bleecher Snyder
Author
Josh Bleecher Snyder
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