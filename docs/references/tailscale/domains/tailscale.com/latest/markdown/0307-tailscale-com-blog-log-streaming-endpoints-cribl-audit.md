Enhanced Log Streaming: Private Endpoints, Cribl Support, and Audit Logs for Free Plans
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 03, 2023
# Private endpoints, Cribl, and audit log streaming in Free
We have made new updates to our log streaming features to make them even better!
### Securing log streaming with private endpoints
We’re happy to announce that Tailscale now supports streaming logs to [private (tailnet) endpoints](/kb/1255/log-streaming/). If you don’t want to send logs over the public internet now you have the option to stream directly to a node in your tailnet.
To use this feature, you first need to create a node in your tailnet that hosts your preferred [security information and event management (SIEM) system](/learn/security-information-and-event-management/), and use the name or IP address of the node in the endpoint URL when setting up log streaming. Our control plane automatically detects when an endpoint is private, and asks for consent to share the node with our streaming service. Once the previous step is done, logs will flow to the node. Admins who have permission to configure log streaming and edit [ACLs](/kb/1018/acls/) will be able to set up private endpoints.
### Cribl Log Streaming
We’re excited to share that you can now stream logs to [Cribl](https://cribl.io/). Cribl makes open observability a reality with a full suite of telemetry data solutions. Both Cribl and Tailscale are dedicated to giving you more control, flexibility, and freedom when it comes to your data. From simplifying connectivity to delivering actionable data without compromises, Tailscale and Cribl provide a suite of modernized and secure solutions for optimizing operations and observability.
We understand that customers have different use cases, sources and destinations for their logs. We heard feedback that customers want to maintain flexibility to route Tailscale logs to destinations that best fit their needs.
And we are happy to offer that level of flexibility to our customers via Cribl. Whether it’s sending Tailscale logs directly to a storage service (e.g., S3 bucket) for archiving or building an ETL pipeline to ingest them into a data lake or even sending them to a Security Incident and Event Management (SIEM) system, Cribl supports all of that and more!
Checkout the [Cribl docs page](https://docs.cribl.io/stream/sources-splunk-hec/) to learn more about how Tailscale logs can be routed via Cribl.
### Audit Log streaming in Tailscale Free
We want our customers to experience the richness of the product as much as possible before they decide to buy. We are now extending this philosophy to log streaming as well! Tailscale users on the Free plan will now be able to stream the [configuration audit logs](/kb/1203/audit-logging/) to any of the [log streaming partners](/integrations/) that we currently support.
Currently supported SIEM systems are Splunk, through an HTTP Event Collector, Elasticsearch Logstash, through a data stream, Panther, and now Cribl. For more information about log streaming, see [our documentation](/kb/1255/log-streaming/).
Ready to stream logs? Go to the [admin console](https://login.tailscale.com/admin/) to try it now!
Share
Author
Pouyan Aminian
Author
Pouyan Aminian
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