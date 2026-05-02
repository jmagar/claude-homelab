GCS Log Streaming: Increase visibility without breaking encryption
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 18, 2026
# Stream Tailscale logs to Google Cloud Storage
Tailscale log streaming enables you to export logs from your tailnet to the systems you already use for retention, investigation, and compliance. We previously supported a range of external destinations, including SIEM platforms and [S3-compatible storage](https://tailscale.com/blog/s3-log-streaming/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026). We’re now extending log streaming support to [Google Cloud Storage](https://cloud.google.com/storage) (GCS).
For organizations running primarily on Google Cloud, this provides a direct way to keep Tailscale logs alongside the rest of your operational and security telemetry, using the storage and access controls you already have in place.
## [**Network visibility without breaking encryption**](#network-visibility-without-breaking-encryption)
When you run a network built on Tailscale’s peer-to-peer architecture, you solve for speed and encryption. Still, you might be left with new questions, about the traffic no longer funneled through a central gateway: *What connected to what? When did it happen? How did access actually flow through the tailnet?*
In legacy networks, oversight was a byproduct of bottlenecks; you monitored traffic by forcing it through slow “choke points.” Tailscale removes these hurdles to ensure traffic follows the shortest path possible. You don’t have to compromise performance—or reintroduce heavy proxies that break encryption—just to get a reliable record of what’s happening.
Network flow and configuration audit logs restore this oversight by leveraging Tailscale’s coordination layer. Because every connection is authenticated, events are tied to specific user or device identities rather than just ephemeral IP addresses. You get the context needed to understand your network and respond to incidents without ever needing to touch the actual contents of the traffic.
Log streaming to GCS supports both categories of tailnet logs:
* [**Network flow logs**](https://tailscale.com/docs/features/logging/network-flow-logs/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026), which capture connection metadata between nodes (without including traffic contents)
* [**Configuration audit logs**](https://tailscale.com/docs/features/logging/audit-logging/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026), which record administrative actions and policy changes
GCS log streaming is available on the Enterprise plan.
## [**Bringing logs into your GCS environment**](#bringing-logs-into-your-gcs-environment)
With GCS as a supported log streaming destination, you can send Tailscale logs directly into a customer-owned bucket and manage them with your existing Google Cloud controls. From there, you can apply IAM policies and retention rules, archive logs for compliance, or route data to downstream systems like BigQuery or Chronicle.
You can configure Google Cloud Storage as a log streaming endpoint from the admin console under **Logs \> Log streaming**.
To start streaming logs to GCS, see our [log streaming documentation](https://tailscale.com/docs/features/logging/log-streaming/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026).
Share
Author
Jillian Murphy
Contributors
Samuel Jinadu
Brad Kouchi
Eric Weinstein
Clare Adrien
Joseph Tsai
Jim Scott
Danni Popova
Author
Jillian Murphy
Contributors
Samuel Jinadu
Brad Kouchi
Eric Weinstein
Clare Adrien
Joseph Tsai
Jim Scott
Danni Popova
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