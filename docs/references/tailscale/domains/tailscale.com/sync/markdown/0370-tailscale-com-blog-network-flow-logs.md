Network Flow Logs & Log Streaming: Enhanced Tailnet Visibility
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 27, 2023
# Announcing network flow logs and log streaming
Tailscale takes your network’s security and reliability seriously. That’s why we built features like [configuration audit logs](/blog/config-audit-logging-ga) to help you monitor and review changes to your network. Recently, we released [network flow logs](/kb/1219/network-flow-logs), in beta, to help you monitor network activity in your tailnet. These logs allow you to detect threats, investigate security incidents, maintain compliance with your network security policies, and troubleshoot network issues.
Network flow logs record the *metadata* about your network traffic. Your connections on Tailscale are (and remain) end-to-end encrypted and we never log the *content* of your network traffic, nor do we have access to do so.
Take a look at the JSON code snippet below to see an example:
```
`{"logs": [{
"nodeId": "aBcdef1CNTRL",
"logged": "2022-10-28T22:40:00.290605382Z",
"start": "2022-10-28T22:39:51.890385065Z",
"end": "2022-10-28T22:39:56.886545512Z",
"virtualTraffic": [{
"proto": 6, "src": "100.111.22.33:21291", "dst": "100.111.44.55:63281",
"txPkts": 2, "txBytes": 108, "rxPkts": 2, "rxBytes": 112
}, {
"proto": 6, "src": "100.111.22.33:864", "dst": "100.44.55.66:2049",
"txPkts": 6, "txBytes": 900, "rxPkts": 3, "rxBytes": 728
}, {
"proto": 6, "src": "100.111.22.33:723", "dst": "100.99.888.77:2049",
"txPkts": 4, "txBytes": 596, "rxPkts": 2, "rxBytes": 432
}, {
"proto": 6, "src": "100.111.22.33:21291", "dst": "100.111.44.55:63280",
"txPkts": 2, "txBytes": 108, "rxPkts": 2, "rxBytes": 112
}],
`
```
## Monitor tailnet connections with network flow logs
Network flow logs provide insight into the traffic to and from devices on your tailnet. These logs are sent at regular intervals and are [directly tied to the device identities](/kb/1219/network-flow-logs/) that send them. This makes it easier to attribute activity patterns to specific devices over longer periods of time.
Most administrator roles can [enable network flow logs](/kb/1219/network-flow-logs/) from the admin console by visiting the Logs tab. These logs can be [accessed via our APIs](/kb/1219/network-flow-logs/) or [they can be streamed directly](/kb/1255/log-streaming) to a [security information and event management (SIEM)](/learn/security-information-and-event-management) system from the admin console. These systems are well set up for customers to index large volumes of logs, search for specific keywords and setup alerts. This enables customers to effectively monitor the health of nodes and gain visibility into traffic patterns on their tailnets. We currently support Splunk and ELK as streaming destinations, and we are working to add more partner integrations. Please let us know if you need support for a specific SIEM partner.
Watch Pouyan set up network flow logs & log streaming
Network flow logs are available on the [Premium and Enterprise plans](/pricing).
Log streaming for both network flow logs and configuration audit logs is available on the[Enterprise plans](/pricing).
Ready to use the feature? Go to [admin console](https://login.tailscale.com/admin) to enable it and try it now!
Share
Authors
Pouyan Aminian
Jairo Camacho
Authors
Pouyan Aminian
Jairo Camacho
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