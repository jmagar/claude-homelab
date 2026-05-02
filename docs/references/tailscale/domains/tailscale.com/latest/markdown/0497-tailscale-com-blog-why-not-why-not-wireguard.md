Why not "Why not WireGuard?"
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 23, 2020
# Why not "Why not WireGuard?"
An article by Michael Tremer titled [Why not WireGuard](https://blog.ipfire.org/post/why-not-wireguard) is sometimes shared in VPN discussions. Unfortunately that article contains several misconceptions and some out-of-date information that deserves to be addressed.
Let’s go through his arguments section by section:
#### Will WireGuard replace my (IPsec) site-to-site VPN?
Tremer writes:
>
> No. There is no chance the big vendors […] will pick up WireGuard. They do not jump onto trains like this unless there is a big necessity.
>
When he says this, Tremer is talking about commercial VPN hardware/software vendors who mostly use a centralized [hub and spoke](http://tailscale.com/blog/how-tailscale-works) architecture.
Although it’s true that most IPsec VPN vendors are unlikely to upgrade to WireGuard, users we hear from are only rarely trying to make their existing VPN concentrators work with a new protocol. Instead, they are eager to replace their bottlenecked VPN concentrators with something more lightweight and less restrictive. WireGuard replaces your VPN hardware with a simple software solution, so it doesn’t need support from your legacy hardware vendor.
#### Will WireGuard replace my road warrior from laptop to data center?
Tremer writes:
>
> Right now, WireGuard has a huge backlog of features that it needs to implement to be suitable for this use-case. It does not, for example, allow using a dynamic IP address on the server side of the tunnel which breaks a whole use-case.
>
The article claims WireGuard is missing a “huge backlog of features,” but only lists dynamic IP addresses as a missing feature. The “huge backlog” may be out-of-date information from earlier WireGuard versions.
This section of the article is confusing at first because it talks about “road warrior” users (who generally have dynamic IP addresses) not being supported by WireGuard. But this is not true; standard WireGuard happily works as long as at least one end (usually the central VPN concentrator) has a static IP address.
The rest of the section appears to be discussing the problems caused by both ends of a connection having dynamic IP addresses (for example, so you can get to an office network whose home connection uses dynamic DNS). It’s true that plain WireGuard does not support this configuration out of the box. However, there are various scripts and higher-level tools (including ours) that make this work fine.
**Update 2020-04-28:** A few people responded that WireGuard does work fine even if *both* ends are on dynamic IP addresses. This is not true out of the box. You can configure a WireGuard client to point at a server’s DNS name, and that DNS name can be updated periodically using dynamic DNS. However, the standard WireGuard software only resolves the DNS name once at startup, so if the server hops to a new address, you will need to restart each client’s WireGuard instance before it looks up the DNS name again. Various tools and scripts exist to automate this process for both WireGuard and IPsec. Tailscale resolves this issue too, but in a different way.
#### So it is easy to use then?
Tremer writes:
>
> Is IPsec really hard to use? No, it clearly is not if the vendor has done their homework right and provides an interface that is easy to use.
>
In this section, Tremer argues that IPsec is not very hard to use after all — in contradiction to the experiences of most readers — and points out that you only need to specify your own public IP address, the public IP of your peer, the subnets you want to make available for each side, and a pre-shared key. After that, the VPN “is compatible with every vendor out there.”
This is a surprising set of claims. First of all, that is not the only information needed to configure IPsec: critically, correct use of IPsec requires you to specify exactly which cipher suites you want to allow. This is an unanswerable question for anyone who is not a cryptography expert. The defaults are virtually never secure or cross-platform.
The selection of cipher suites affects which IPsec vendors are compatible with each other. Far from a VPN that “is compatible with every vendor out there,” the default settings for one vendor almost never work with hardware and software from another vendor.
Secondly, he suggests that it is necessary to specify public IP addresses for both ends of the tunnel. This is mysterious given that in the previous section, he incorrectly claimed WireGuard requires exactly that,and thus would not work with dynamic IPs. In truth, both IPsec and WireGuard work fine with only one end on a well-defined IP, so in both cases, you only need to configure at most one public IP address.
Finally, he suggests using a pre-shared key (PSK) on both ends. PSKs are one of the weakest forms of authentication. (Passwords are one form of PSK.) Among other things, a key stolen from one node makes it possible to impersonate either end and forge traffic from both ends. Both IPsec and WireGuard allow public-key authentication, which is considerably stronger, but only WireGuard makes it mandatory. We’ll talk about the security dangers of IPsec’s “flexibility” below.
>
> Everyone who has ever tried to create an IPsec tunnel to an OpenBSD machine can probably tell a tale of that.
>
The author here seems to suggest that configuring IPsec on OpenBSD is complicated. Although our team is not personally familiar with IPsec on OpenBSD, we do know that configuring WireGuard on OpenBSD is easy, just like on other platforms.
#### On Protocol Complexity
Worryingly, Tremer states:
>
> The end-user does not have to worry about the complexity of the protocol. If that was an issue we would have definitely gone rid of SIP and H.323, FTP and other protocols that don’t cope well with NAT and are decades old.
>
Complexity in some protocols can be acceptable (although never desirable). But in security, it is deadly. From a [2003 paper by N Ferguson and B. Schneier](https://www.schneier.com/academic/archives/2003/12/a_cryptographic_eval.html):
>
> In our opinion, IPsec is too complex to be secure. The design obviously tries to support many different situations with different options. We feel very strongly that the resulting system is well beyond the level of complexity that can be analysed or properly implemented with current methodologies. Thus, no IPsec system will achieve the goal of providing a high level of security.
>
That paper is more than 16 years old, and IPsec has only increased in complexity. It remains nearly impossible to analyze. In 2020, it is well understood that IPsec’s excessive complexity puts it on the verge of obsolescence, now that better options are available. These problems are some of the reason for the strong shift toward TLS instead of IPsec in the decades since IPsec was standardized.
Tremer also says:
>
> User-authentication using username/password or a SIM card with EAP. […] WireGuard does not have that.
>
This statement remains true of core WireGuard. However, WireGuard is a data plane; it is intended to be used with a key exchange mechanism built on top, and there are several available for use in different situations.
Tailscale provides [one such key exchange mechanism](http://tailscale.com/blog/how-tailscale-works) (using Oauth2, OIDC, or SAML to connect to your preferred identity provider). Compared to IPsec’s very complex key negotiation protocols, it is much easier to analyze and audit the security of WireGuard, and then audit a separate key exchange mechanism on top.
#### On Ignoring Real-World Problems
Next, Tremer criticizes the “opinionated” cryptographic design of WireGuard: it only allows a single cipher suite.
>
> If you were to change the cipher you are using from one day to the next one, you would need to upgrade your WireGuard software on all those laptops, phones, etc. at the same time.
>
This statement is simply false. Someday, WireGuard will need to be upgraded to support a second cipher suite. When this happens, users will be able to configure it peer-by-peer to allow one cipher suite or the other, or both, exactly as they would with any other VPN.
Most VPNs (and TLS) offer thousands of different possible combinations of algorithms to choose from — most of which are insecure or slow or both. In contrast, a hypothetical WireGuard protocol v2 can offer just two suites, the old one and the new one, with simple advice: use the new one if you can, and allow the old one for old nodes until they’re upgraded. There’s nothing unusual about this, except you don’t need to be a cryptography expert to configure it.
#### Cryptography!
Tremer continues his claim that more crypto algorithms makes IPsec just as good as WireGuard:
>
> I would conclude that practically the same cryptography is available for all VPNs here. Therefore WireGuard is not more or less secure than the others when it comes to encryption or data integrity.
>
On the surface, this claim is true: you can assemble a cipher suite for IPsec that is roughly the same as the (only) cipher suite used in WireGuard.
However, this leaves out some important details. First of all, you have to learn how to choose and configure the right IPsec cipher suite, which only a skilled cryptographer should ever be trusted to do. And second, once you attempt to use that cipher suite, you will likely find that it’s not compatible with virtually any VPN hardware or software you can find.
Ironically, although the IPsec standard allows virtually every cipher suite, it does not mandate any of them. Two nodes can be completely IPsec compliant and yet completely unable to talk to each other, and it’s your job to figure out why.
With WireGuard, there is only one cipher suite, so you don’t need a degree in cryptography to choose it. Someday, there will likely be a second suite available. Unlike IPsec, it’s trivial to confirm whether two WireGuard-capable software packages should be able to talk to each other.
#### Is WireGuard faster than other VPN solutions?
In this section, Tremer makes several hand-wavy arguments (and no benchmarks) that, because of how CPUs have evolved, AES encryption will probably be faster than ChaCha20. Without identifying a particular platform and language to test on, it is unclear whether this claim is technically correct or not.
What matters though is, for almost all use cases, both IPsec and WireGuard are perfectly fine. The symmetric encryption you use (AES or ChaCha20 or anything else) is almost never relevant at all except on extremely fast (well over 10 Gbit/sec) networks.
(One exception is legacy VPN concentrator hardware, which tends to be built on relatively slow processors that bog down with too many IPsec users at once. But this is not really a fault of IPsec itself.)
Mobile processors are somewhat slower than desktop and server processors when doing encryption, of course, but they are also usually on much slower networks. On mobile, you should expect the symmetric crypto to take maybe 1% of the time, and slow networks to take 99% of the time.
Some non-IPsec and non-WireGuard VPN platforms carry their traffic over TCP. (Most “SSL VPNs” and “BeyondCorp proxies” are in this category.) Carrying VPN traffic over TCP is quirky and can cause slowdowns and lag with real-time traffic, such as VoIP, video calls, and remote desktops. But neither IPsec nor WireGuard has this problem.
Another issue to watch out for is [point-to-multipoint versus hub-and-spoke VPN architecture](http://tailscale.com/blog/how-tailscale-works/). In general, a hub-and-spoke architecture introduces higher latency due to extra hops. IPsec was originally intended to support point-to-multipoint architecture, but due to some major design flaws, this is almost never attempted in practice.
When configured correctly, WireGuard is capable of operating securely in point-to-multipoint mode and reducing latency. For example, a WireGuard-enabled laptop can have open connections directly to three datacenters simultaneously, instead of to one datacenter that then has tunnels to other datacenters.
#### Issues integrating into Linux
This section of Tremer’s article has become obsolete. Since his article was written, WireGuard has been accepted into the Linux kernel, and the authors have released WireGuard’s stable version 1.0.
#### What does the real world look like?
In his conclusion, Tremer says:
>
> Unfortunately every time, when a customer asks me to help them setting up a VPN, the credentials that they are getting are using old ciphers. 3DES in combination with MD5 is a common candidate as well as AES-256 with SHA1. Although the latter is better, it is still not what I would like to use today.
>
Tremer is, of course, talking about his own customers. Those customers seem to be trying to configure new software that will talk to legacy IPsec VPN servers that were configured, probably years ago, to require obsolete and increasingly insecure cipher suites. If that’s what you need to do, you have no choice; use the best IPsec software available to talk to your legacy systems.
The long-term option is to reconsider why you need that legacy VPN concentrator in the first place. WireGuard is open source, can run in a pure software virtual machine (so avoids hardware lock-in and bottlenecks), supports only a single cipher suite which is known to be very fast and very secure, and will work with whatever key exchange mechanism you want to layer on top. It is increasingly widely accepted as the future of secure VPN connectivity.
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