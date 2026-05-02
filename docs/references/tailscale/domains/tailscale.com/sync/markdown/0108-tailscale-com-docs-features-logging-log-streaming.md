Log streaming · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Log streaming
Last validated: Feb 2, 2026
Configuration audit log streaming is available for [the Personal and Enterprise plans](/pricing).
Network flow log streaming is available for [the Enterprise plan](/pricing).
Log streaming lets you collect and send [configuration audit logs](/docs/features/logging/audit-logging) or [network flow logs](/docs/features/logging/network-flow-logs) about your Tailscale network (known as a tailnet) into various systems for collection and analysis.
You can use `User-Agent: TailscaleLogStreamPublisher` to identify Tailscale traffic.
## [Supported integrations](#supported-integrations)
Tailscale supports different ways of integrating log streaming.
### [SIEM integrations](#siem-integrations)
You can stream logs into a Security information and event management ([SIEM](/learn/security-information-and-event-management)) system to help detect and respond to security threats, set up alerting and monitoring rules, and the like.
We support log streaming integrations for the following SIEM systems:
* [Axiom](https://axiom.co)
* [Cribl](https://cribl.io)
* [Datadog](https://www.datadoghq.com)
* [Elasticsearch Logstash](https://www.elastic.co/logstash), through a [data stream](https://www.elastic.co/guide/en/elasticsearch/reference/current/data-streams.html)
* [Panther](https://panther.com)
* [Splunk](https://www.splunk.com), through an [HTTP Event Collector](https://dev.splunk.com/enterprise/docs/devtoolshttpeventcollector)
* [Additional SIEM systems](#additional-siem-systems)
### [Amazon S3 and S3-compatible services](#amazon-s3-and-s3-compatible-services)
You can stream your logs to Amazon S3 and S3-compatible services for various cloud storage providers.
We support log streaming integrations for sending logs to the following S3 bucket types:
* [Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/logging-with-S3.html)
* S3-compatible services, including:
* [Storj](https://www.storj.io/)
* [Wasabi](https://wasabi.com/)
### [Google Cloud services](#google-cloud-services)
* [Google Cloud Storage](https://cloud.google.com/storage) (GCS)
### [Other integrations types](#other-integrations-types)
Additional integrations that you can use for log streaming include:
* [Private endpoints](#private-endpoints)
* [Vector](https://vector.dev)
## [Prerequisites](#prerequisites)
* You need an endpoint and credentials for either your SIEM integration or S3 cloud storage provider. Consult your vendor's documentation for how to get an endpoint and API credentials.
* You need to be an [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) to add, edit, and delete a streaming destination.
## [Configuration log streaming](#configuration-log-streaming)
Configuration audit log streaming is available for [the Personal and Enterprise plans](/pricing).
### [Add configuration log streaming](#add-configuration-log-streaming)
[SIEM integrations](/docs/features/logging/log-streaming?tab=siem+integrations)[Amazon S3](/docs/features/logging/log-streaming?tab=amazon+s3)[S3-compatible](/docs/features/logging/log-streaming?tab=s3-compatible)[Google Cloud Storage](/docs/features/logging/log-streaming?tab=google+cloud+storage)
1. Open the [Configuration logs](https://login.tailscale.com/admin/logs) page of the admin console.
2. Select **Start streaming**.
3. In the **Start streaming configuration logs** dialog:
1. Select a SIEM destination.
2. For **URL**, enter your SIEM endpoint. The endpoint URL must use the HTTPS protocol, and there
is no restriction on which port is used.
Splunk's HTTP Endpoint Connectors require an endpoint ending with `/services/collector/event`.
Elasticsearch's data streams require an endpoint ending with `\<stream\_id\>/\_bulk?pretty`.
3. If your SIEM system requires a value for **Username**, enter the SIEM username.
4. For **Token**, enter the SIEM API token.
5. Select **Start streaming**.
Check your SIEM system to verify you are successfully streaming from your tailnet.
Depending on network conditions, there may be a delay before you can see the log streaming appear in your third-party tools.
### [Edit a configuration log streaming destination](#edit-a-configuration-log-streaming-destination)
You can change the information for passing your logs to your preferred streaming destination.
1. Open the [Configuration logs](https://login.tailscale.com/admin/logs) page of the admin console.
2. For the system that you want to update, select the **Action** dropdown, then select **Edit**.
3. Update the values as needed.
4. Select **Save changes**.
If you are editing a log streaming destination for an Amazon S3 bucket, you can update the **Role ARN** field (the Amazon resource name) if the resource name already belongs to the specified AWS account. If the role does not belong to the AWS account, you must delete the log streaming destination in the admin console and create a new one.
### [Delete a configuration log streaming destination](#delete-a-configuration-log-streaming-destination)
1. Open the [Configuration logs](https://login.tailscale.com/admin/logs) page of the admin console.
2. For the integration that you want to delete, select the **Action** dropdown, then select **Delete**.
3. In the confirmation dialog, select **Delete**.
## [Network log streaming](#network-log-streaming)
Network flow log streaming is available for [the Enterprise plan](/pricing).
### [Add a network log streaming destination](#add-a-network-log-streaming-destination)
[SIEM integrations](/docs/features/logging/log-streaming?tab=siem+integrations)[Amazon S3](/docs/features/logging/log-streaming?tab=amazon+s3)[S3-compatible](/docs/features/logging/log-streaming?tab=s3-compatible)[Google Cloud Storage](/docs/features/logging/log-streaming?tab=google+cloud+storage)
1. If you haven't already, [enable Network flow logs](/docs/features/logging/network-flow-logs#enable-network-flow-logs) for your tailnet.
2. Open the [Network flow logs](https://login.tailscale.com/admin/logs/network) page of the admin console.
3. Select **Start streaming**.
4. In the **Start streaming network logs** dialog:
1. Select a SIEM destination.
2. For **URL**, enter your SIEM endpoint. The endpoint URL must use the HTTPS protocol, and there
is no restriction on which port is used.
Splunk's HTTP Endpoint Connectors require an endpoint ending with `/services/collector/event`.
Elasticsearch's data stream endpoints end with `\<stream\_id\>/\_bulk?pretty`.
3. If your SIEM system requires a value for **Username**, enter the SIEM username.
4. For **Token**, enter the SIEM API token.
5. Select **Start streaming**.
Check your SIEM system to verify you are successfully streaming from your tailnet.
Depending on network conditions, there may be a delay before you can see the log streaming appear in your third-party tools.
### [Edit a network log streaming destination](#edit-a-network-log-streaming-destination)
You can change the information for passing your logs to your preferred streaming destination.
1. Open the [Network flow logs](https://login.tailscale.com/admin/logs/network) page of the admin console.
2. For the system that you want to update, select the **Action** dropdown, then select **Edit**.
3. Update the values as needed.
4. Select **Save changes**.
If you are editing a log streaming destination for an Amazon S3 bucket, you can update the **Role ARN** field (the Amazon resource name) if the resource name already belongs to the specified AWS account. If the role does not belong to the AWS account, you must delete the log streaming destination in the admin console and create a new one.
### [Delete a network log streaming destination](#delete-a-network-log-streaming-destination)
1. Open the [Network flow logs](https://login.tailscale.com/admin/logs/network) page of the admin console.
2. For the integration that you want to delete, select the **Action** dropdown, then select **Delete**.
3. In the confirmation dialog, select **Delete**.
## [Private endpoints](#private-endpoints)
Log streaming can publish logs to a host that is
directly reachable over the public internet,
in which case the endpoint must use HTTPS for security.
Alternatively, log streaming can publish logs to a private host
that is not directly reachable over the public internet
by using Tailscale for connectivity.
Plain HTTP may be used since the underlying transport is
secured by Tailscale using WireGuard.
Use of log streaming to a private host is detected automatically
based on the host specified in the endpoint URL.
The host must reference a node within your tailnet and
can be any of the following:
* The name of a Tailscale node (for example, `splunk`).
* The [fully-qualified domain name](/docs/features/magicdns#fully-qualified-domain-names-vs-machine-names) of a Tailscale node (for example, `splunk.yak-bebop.ts.net`).
* The IPv6 address of a Tailscale node (for example, `fd7a:115c:a1e0:ab12:0123:4567:89ab:cdef`).
Only IPv6 addresses are supported for log streaming. IPv4 addresses are not supported for log streaming because Tailscale uses CGNAT for IPv4 addresses assigned to nodes within a single tailnet. This can present an issue because IPv4 addresses can be reused across a tailnet. IPv6 addresses are not reused, and hostnames will always route to the correct node.
Log streaming to a private endpoint operates by [sharing](/docs/features/sharing) your node
into a Tailscale-managed tailnet, where a Tailscale-managed node will
publish logs directly to your node. This requires both sharing your node
out to Tailscale's `logstream` tailnet, and modifying your [tailnet policy file](/docs/features/access-control/acls) to support incoming traffic to your node from the `logstream@tailscale` user.
When adding or updating an endpoint that points to a private host,
the control plane may need to share your node and/or update the tailnet policy file on your behalf. If additional configuration changes are needed, a follow-up dialog box
will ask you for permission to perform the necessary actions.
Audit log events will be generated for these operations and
the actions will be attributed to you.
After adding or updating the endpoint, the node will be listed on the
[Machines](https://login.tailscale.com/admin/machines) page of the admin console
as having been shared out to the `logstream@tailscale` user.
Also, the tailnet policy file will be modified with a rule similar to the following:
```
`{
// Private log streaming enables audit and network logs to be directly
// uploaded to a node in your tailnet without exposing it to the public internet.
// This access rule provides access for a Tailscale-managed node to upload logs
// directly to the specified node.
// See https://tailscale.com/docs/features/logging/log-streaming#private-endpoints
"action": "accept",
"src": ["logstream@tailscale"],
"dst": ["[nodeAddressV6]:port"],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
where:
* `nodeAddressV6` is the IPv6 address of the Tailscale node.
* `port` is the service port for the log streaming system.
The IPv6 address is specified as the log stream publisher that can communicate with your node over v6 of the Internet Protocol.
Only IPv6 addresses are supported for log streaming. IPv4 addresses are not supported for log streaming because Tailscale uses CGNAT for IPv4 addresses assigned to nodes within a single tailnet. This can present an issue because IPv4 addresses can be reused across a tailnet. IPv6 addresses are not reused, and hostnames will always route to the correct node.
Since log streaming to a private host may require
the ability to share nodes and the ability to update the tailnet policy file,
only the [Admin](/docs/reference/user-roles#admin) and [Network admin](/docs/reference/user-roles#network-admin) roles
have sufficient permissions to unilaterally make use of private endpoints.
The [IT admin](/docs/reference/user-roles#it-admin) has the ability to share nodes,
but lacks the ability to update the tailnet policy file.
An IT admin can still make use of private endpoints,
but requires either an Admin or Network admin to manually update
the tailnet policy file before logs can start streaming.
If your tailnet is configured to use [GitOps for management of Tailscale](/docs/gitops), you will receive
an error when Tailscale attempts to update your tailnet policy file to support incoming
traffic from the `logstream@tailscale` user. To avoid this error, first use GitOps to add an
[access rule](/docs/reference/syntax/policy-file#acls) that lets incoming traffic from the `logstream@tailscale` user reach the node that you use for the private endpoint, and then add your private endpoint as the log
streaming URL.
## [Additional SIEM systems](#additional-siem-systems)
We strive to support many common SIEM systems used by our customers, but we cannot support all the commercial and open-source SIEM and logging tools available. Some SIEM systems have [Splunk HTTP Event Collector (Splunk HEC)](https://dev.splunk.com/enterprise/docs/devtoolshttpeventcollector) compatible endpoints such as [DataSet by SentinelOne](https://app.scalyr.com/solutions/splunk-hec). If your SIEM supports Splunk HEC, configure [configuration audit log streaming](#configuration-log-streaming) and [network flow log streaming](#network-log-streaming) per the instructions above to stream logs directly to your SIEM as if it were Splunk.
If we do not support your SIEM system, you can use [Vector](https://vector.dev), an open-source high-performance observability data pipeline, to ingest log data from Tailscale by using Vector's Splunk HEC support and deliver it to Vector's many supported SIEM systems, called "sinks" in Vector's terminology. Vector supports a number of [sinks](https://vector.dev/docs/reference/configuration/sinks) such as object storage systems, messaging queuing systems, Grafana Loki, New Relic, and more.
### [Vector deployment](#vector-deployment)
To use Vector with log streaming from Tailscale:
1. Follow Vector's [deployment guide](https://vector.dev/docs/setup/deployment) to deploy a machine running Vector to your infrastructure.
2. Configure Vector's [Splunk HTTP Event Collector (HEC) source](https://vector.dev/docs/reference/configuration/sources/splunk_hec) to allow Tailscale to send log data to Vector.
3. Configure the [Vector sink](https://vector.dev/docs/reference/configuration/sinks) for your SIEM as the destination for the log streaming data.
4. Configure [configuration audit log streaming](#configuration-log-streaming) and [network flow log streaming](#network-log-streaming) per the instructions above to stream logs to your Vector instance, ideally using [private endpoints](#private-endpoints).
### [Vector example configuration](#vector-example-configuration)
The Vector configuration below receives data from the `splunk\_hec` source and outputs data to the `file` sink:
```
`# /etc/vector/vector.yaml
sources:
splunk\_hec:
type: "splunk\_hec"
address: "100.x.y.z:8088" # Your Vector Tailscale device's IP or hostname
valid\_tokens:
- "YOUR TOKEN"
sinks:
file\_sink:
type: "file"
inputs:
- "splunk\_hec"
path: "/vector-data-dir/tailscale-%Y-%m-%d.log"
encoding:
codec: "json"
`
```
On this page
* [Supported integrations](#supported-integrations)
* [SIEM integrations](#siem-integrations)
* [Amazon S3 and S3-compatible services](#amazon-s3-and-s3-compatible-services)
* [Google Cloud services](#google-cloud-services)
* [Other integrations types](#other-integrations-types)
* [Prerequisites](#prerequisites)
* [Configuration log streaming](#configuration-log-streaming)
* [Add configuration log streaming](#add-configuration-log-streaming)
* [Edit a configuration log streaming destination](#edit-a-configuration-log-streaming-destination)
* [Delete a configuration log streaming destination](#delete-a-configuration-log-streaming-destination)
* [Network log streaming](#network-log-streaming)
* [Add a network log streaming destination](#add-a-network-log-streaming-destination)
* [Edit a network log streaming destination](#edit-a-network-log-streaming-destination)
* [Delete a network log streaming destination](#delete-a-network-log-streaming-destination)
* [Private endpoints](#private-endpoints)
* [Additional SIEM systems](#additional-siem-systems)
* [Vector deployment](#vector-deployment)
* [Vector example configuration](#vector-example-configuration)
Scroll to top