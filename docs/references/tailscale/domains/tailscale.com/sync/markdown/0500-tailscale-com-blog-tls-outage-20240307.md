About the Tailscale.com outage on March 7, 2024
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsMarch 29, 2024
# About the Tailscale.com outage on March 7, 2024
On March 7, 2024, tailscale.com was unavailable for approximately 90 minutes due to an expired TLS certificate. We were able to identify and address the issue quickly, and the downtime was mostly limited to our marketing materials and documentation, with a few exceptions we address below. Still, any unexpected downtime is a problem, and we want to take an opportunity to explain exactly what happened, what the impact was, and what steps we’ve taken to ensure it doesn’t happen again.
## [What happened](#what-happened)
We rolled out a major website refresh that included a migration to a new hosting provider in December of 2023, just about exactly 90 days before the outage. Keen-eyed readers may recognize that detail as foreshadowing. Our configuration is also a little unusual: because our hosting provider does not natively support IPv6, and because IPv6 is important to us and to our users, we run our own proxy to resolve such requests and list “extra” AAAA records accordingly.
That arrangement is deemed a “misconfiguration” by that provider, and we’ve been receiving alerts about it since rolling it out. We did not realize (and the alerts didn’t specify) that the configuration would prevent automatic certificate renewal from completing. One more bit of bad luck: Although we had probers checking certificate expirations, they were only checking over IPv6. As a result, our probers did not surface the impending certificate expiry because they were hitting the proxy—which had a valid certificate that we were managing independently.
In the absence of automatic renewal, the certificates for tailscale.com and www.tailscale.com expired on March 7, disrupting access to the site.
## [The impact](#the-impact)
Fortunately, most Tailscale operations do not require accessing the main website, so many users did not experience any interruption to normal Tailscale usage. The major disruptions instead were:
* Tailscale documentation, which lives at [https://tailscale.com/kb](https://tailscale.com/kb), was inaccessible during the downtime, along with our blog and other reference materials that are available through our website
* Although our admin console and other settings pages were unaffected, users who did not know to navigate directly to [https://login.tailscale.com/](httsp://login.tailscale.com) were unable to access those pages and may have assumed that they were offline
* Our quick install script, hosted at [https://tailscale.com/install.sh](https://tailscale.com/install.sh), was also unavailable, which interfered with some installations (including some automated installs)
The domains that actually serve Tailscale packages for installation remained accessible, and we believe that any interruptions to resolution through Go’s `go get` mechanism were minimal [thanks to caching](https://go.dev/blog/supply-chain#the-vcs-is-the-source-of-truth).
## [Steps to fix](#steps-to-fix)
Once we had determined what the problem was, we responded by temporarily removing the “extra” AAAA records and manually renewing the certificates in question. That immediately resolved the user-facing issue.
Of course, we still want our site and our services to be available over IPv6, so we restored those records immediately thereafter. That means the root issue with renewal is still a problem, and we plan to address it in the short term much like our ancestors did: multiple redundant calendar alerts and a designated window to manually renew the certificates ourselves. We also plan to update our prober infrastructure to check IPv4 and IPv6 endpoints separately.
We also hope to make our proxy unnecessary by supporting IPv6 in a more straightforward way in our website infrastructure.
Finally, while we will endeavor to avoid any outage, it is a nice benefit of Tailscale’s design that this blip did not interrupt most uses for most users. One of our guiding principles is enabling direct connectivity between your machines and services, and that means your network is less reliant on any particular endpoint—even tailscale.com—being available at any given time.
Share
Author
Parker Higgins
Author
Parker Higgins
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