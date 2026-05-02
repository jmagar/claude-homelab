November Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 30, 2022
# November Tailscale newsletter
👉 We’d love to hear what you think about Tailscale, and filling out this[Google form](https://docs.google.com/forms/d/e/1FAIpQLSdUzQfTOTaurTbviJO4_vbipN8JpbZr7_OLkxqlODZXnkF_tQ/viewform)helps us build a better product for you!
🛎️ Tailscale has recently been notified of security vulnerabilities in the Tailscale Windows client. If you are running Tailscale on Windows,[upgrade](https://tailscale.com/blog/windows-security-vulnerabilities)to Tailscale v1.32.3 or later, or v1.33.257 or later (unstable), to remediate the issue.
🚀 It’s been a dramatic month across the tech industry, but we have some good news: Tailscale is hiring! We’re looking for driven individuals who think differently, enjoy collaborating with highly technical remote teams, and are comfortable working asynchronously. See our open roles below, and learn more about[our company vision](https://tailscale.com/company).
* [Developer Advocate](https://boards.greenhouse.io/tailscale/jobs/4093171005)
* [Software Engineer: Data](https://boards.greenhouse.io/tailscale/jobs/4041710005)
* [Technical Writer](https://boards.greenhouse.io/tailscale/jobs/4131985005)
* [Product Manager](https://boards.greenhouse.io/tailscale/jobs/4053245005)
* [Senior Product Designer](https://boards.greenhouse.io/tailscale/jobs/4051721005)
* [Recruiter](https://boards.greenhouse.io/tailscale/jobs/4038875005)
Despite gearing up for eating turkey (for those of us in the U.S., anyway), we’ve had a lively November at Tailscale. We launched[Tailscale Funnel](https://tailscale.com/kb/1223/tailscale-funnel/), which makes it simple (and still secure) to route traffic from the internet to a node in your tailnet. We’ve developed a guide for using tsnet to make your internal services easier to run, access, and secure; and we put together an inside look at how we built our new[webhooks](https://tailscale.com/blog/webhooks/)feature. Plus: Tailscale has joined the Fediverse! You can now[follow us on Hachyderm](https://hachyderm.io/@tailscale).
We’ve got lots of community contributions and new Tailscale features to share. Let’s jump in:
### From the community
[**Build a Tailscale exit node with firewalld**](https://major.io/2022/10/27/build-a-tailscale-exit-node-with-firewalld/)
Major.io covers how to create an exit node for your Tailscale network using firewalld Fedora, CentOS Stream, and Red Hat Enterprise Linux (RHEL).
[**Private Kubernetes ingress with Contour and Tailscale**](https://schmatzler.dev/articles/private-kubernetes-ingress-with-tailscale)
Twitter user[@cschmatzler](https://twitter.com/cschmatzler)declares: “The star of the show here is Tailscale.”
[**The Download: Featuring Tailscale’s WASM SSH client**](https://www.youtube.com/watch?v=EazHhUHZZms)[video]
[Christina Warren](https://twitter.com/film_girl)explains on GitHub’s YouTube channel that “Tailscale makes it really easy to SSH into your various devices from anywhere in the world” without “getting stuck in a black hole of networking and DNS errors.”
[**Building virtual networks with Pulumi and Tailscale**](https://www.pulumi.com/resources/building-virtual-networks-with-pulumi-and-tailscale/)
Register for a one-hour Pulumi workshop that will demonstrate how to securely connect end-user devices and cloud resources using modern infrastructure as code written in real programming languages.
[**How to create your own VPN with Tailscale**](https://a.wholelottanothing.org/2022/11/07/how-to-create-your-own-vpn-with-tailscale-to-get-around-stupid-free-wifi-network-rules-and-protect-your-traffic)
[Matt Haughey](https://mastodon.cloud/@mathowie)at A Whole Lotta Nothing shares how to create your own VPN with Tailscale “to get around stupid free Wi-Fi network rules and protect your traffic.”
[**Tailscale on a Linux Guix machine**](https://github.com/clojure-quant/infra-guix/blob/main/DOC/SETUP/tailscale-with-guix.md)
GitHub user[awb99](https://github.com/awb99)created a custom[Guix Tailwind package](https://github.com/clojure-quant/infra-guix/blob/main/modules/awb99/package/tailscale.scm)and a[custom Tailwind service](https://github.com/clojure-quant/infra-guix/blob/main/modules/awb99/services/tailscale.scm)for getting Tailscale to work on Guix.
[**Exchanging OIDC tokens for Tailscale auth keys**](https://github.com/jsiebens/tskeyservice)
Twitter user[Johan Siebens](https://twitter.com/nosceon)shares a “[Friday morning hack](https://twitter.com/nosceon/status/1590976987468034048): a little service exchanging OIDC tokens for short-lived, one-time use Tailscale auth keys."
[**Remote reboots with encrypted disks**](https://tavianator.com/2022/remote_reboots.html)
Blogger[Tavian Barnes](https://twitter.com/tavianator)explains how Tailscale helps him remotely reboot his computer with full disk encryption.
[**The Kubelist Podcast, ep. 33: Tailscale with Avery Pennarun**](https://www.heavybit.com/library/podcasts/the-kubelist-podcast/ep-33-tailscale-with-avery-pennarun)[audio]
Hosts Marc Campbell and Benjie De Groot chat with[Avery Pennarun](https://twitter.com/apenwarr)about VPNs, mesh-overlay networks, the relationship between scaling and architecture, and lots more.
[**A HashiCorp Vault plugin for managing Tailscale authentication keys**](https://github.com/davidsbond/vault-plugin-tailscale)
GitHub user[David Bond](https://github.com/davidsbond)offers a HashiCorp Vault plugin for generating device authentication keys for Tailscale.
### From the team
[**Introducing Tailscale Funnel**](https://tailscale.com/blog/introducing-tailscale-funnel/)
With[Tailscale Funnel](https://tailscale.com/kb/1223/tailscale-funnel/), you can publicly share things from a node in your tailnet for anyone to access, even if they don’t have Tailscale.
[**Tailscale on the Fediverse**](https://tailscale.com/blog/2022-11-16-fediverse)
We want to make it easier for you to keep in touch with us, so we’ve created a[Fediverse account](https://hachyderm.io/@tailscale) on [Hachyderm](https://hachyderm.io/explore).
[**Virtual private services with tsnet**](https://tailscale.com/blog/tsnet-virtual-private-services)
Tailscale’s[Xe Iaso](https://twitter.com/theprincessxena)covers how to use tsnet to get all of the goodness of Tailscale in userspace so that you can have your services join your tailnet like they were separate computers.
[**Making your Tailscale experience a little more eventful with webhooks**](https://tailscale.com/blog/webhooks-design)
Laura Florea offers an insider’s look into how Tailscale developed one of our most requested features: webhooks.
### Tailscale in real life
[**Tailscale Runs Anywhere I Need (TRAIN)**](https://tailscale.com/blog/trainscale/)
[Katie Reese](https://twitter.com/katiereese317)explains how 11 Tailscalars boarded a train from San Francisco to Seattle to prove that[Tailscale really can run anywhere](https://twitter.com/Tailscale/status/1592959142276128769).
### Tailscale learning library
We are building a learning library to help folks at any stage in their career. If you have a topic you’d like to see covered, send us a tweet[@Tailscale](https://twitter.com/Tailscale).
[**Understanding mesh VPNs**](https://tailscale.com/learn/understanding-mesh-vpns/)
Mesh VPNs use a peer-to-peer architecture to offer greater resiliency, scalability, and performance than conventional VPNs. This article outlines the features, benefits, and use cases of mesh VPNs.
[**Why remote workers should use a VPN**](https://tailscale.com/learn/remote-worker-vpn/)
As the popularity of remote work has skyrocketed, so have malicious attacks attempting to gain access to companies’ infrastructure and assets. Explore how using a virtual private network can help remote workers keep their company network secure.
That’s all for now. Stay well!
🔈P.S. Leaving a review on G2 helps more teams find Tailscale. We’d really appreciate it if[you took the time to put in a good word](https://www.g2.com/products/tailscale/reviews/start?return_to=https://www.g2.com/products/tailscale/take_survey).
Share
Author
Mark Ogilbee
Author
Mark Ogilbee
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