We get stuck opening the socket
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 12, 2021
# We get stuck opening the socket
I have a soft spot for the Unix sockets API.
Yes, it is clunky to get started and has grown some odd options over
the decades.
It is usually buried now under higher level programming layers.
But at the heart of it is a small and versatile interface that is easy
to build on and easy to recreate:
* read(socket, bytes)
* write(socket, bytes)
What bytes, how many bytes, and in what order are up to you.
Under the hood TCP gives you reliable transmission.
It is a quick and fun way to write a network program.
Streams of bytes can contain discrete request-response messages, be
used as a message bus, A/V streams, they can be multiplexed and
demultiplexed… there are many ways to use them.
As a bonus, most programming languages can represent streams of bytes
efficiently, so sockets make for good protocol boundaries.
It also has the great benefit of being a stable technology.
I first bound a socket in the mid-90s, and the same code works today.
Unfortunately, the OS socket API has become less useful as the
internet has become ubiquitous.
There are several culprits.
The first problem is addressing asymmetry.
Most devices are buried behind NAT today, meaning that only an
ever-smaller set of “servers” can listen on a socket others can connect to.
That’s fine for some programs, but breaks other programs.
(It’s especially unfortunate for some of the more fun games you can play
where, as part of a protocol you create new temporary sockets.)
The second problem is the lack of good authorization and authentication
in the fundamental mechanisms used to create sockets.
The core addressing scheme for network sockets is an IP address, port
number pair.
We have DNS to give nice names to the IP addresses, and some
(inflexible) protocol conventions for picking port numbers.
Neither IP addresses nor domain names on the public internet are
adequate to ensure who you are connecting to is who you think you are
connecting to.
The converse problem holds: when a server receives a connection, who
connected to it?
On corporate or university networks of the 90s, you could trust the
intermediaries and use IP addresses for this security.
That simply does not hold on the internet today.
The third problem today is that communication should be end-to-end
encrypted.
The result is anything can dial anyone, without either side being sure
who the other is, and have a conversation that can be read by some
unknown number of intermediaries.
You can see why sockets have fallen out of style!
There are lots of tools and technologies for resolving some of these
flaws.
TLS can ensure the caller knows who they are calling and encrypt the
socket, assuming you trust your OS root certificates.
In theory TLS can assure the server of who the client is, but that
[does not work well](https://twitter.com/colmmacc/status/1057017343438540801).
There is per-connection overhead and you cannot connect into a NAT.
You can use ssh too, though there is no root authority so it is up to
you to distribute keys safely from clients to servers and vice versa.
This creates trust on first use (TOFU) system that is not easy to
use safely!
Given the limits of these technologies, more are built on top, such
as HTTP based authentication and RPC schemes.
Then you are left with a message-based system that is good, but can’t do
everything, so eventually byte streams get reimplemented on top!
If you are a seasoned programmer familiar with network code, you are
probably nodding along and there is a good chance you are resigned to this.
We need auth and encryption, it’s hard, so we do the hard work upfront
before we start solving the problem we set out to solve.
Buying scarce public IPv4 addresses and configuring layers of
technology is the price of doing business.
But look at this from the perspective of a teacher to new programmers.
In your first week your students can be doing graphics programming,
2D with CSS and JS, 3D with a game engine.
The next week they can build an ML model with PyTorch or TensorFlow and
deploy it into their graphics program.
But what network programming could your first-week students do?
A 90s textbook would teach toy socket programs, maybe implement ftp or
telnet and a multiplayer game.
Those techniques are dangerous today though to deploy, and your
students would need to do it from a static IP on the server and client
to get the full power.
It would be a fiddly and misleading tutorial.
All that’s left is bringing up a web server with a LetsEncrypt cert,
teaching a high level RPC library, all from a cloud VM with a public IP,
or training students on one of the proprietary, non-portable, Serverless
Towers of Babel.
Better to skip networks altogether and teach it as an “advanced” class
in either very low level programming where you need to configure safe
transports, or at the very high level locked into someone’s proprietary
ecosystem.
Streams are easy once you get going.
We have been defeated by high activation energy!
There should be many projects working on fixing this.
There is no joy to be found in X.509 or ASN.1, let alone the
precarious and miserable task of distributing keys and certificates.
Before anyone can start writing a network program there are huge upfront
costs.
We have to change that.
The project I am committed to for simplifying these tasks is,
unsurprisingly, Tailscale.
Stick to Tailscale IPs and your software knows the person it is dialing
when it connects to an IP. The software at the other end knows who
connected to it, just by IP.
Only WireGuard encrypted packets feed those addresses, and the
WireGuard keys are tied to a strong third-party identity system
like GitHub accounts.
Tailnets provide these features through the OS sockets API.
A local whois service lets you see the people behind the IPs, all E2E
encrypted and through any typical NAT without any static IPs.
But the more I enjoy writing basic socket programs or auth-less web
servers on my private tailnet, the more I am shocked when I return to
the everyday world of professional network programming, with its
byzantine labyrinths of network goop and cloud intermediaries, all to
get a few bytes reliably between two people.
Network programming has to change.
Could tailnet-style networks be widely enough deployed to provide a
basis for network programming?
Should these features be part of the OS?
There are a lot of ways network programming could go, but I’m becoming
increasingly confident that OS sockets are not just the way programs
used to be written, but will be the way to network in the future.
Share
Author
David Crawshaw
Author
David Crawshaw
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