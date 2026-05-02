Tailscale log streaming now supports S3 destinations
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productNovember 12, 2024
# Tailscale log streaming now supports S3 destinations
Tailscale helps your team build a network of encrypted and authenticated connections between any resources on your infrastructure or in the cloud. Monitoring those connections is a critical component of an organization’s security and compliance obligations.
Tailscale administrators can now use Amazon S3 and S3-compatible buckets as streaming destinations for both [configuration audit logs](https://tailscale.com/kb/1203/audit-logging) and [network flow logs](https://tailscale.com/kb/1219/network-flow-logs). Tailscale’s log streaming offerings have long been an important part of our users’ compliance and security strategies, and over the past year we’ve added [support for many of the most popular security information and event management (SIEM) systems](https://tailscale.com/kb/1255/log-streaming) as streaming endpoints.
But we’ve also heard from some customers that would like to archive these logs for audit purposes and do not want to incur the costs that come with a full-fledged SIEM solution. Streaming these kinds of logs to S3-compatible buckets solves the auditability problem while keeping the costs of storage low.
We support streaming to native S3 buckets using IAM roles and S3-compatible buckets (e.g., MinIO and B2) using access keys and secrets. You can set up an S3 streaming destination via the admin console. Please see [our log streaming docs](https://tailscale.com/kb/1255/log-streaming) for setup instructions.
S3 logging is currently in beta. Configuration audit log streaming is available on Tailscale’s Personal, Personal Plus, and Enterprise plans. Network log streaming is available on the Enterprise plan.
Share
Authors
Pouyan Aminian
Parker Higgins
Contributors
Percy Wegmann
Mario Minardi
Jim Scott
Rhea Ghosh
Clare Adrien
Authors
Pouyan Aminian
Parker Higgins
Contributors
Percy Wegmann
Mario Minardi
Jim Scott
Rhea Ghosh
Clare Adrien
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