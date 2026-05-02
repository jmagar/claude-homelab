Logging, streaming, and events · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Logging, streaming, and events
Last validated: Feb 5, 2025
Manage the logs and events within your Tailscale network, known as a tailnet.
## [Capture logs and events](#capture-logs-and-events)
You can capture configuration changes to your tailnet as well as network traffic flow.
[
#### Configuration audit logging
Identify who did what, and when, to your tailnet configuration.
](/docs/features/logging/audit-logging)
[
#### Network flow logs
View networking telemetry for nodes in your Tailscale network.
](/docs/features/logging/network-flow-logs)
## [Stream logs and events to a SIEM or storage bucket](#stream-logs-and-events-to-a-siem-or-storage-bucket)
Stream configuration audit logs and network flow logs to your preferred log streaming integration, such as a security information and event management (SIEM) system and Amazon S3 or S3-compatible storage buckets. You can also stream Tailscale SSH session recordings to another node in your tailnet or storage buckets.
[
#### Log streaming
Stream Tailscale logs to a security information and event management (SIEM) system, Amazon S3, and S3-compatible service.
](/docs/features/logging/log-streaming)
[
#### Tailscale SSH session recording
Use Tailscale SSH session recording to collect end-to-end encrypted recordings of Tailscale SSH sessions.
](/docs/features/tailscale-ssh/tailscale-ssh-session-recording)
[
#### Send Tailscale SSH session recordings to S3
Configure an S3 backend for SSH session recording.
](/docs/features/tailscale-ssh/how-to/session-recording-s3)
## [Integrate log events with your infrastructure](#integrate-log-events-with-your-infrastructure)
Use webhooks to integrate log events with your infrastructure, such as with apps like Slack.
[
#### Webhooks
Set up a webhook to receive notification of events on your Tailscale network.
](/docs/features/webhooks)
On this page
* [Capture logs and events](#capture-logs-and-events)
* [Stream logs and events to a SIEM or storage bucket](#stream-logs-and-events-to-a-siem-or-storage-bucket)
* [Integrate log events with your infrastructure](#integrate-log-events-with-your-infrastructure)
Scroll to top