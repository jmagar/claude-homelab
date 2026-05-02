Tailscale Enterprise Plan 9 Support
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productApril 01, 2025
# Tailscale Enterprise Plan 9 Support
**April 1, 1999**
FOR IMMEDIATE RELEASE
MURRAY HILL, NJ — Tailscale, the leading provider of effortless, private networking for modern distributed computing, today announced support for [Plan 9](https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs)™ from Bell Labs™, the operating system redefining how networks, resources, and computation are managed. With Tailscale’s cutting-edge peer-to-peer networking capabilities now seamlessly integrated into Plan 9’s file-centric world, users can securely connect their machines across the globe as if they were on the same local network—with zero manual configuration.
*“That was kinda the Plan 9 plan from the get-go”*, said [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike), one of the architects of Plan 9. *“Surprised it took so long”.*
By leveraging the power of **WireGuard®** under the hood, Tailscale ensures that all network traffic between Plan 9 machines is **end-to-end encrypted**, eliminating security risks while maintaining blazing-fast performance. This integration unlocks **unprecedented possibilities** for Plan 9 users:
* **Global Namespaces, No Borders** – With Tailscale, a Plan 9 user can seamlessly mount remote file servers, share namespaces, and interact with distributed computing resources—from anywhere.
* Run [**Tailscale SSH**](https://tailscale.com/tailscale-ssh)**,** a modern SSH server built in to Tailscale for Plan 9, enabling you to securely connect from your legacy operating systems and get back to your familiar [rc shell](https://en.wikipedia.org/wiki/Rc_(Unix_shell)), without worrying about passwords, keys, or certs.
* **Skip learning** [**factotum**](https://swtch.com/~rsc/papers/auth.html) and use Tailscale’s ACL configuration instead.
* Harness the **cutting edge 32-bit** **power of the Pentium III and its new [SSE](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions) instructions** using the new [Enterprise Plan 9 distro](https://github.com/rsc/plan9), the first Tailscale-certified Plan 9 distro.
* [**Collect the services**](https://tailscale.com/kb/1100/services) running on your machines, powered by Plan 9’s innovative `/proc` and `/net` file servers.
* Seamlessly integrate [**Tailscale’s MagicDNS**](https://tailscale.com/kb/1081/magicdns) with Plan 9’s [`ndb(7)`](https://9fans.github.io/plan9port/man/man7/ndb.html).
* Use **Plan 9's native IPv6 support**, [just approved](https://datatracker.ietf.org/doc/html/rfc2460) as a draft standard, or fall back to legacy IPv4 and rely on direct connections via Tailscale's stopgap NAT traversal support that will obviously be retired once the short IPv6 transition is complete.
Early reactions to Tailscale Subsystem for Plan 9 have been overwhelmingly positive:
“*Using Tailscale with Plan 9 makes it easy to connect to the Bell Labs networks from anywhere, even my college dorm room*.”, said Plan 9 torchbearer [Russ Cox](https://research.swtch.com/). “*It feels like the future has arrived*.”
*"You want a quote for this astonishing event. That's awkward."*, said the [iconic](https://spinroot.com/pico/pjw.html) Peter J. Weinberger, facing an uncharacteristic loss for words.
*"Please tell me this isn't why the Tailscale logo has nine dots"*, said [`{tails,scales}.txt`](https://github.com/tailscale/tailscale/tree/main/words) curator emerita [Charlotte Brandhorst-Satzkorn](https://bsky.app/profile/catzkorn.dev).
### Pricing
Rather than a bespoke license that might hinder the community, our lawyers have approved making [Tailscale for Plan 9 available free of charge](https://github.com/tailscale/tailscale/pull/15491) under an [OSI](https://en.wikipedia.org/wiki/Open_Source_Initiative)-approved, restriction-free license.
Tailscale Enterprise Support for Tailscale for Plan 9 is additionally now available for customers with [suitably sized](https://en.wikipedia.org/wiki/Caterpillar_797) containers of cash.
### Availability
Tailscale for Plan 9 is [available today](https://github.com/tailscale/tailscale/pull/15491). Existing Plan 9 users can mount the binaries into their namespace at `/n/ftp/tailscale\*` using [`ftpfs`](https://en.wikipedia.org/wiki/FTPFS) `-t -a anon ftp.plan9.ts.net` or get the source code from a [local CVS server](https://github.com/tailscale/tailscale/). When building from source, for best results use `GOOS=plan9`, `GOARCH=386`, and Go [HEAD](https://github.com/golang/go/) or [Tailscale’s Enterprise Go](https://github.com/tailscale/go/).
For users of legacy operating systems, two evaluation options are available: 1) [a web-based emulator of Tailscale Enterprise Plan 9](https://copy.sh/v86/?profile=custom&amp;m=768&amp;vram=16&amp;hda.url=https://ftp.plan9.ts.net/plan9.img&amp;hda.size=16000000&amp;nojoke=1) if you’ve been waiting to be able to SSH from your laptop into an OS running in your browser on your laptop, 2) a [qemu environment](https://github.com/rsc/plan9). Alternatively, download the [16 MB disk image](https://ftp.plan9.ts.net/plan9.img) and use the hypervisor of your choice.
Be aware that like the [twelve-fingered pianist](https://www.youtube.com/watch?v=rUOlnvGpcbs&amp;t=180s) in the recent hit [Gattaca](https://en.wikipedia.org/wiki/Gattaca), Plan 9 [requires](https://www.youtube.com/watch?v=Dt3Dr3jUPjo) a three button mouse. Users lacking the requisite mice buttons will need to use modifier keys while clicking.
For more information, see [**tailscale.com/plan9**](http://www.tailscale.com/plan9).
### Acknowledgements
[Glenda](https://9p.io/plan9/glenda.html), the Plan 9 bunny, was drawn by [Renée French](https://en.wikipedia.org/wiki/Renée_French).
### Join our Webinar
Join us tomorrow (Wed [9am Pacific, 16:00 UTC](https://everytimezone.com/s/1c736089?t=67ec7e00,960)) with RealPlayer for our [technical deep dive webinar](https://ftp.plan9.ts.net/webinar) & [blog post](https://tailscale.com/blog/plan9-port) on how Tailscale Enterprise Support for Plan 9 was made. For best streaming, a 56k modem is recommended.
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