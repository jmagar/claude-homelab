Enable Egress Traffic Visibility for Forensic Analysis in Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMay 24, 2024
# Expanding egress traffic visibility
Today we’re bringing a new network visibility option to our Enterprise customers by allowing them to monitor destination addresses for traffic egressing the network through an exit node. This will allow customers to run more advanced forensic analyses during active or historical security incidents.
## [A brief history](#a-brief-history)
When we introduced [network flow logs](https://tailscale.com/kb/1219/network-flow-logs), we intentionally redacted exit node traffic destinations from our network flow logging. The primary reason was abuse mitigation, plain and simple. Exit nodes are not intended to be used to “snoop” on network activity; instead they’re designed to secure traffic to the internet even when using untrustworthy network connections. Providing an easy way to log destination traffic from an exit node breaks those inherent security and trust benefits.
## [Forensic analysis](#forensic-analysis)
There are, however, valid use cases for this visibility. Namely, enterprises need simple ways to perform forensic analysis when indicators of compromise pop up on the network. Usually, that means some sort of an info-sharing program, bug report, phishing report, or internal security incident has “raised the alarm” to conduct a forensic analysis on a particular endpoint in the network. When performing a forensic analysis, security teams need to know what resources a potentially compromised device has accessed during the incident time frame, they need to lock that device down, and they need to see any related attack vectors. For a lot of these processes, gaining visibility into the external endpoints a device is accessing can help the team assess an incident’s “blast radius”.
Under common frameworks like [MITRE’s ATT&CK](https://attack.mitre.org/), logging external network traffic is useful in discovering lateral movement, identifying external command and control networks, alerting on data exfiltration, and more.
## [Enable exit node destination logging](#enable-exit-node-destination-logging)
Customers on a Tailscale Enterprise plan can enable exit node destination logging today. Navigate to the [network flow logs](https://login.tailscale.com/admin/logs/network) page in the Tailscale admin console; from the Logging “**Actions**” menu, choose “**Enable exit node destination logging**.” You can later disable the feature from the same place.
Enable exit node destination logging in the Tailscale admin console.
As always, you can find more information about exit nodes and how to use them in our [knowledge base](https://tailscale.com/kb/1103/exit-nodes).
Share
Author
Kabir Sikand
Author
Kabir Sikand
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