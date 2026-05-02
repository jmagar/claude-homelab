Modules, Monoliths, and Microservices: A Systems Design Perspective
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|February 23, 2021
# Modules, monoliths, and microservices
Lately, I get people asking me when microservices are a good idea. In [systems design explains the world](https://apenwarr.ca/log/20201227), I talked about big-picture issues like second system effect, innovator’s dilemmas, and more. Can systems design answer the microservices question?
Yes, but you might not like the answers. First, we'll need some history.
#### What is a microservice?
You can find various definitions on the Internet. Here's mine: microservices are the most extreme possible backlash against *monoliths*.
Monoliths are what happen when you link everything your entire app needs into one giant program and deploy it as one big blob. Monoliths have a long history, going back to frameworks like CGI, Django, Rails, and PHP.
Right away, let's abandon the assumption that a monolith and a fleet of microservices are the only two options. There's a wide and nuanced continuum from "one giant service that does everything" to "infinite tiny services that each do nearly nothing."
If you follow fads, you'll have built a monolith at least once (whether on purpose or because that's what traditional frameworks encouraged you to do), then discovered some problems with monoliths, then heard that microservices are the answer, then started rearchitecting everything as microservices.
But don't follow fads. There are many points in between those extremes. One of them is probably right for you. A better approach starts with where you want to put your *interfaces*.
#### Boxes and arrows
An interface is the connection between *modules.* A module is a collection of related code. In systems design, we talk about "boxes and arrows" engineering: modules are the boxes, and interfaces are the arrows.
The deeper question then is: how big are the boxes? How much goes in each box? How do we decide when to split one big box into two smaller ones? What's the best way to connect the boxes? There are many approaches to all this. Nobody quite knows what's best. It's one of the hardest problems in software architecture.
Over the decades, we've evolved through many kinds of "boxes." [Goto statements were "considered harmful"](https://homepages.cwi.nl/~storm/teaching/reader/Dijkstra68.pdf) largely because they prevented any hierarchy at all. Then we added functions or procedures; those are very simple boxes, with interfaces (parameters and return codes) between them.
Depending which branch of programming you go down, you then discover recursive functions, combinators, static function prototypes, libraries (statically or runtime-linked), objects (OOP), coroutines, protected virtual memory, processes, threads, JITs, namespaces, sandboxes, chroots, jails, containers, virtual machines, supervisors, hypervisors, microkernels, and [unikernels](https://en.wikipedia.org/wiki/Unikernel).
And that's just the boxes! Once you have boxes isolated from each other, then you need to connect them with arrows. For that, we have ABIs, APIs, syscalls, sockets, RPCs, filesystems, databases, message passing systems, and "virtualized hardware."
If you tried to draw a complete boxes-and-arrows diagram of a modern Unix system (which I won't), it would be wild: functions inside threads inside processes inside containers inside userspace, layered under a kernel, inside a VM, running on hardware in a rack in a datacenter in a cloud provider tied together by an orchestration system, and so on.
Each of those boxes at each of the abstraction layers is somehow isolated from and then connected to some of the others, at the same or other layers. Some are inside others. You couldn't draw an honest version of this picture in a mere two dimensions without lines criss-crossing hopelessly.
This all evolved over decades. Fancy people call it "path dependence." I call it a mess. And let's be clear: most of the mess no longer provides much value.
Instead of focusing on what became very ugly evolutionary results, let's talk about what people were *trying* to do while they invented all that stuff.
#### The quest for modularity
The top-line goals of module systems are always the same:
1. Isolate each bit of code from the other bits.
2. Re-connect those bits only where explicitly intended (through a well-defined interface).
3. Guarantee that bits you change will still be compatible with the right other bits.
4. Upgrade, downgrade, and scale some bits without having to upgrade all the other bits simultaneously.
The computer industry spends an absolutely immense amount of time messing around, trying to find the perfect balance of all these modularity issues, while still trying to keep development as painless and easy as possible.
We are, in short, not succeeding.
By far the part we're worst at is #1, isolation. If we could truly and efficiently isolate one bit of code from another, the other goals would mostly fall into place. But we simply do not know how.
Isolation is a super hard problem. Goodness knows people have tried. Yet browser sandbox escapes still happen regularly, undetected privilege escalation attacks are simply assumed to exist on every OS, iOS still gets jailbroken periodically, DRM never works (for better or worse), virtual machines and containers regularly have vulnerabilities discovered, and systems like [k8s have their containers configured insecurely by default](https://blog.alcide.io/insecure-by-default-kubernetes-networking).
People have even been known to [figure out encryption keys on remote servers by sending well-timed packets](https://blog.cryptographyengineering.com/2013/02/04/attack-of-week-tls-timing-oracles/) to them over the Internet. Meanwhile, the most spectacular isolation failures in recent memory were the [Meltdown and Spectre attacks](https://meltdownattack.com/), which allowed any program on a computer, even a javascript app in a web browser, to read the memory of other programs on the same computer, even across sandboxes or virtual machines.
Every new isolation technology goes through a cycle like the following, from optimism to despair:
* New idea: we'll finally get it right this time, once and for all!
* Initial experiments seem to work.
* (Users complain that it's even slower and more tedious than the last thing we tried.)
* Early fatal flaws are discovered and fixed.
* Widespread deployment.
* Ever-more-subtle flaws are successively discovered and fixed.
* Eventually, we find flaws that we simply don't know how to patch.
* Lose hope that efficient isolation is even possible with this method.
* But also we can never retire this isolation method because now too many people are depending on it.
* Repeat.
For example, at this point security people simply don't believe that any of the following (each one the very best technology available at the time) is totally safe:
* Process isolation and memory protection on a Unix system.
* Privilege separation between OS processes when remote code execution ("RCE" for security people) is allowed.
* Filtering syscalls to isolate a process.
* Mutually untrusted processes sharing a CPU hyperthread.
* Memory isolation between virtual machines on a CPU core.
As far as I know, the state of the art, the very best isolation, is something like the Chrome sandbox or [gVisor](https://github.com/google/gvisor). The big browser vendors and cloud providers all use tools like these. The tools remain imperfect, but providers do chase down every new breach as fast as they can, and the rate of new flaws is fairly slow.
Isolation is better than it's ever been before… if you put all your isolation at the virtual machine (VM) level so that your cloud provider can do it for you because nobody else knows how, or updates often enough.
If you trust your cloud provider's VM isolation, you can have hope that all known problems are mitigated; but we have every reason to think more problems will be found.
That's… actually pretty good, all things considered. At least we have *something* that works.
#### Great! VMs for everything!
Well, hold on. Spinning up an isolated VM for every little module is a pain. And how big is a module?
Long ago, when Java first came out, the dream was that every line of every function in every object could have permissions enforced, even between objects in the same application binary, so that CPU-enforced memory protection wouldn't be needed. Nobody believes anymore that they can make that work. And marketing claims like "cloud functions" aside, nobody really thinks you should try.
None of the currently-known isolation methods work *perfectly*, but each of them works to *some approximation*. Increasingly skilled attackers, or increasingly valuable targets, require better and more annoying isolation. The best isolation we know right now is inter-VM sandboxing provided by tier-1 cloud providers. The worst, well, it goes down to zero.
Let's also assume, skipping over the evidence, that most systems are so tightly coupled that **a reasonably skilled attacker can break through laterally between modules.** So, for example, if someone can link a malicious library into your Go or C++ program, they can probably take control of that entire program.
Similarly, if your program has write access to a database, attackers can probably make it write *anywhere* in the database. If it can contact the network, they can probably contact *anywhere* in the network. If it can execute arbitrary Unix commands or system calls, they can probably get Unix root access. If it's in a container, they can probably break out of the container and into other containers. If malicious data can [crash the png decoder](https://imagetragick.com/), they can probably make it do anything else the decoder program is allowed to do. And so on.
An especially powerful form of attack is getting the ability to commit code, because that code will eventually be run on developer machines, and some developer or production machine somewhere probably has access to do what you want to do.
The above is maybe a little too pessimistic, but making those assumptions can help avoid overcomplicating your systems without improving actual security. In [Some thoughts on security after ten years of qmail 1.0](https://cr.yp.to/qmail/qmailsec-20071101.pdf), Daniel J. Bernstein points out (if I may heavily paraphrase) that many of the defenses he added in qmail, particularly isolating the different components from each other using chroot and different Unix uids, were not worthwhile and have never paid off.
Anyway, let's take it for granted that attackers with the ability to execute code can "usually" jump laterally between coupled modules, for *almost* any module isolation technique. That means there are only two kinds of module boundaries:
* **Trustworthy:** Boundaries where the two modules mutually trust each other not to be malicious and therefore can use **weak isolation.**
* **Untrustworthy:** Boundaries where modules do not trust each other, so they must use **strong isolation.**
I'm not saying anything terribly insightful here. Popular modern platforms are already built around this distinction.
For example, Chrome runs random web javascript in strongly isolated sandbox VMs because web pages are untrustworthy.
Most OSes run native apps as mere processes (no sandbox), with shared filesystems, network namespaces, etc, because we once thought they were relatively trustworthy. (And that's how viruses happened.)
Experts don't trust multi-user unix systems anymore, because process isolation turned out to be weak. Cloud VMs default to passwordless sudo, because root vs non-root isolation turned out to be weak, so why even bother.
(We still make people type sudo to help reduce the impact of human error when deleting all your files or whatever.)
Shared libraries and DLLs from multiple vendors get linked into apps from other vendors because all the code is assumed trustworthy. (This opens the way to supply chain attacks via open-source library vendors. I remain surprised these don't happen a lot more often. In my cynical moments, I think maybe they do, and they're just rarely detected.)
Phone OSes get jailbroken because app store restrictions are supposed to make app sandboxes trustworthy enough, but the isolation still invariably turns out to be too weak.
Kubernetes and Docker run multiple not-well-isolated containers in a single machine or VM because the containers are all, implicitly, considered trustworthy. They strongly recommend that you don't try to run a "multi-tenant" Kubernetes cluster (with untrustworthy apps acting on behalf of separate, not mutually trusted, users) because container isolation turns out to be weak.
Oh also, even if you use strong isolation like gVisor'd VMs for every service, that won't help if the code itself isn't built using a strongly isolated toolchain. If one set of people can update a library that is then linked into a set of apps, then those apps are not really isolated from each other, no matter how they are run.
#### Module boundaries vs service boundaries
If so many isolation layers are weak, why do we even bother with them?
History, mostly; security would be not much impacted, and simplicity would be improved, if we threw away most of these layers. I expect this will happen, over time. We're already seeing this trend. Multi-user unix systems are almost extinct; "serverless" servers abandon all isolation types except the strongest kind and helpfully try to lock you into your cloud provider while you're there.
But let's leave history aside. I had to introduce all those isolation concepts so I can say something simpler: **you almost never define module boundaries for security reasons.**
Instead, module boundaries typically follow [Conway's law](https://en.wikipedia.org/wiki/Conway's_law). People break up modules based on how they want to subdivide the development work on their team, and modules end up communicating based on how the teams and teammates communicate. (Conway's law is fascinating and real, but you can read about it in many other places. Let's skip it for now.)
What module boundaries *don't* do is define the size of a unit of deployment.
Look at operating systems, for example:
* ChromeOS has thousands of developers, but users receive a single update containing a fully-tested combination of Linux kernel, device drivers, window manager, web browser, etc. The interfaces between these modules could change in any version because they don't need backward compatibility (except of course with hardware, and the web). macOS, iOS, and Android follow a similar model.
* Debian Linux has thousands of developers, but users download and install individual packages. You can run one package from ancient Debian-oldstable alongside a new package from today's Debian-unstable, and most likely it'll work. Probably nobody has ever tested your particular combination, but probably it works, because of very strongly defined interfaces between packages.
(People make jokes about the unreliability of "Linux on the desktop." They're always talking about the second, niche, hard-to-test kind, not the first, mainstream, easier-to-test kind. I don't think the perceived quality difference is actually caused by corporate money vs open source. The difference is the deployment model.)
Both systems contain numerous packages (modules) developed by numerous developers organized into teams. Both of them have interfaces between modules. If you drew a boxes-and-arrows diagram of each system, it would probably look pretty similar: kernels, drivers, windowing systems, sandboxes, web browsers, etc.
And yet, if these were backend cloud **services** instead of OSes, we would call these two models *monoliths* and *microservices*, respectively, because of their deployment models. One has only one deployed "service," while the other has lots of them, each deployed separately. For the same module architecture! What's going on?
Module boundaries and service boundaries are two different things.
#### Where should I put my service boundaries?
Let's review our original modularity goals:
1. **Isolation:** If you really need strong isolation for security purposes, you need separate services for now, because the only way to roll out isolated VMs is separately.
(Note though: this is more of a limitation of our isolation systems, not an architectural goal. "Infrastructure as code" and [blue/green deployments](https://martinfowler.com/bliki/BlueGreenDeployment.html) try to get these services back in sync again, so you can have a monolithic deployment model.)
2. **Connection:** follows Conway's law. Module boundaries tend to follow your team's personal communication patterns. But counterintuitively, Conway's law needn't define service boundaries.
3. **Compatibility guarantees:** pressure you toward monoliths. This is especially true if your monolith is written in a type safe language like Go, TypeScript, Rust, or even C++. (eg. Chrome is one giant binary.)
4. **Upgrades, downgrades, and scalability:** These are mainly what determines your service boundaries. Let's talk about them a bit more.
Here are some things to think about when choosing service boundaries:
* **Does your monolith take a long time to startup?** That makes upgrades a pain, so you might want to split out the slow part to make upgrading other things go faster.
* **Do you need the right datastore schema version?** That sometimes requires lockstep upgrades/downgrades of all instances of a backend so they're on the same schema version. Lockstep upgrades are risky and tend to prevent rollbacks; you sometimes want to keep the schema-dependent part as small as possible.
* **Are continuous integration tests frequently failing?** If so, then I have bad news. Those failing tests are saying your code is broken. That's a feature! Splitting services and rolling them out separately will probably fool your tests into passing, but then you'll have compatibility and version skew problems in production instead. That's no help.
* **Do some parts scale differently from other parts?** For example, some operations are memory-heavy while others are CPU-heavy. This is not important as often as you'd think. If all your instances are load balanced properly, then the load tends to naturally spread around in a pretty efficient way. If load balancing becomes a problem, you can measure it and fix the specific granularity problem later.
* **Do expensive requests need to be run with less parallelism?** A common microservice architecture is to dump requests into a message queue and have worker instances process requests sequentially. But this goes wrong more often than you'd think, and [there are better designs](https://cpitman.github.io/microservices/2018/03/25/microservice-antipattern-queue-explosion.html) that avoid "queue explosion" problems. You can implement those same designs in a monolith.
* **Do you have services with different quality/reliability targets?** This can be a good reason to split services. For example, at Tailscale we have only a couple of services with very strict uptime goals: the [coordination service](https://tailscale.com/blog/how-tailscale-works/) and the [log catcher service](https://tailscale.com/blog/the-log-blog/). Those two are already split for security isolation since logs are so sensitive. On top of that, our "real-time" log/metrics processing pipeline can tolerate more downtime and therefore more experimentation, so it's split from the high-reliability services and can have different deployment procedures.
In truth, most of the above are usually pretty uncompelling reasons to create boundaries between services. They can be great reasons to create boundaries between modules or teams! But you can roll out the modules after recombining them into one or a few monoliths.
Remember, ChromeOS is a monolith. iOS is a monolith. Your team is probably much smaller than either of those teams. You simply don't need to juggle a lot of microservices to get what you want. Architect things the easy way until you're absolutely forced to do them the hard way. That's what we do.
**Update 2021-02-24:** oh yeah, [also
combinators](https://news.ycombinator.com/item?id=26252633)
Share
Author
Avery Pennarun
Author
Avery Pennarun
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