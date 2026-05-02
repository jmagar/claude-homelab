Track Tailnet Changes with Tailscale Configuration Audit Logs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 13, 2022
# Track Tailnet Changes with Tailscale Configuration Audit Logs
Understanding what changes were made to your Tailscale network, and who made them, is critical for maintaining the security and integrity of your network. That’s why we’re making it even easier for admins — and your auditors! — to review changes made to your tailnet’s configuration, such as adding devices, updating ACLs, or changing DNS settings.
Configuration audit logs, now in beta, capture changes made to your network in the [coordination server](/blog/how-tailscale-works/). **If you’re an admin of a tailnet, you can access audit logs for your tailnet in the **[**logs tab**](/admin/logs)** of the admin console**. From the console, you’ll see a table of changes made to your network, with the most recent events first, and you can filter by user, time, and action taken. Configuration audit logs are also available via API.
When you make a change to the tailnet policy file, this event is recorded in configuration audit logs, including a diff of the file.
Configuration audit logs are enabled by default, on all tailnets, and cannot be disabled. Configuration audit logs record write-actions made to your tailnet configuration, typically within seconds. For a list of all logged events, [see the documentation](/kb/1203/audit-logging/).
### Investigate or audit events
You can use configuration audit logs to review actions in your tailnet as part of an audit or incident response. For example, an admin could identify when a particular device was added, tagged, or advertised as an exit node, and by whom — enabling auditors or admins to determine the sequence of actions, and even intervene when necessary. You can also use configuration audit logs to track changes to ACLs to ensure these changes are in line with your access policies, or validate that all of an employee’s devices have been removed when they leave the company.
Ready access to audit logs enables admins to:
* Quickly review actions performed by privileged users in your network.
* Monitor configuration changes, including changes to the tailnet policy file.
* Track, audit, and reverse unintentional changes.
### Maintain historical logs
Configuration audit logs are retained for a period of 90 days, then automatically deleted. If you’d like to store logs for a longer period of time, you can use the API to export these to the long-term storage solution of your choice.
You can also leverage the Tailscale API to programmatically retrieve audit logs, and ingest these in a SIEM or business intelligence (BI) solution. See documentation for the [Tailscale API](/kb/1101/api/).
Maya demonstrates how to use configuration audit logging.
Navigate to the [logs tab](/admin/logs) of the admin console to review your configuration audit logs.
Share
Authors
Ramya Nagarajan
Jenny Zhang
Alessandro Mingione
Authors
Ramya Nagarajan
Jenny Zhang
Alessandro Mingione
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