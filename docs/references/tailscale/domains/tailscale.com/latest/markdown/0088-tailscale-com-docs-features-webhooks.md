Webhooks · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Webhooks
Last validated: Jan 5, 2026
This feature is available for [all plans](/pricing).
Webhooks let you subscribe to certain events on your Tailscale network and process the event notifications through an integration or app. For example, you could integrate Tailscale events with a Slack channel. If subscribed to an event such as adding a node, your webhook endpoint can send a message in a Slack channel anytime a node is added to your tailnet.
## [How it works](#how-it-works)
You provide a webhook endpoint which can receive HTTPS POST requests for subscribed Tailscale events. The body of the request provides information about the event. It is up to you to determine how the webhook should process a notification. Tailscale typically sends an event notification to a webhook within a few seconds of the event's occurrence.
You create and manage webhook endpoints in the [Webhooks](https://login.tailscale.com/admin/settings/webhooks) page of the admin console.
Tailscale provides a digital signature for events that it sends, so you can verify whether an event was signed by a secret that is shared between you and Tailscale.
Webhook events are sent as JSON objects, with the format described in [events payload](#events-payload). Optionally, you can configure webhooks to send events in a compatible format for the following destinations:
|Destination|Destination's webhook documentation|
|Discord|[Intro to Discord webhooks](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks)|
|Google Chat|[Send messages to Google Chat with incoming webhooks](https://developers.google.com/chat/how-tos/webhooks)|
|Mattermost|[Mattermost webhooks](https://developers.mattermost.com/integrate/webhooks)|
|Slack|[Sending Slack messages using incoming webhooks](https://api.slack.com/messaging/webhooks)|
## [Prerequisites](#prerequisites)
* You need a webhook endpoint which will process the Tailscale event notifications.
* Your webhook endpoint must be able to process HTTPS POST requests and must use either port `80` or port `443`.
* You need to be an [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) of a tailnet to create, modify, or delete webhooks.
## [Setting up a webhook endpoint](#setting-up-a-webhook-endpoint)
Webhooks apply to a tailnet. If one user creates a webhook, other [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) users in the tailnet can modify or delete it. If a webhook is created by a user who is later removed or suspended from your tailnet, the webhook will still work.
1. Open the [Webhooks](https://login.tailscale.com/admin/settings/webhooks) page of the admin console.
2. Select **Add endpoint**.
3. In the **Add endpoint** page:
1. For **Webhook URL**, provide the endpoint for your webhook. The endpoint URL must use the HTTPS protocol, and must use either port `80` or port `443`.
2. (Optional) For **Destination**, select the destination for the endpoint. Tailscale will send your webhook events in the format expected by the destination. (If you enter a Discord or Slack URL for **Webhook URL**, then the **Destination** field will be grayed out with the respective destination selected.)
Choose **None** if you are using the general Tailscale format for the events.
3. Select the event categories or events you want to receive as notifications.
A category is a set of related events. For example, the **Tailnet Management** category contains events related to node actions and [tailnet policy file](/docs/reference/syntax/policy-file) updates. If you select a category, you will be subscribed to any new events that Tailscale adds to the category in the future.
If you don't want to use categories, you can select specific events.
4. Select **Add endpoint**.
5. On the subsequent **Webhook secret** popup, select **Copy** to copy the newly-created webhook secret. After you close the **Webhook secret** page, you won't be able to copy the secret again. Also, note that Tailscale-generated webhook secrets are case-sensitive.
Store the webhook secret securely.
6. Select **Done**.
Your webhook endpoint is now configured.
7. To ensure your webhook is configured correctly and can receive events from Tailscale, [test your webhook](#testing-your-webhook).
## [Events](#events)
You can subscribe to the following events:
|Category|Event|Description|
|Device misconfiguration|`exitNodeIPForwardingNotEnabled`|[Exit node](/docs/features/exit-nodes) has [IP forwarding](/docs/features/exit-nodes?tab=linux#advertise-a-device-as-an-exit-node) disabled.|
|Device misconfiguration|`subnetIPForwardingNotEnabled`|[Subnet](/docs/features/subnet-routers) has [IP forwarding](/docs/features/subnet-routers?tab=linux#enable-ip-forwarding) disabled.|
|Tailnet management|`nodeApproved`|Node was approved.|
|Tailnet management|`nodeAuthorized` (deprecated)|Node was authorized. This event is deprecated and is replaced by `nodeApproved`. Your endpoint will continue to receive this event until you turn it off.|
|Tailnet management|`nodeCreated`|Node was created.|
|Tailnet management|`nodeDeleted`|Node was deleted. This includes automatic deletion of [ephemeral nodes](/docs/features/ephemeral-nodes).|
|Tailnet management|`nodeKeyExpired`|Node key recently expired.|
|Tailnet management|`nodeKeyExpiringInOneDay`|[Node key](/blog/tailscale-key-management#node-keys) is going to expire in less than one day.|
|Tailnet management|`nodeNeedsApproval`|Node needs [approval](/docs/features/access-control/device-management/device-approval). Note that any [pre-approved nodes](/docs/features/access-control/device-management/device-approval#pre-approve-devices-with-an-auth-key) will not generate the `nodeApproved` event.|
|Tailnet management|`nodeNeedsAuthorization` (deprecated)|Node needs authorization. This event is deprecated and is replaced by `nodeNeedsApproval`. Your endpoint will continue to receive this event until you turn it off.|
|Tailnet management|`nodeNeedsSignature`|Node needs a signature from a trusted node. This event is only sent for nodes that belong to tailnets that enabled [Tailnet Lock](/docs/features/tailnet-lock), and will not be sent for shared nodes.|
|Tailnet management|`nodeSigned`|Node was signed by a trusted node. This applies to tailnets that enabled Tailnet Lock.|
|Tailnet management|`policyUpdate`|[Tailnet policy file](/docs/features/tailnet-policy-file) updated.|
|Tailnet management|`userApproved`|User was approved.|
|Tailnet management|`userCreated`|User was created.|
|Tailnet management|`userNeedsApproval`|User needs [approval](/docs/features/access-control/user-approval).|
|Tailnet management|`userRoleUpdated`|User role was [changed](/docs/features/sharing/how-to/change-role).|
|Webhook management|`test`|Webhook test event was generated.|
|Webhook management|`webhookDeleted`|Webhook was deleted. This event is subscribed by default and cannot be disabled.|
|Webhook management|`webhookUpdated`|Webhook was updated. This event is subscribed by default and cannot be disabled.|
## [Events payload](#events-payload)
Webhook events are sent as JSON objects with the following fields:
* `timestamp`: Time the event occurred, formatted as a RFC 3339 string.
* `version`: Version of the event payload.
* `type`: Type of the event (as listed in the table above).
* `tailnet`: Name of the tailnet where the event occurred.
* `message`: Human-readable summary of the event.
* `data` (Optional): Per-event payload with additional data. Most events will have an `actor` field that identifies the user or automated process that did the action that triggered the event. It is the same actor that is included in [configuration audit log entries](/docs/features/logging/audit-logging#log-structure).
Multiple events may be sent in one payload to minimize overhead. The root payload object is always an array of events.
The following shows an example events payload sent to a webhook endpoint:
```
`[
{
"timestamp": "2022-09-21T13:37:51.658918-04:00",
"version": 1,
"type": "test",
"tailnet": "example.com",
"message": "This is a test event",
"data": null
},
{
"timestamp": "2022-09-21T13:59:02.949217-04:00",
"version": 1,
"type": "nodeCreated",
"tailnet": "example.com",
"message": "Node alice-workstation1.yak-bebop.ts.net created",
"data": {
"nodeID": "nFJw3SRKTM59",
"deviceName": "alice-workstation1.yak-bebop.ts.net",
"managedBy": "alice@example.com",
"actor": "alice@example.com",
"url": "https://login.tailscale.com/admin/machines/100.12.345.67"
}
},
{
"timestamp": "2022-09-21T13:59:02.949278-04:00",
"version": 1,
"type": "nodeNeedsApproval",
"tailnet": "example.com",
"message": "Node alice-workstation1.yak-bebop.ts.net needs approval",
"data": {
"nodeID": "nFJw3SRKTM59",
"deviceName": "alice-workstation1.yak-bebop.ts.net",
"managedBy": "alice@example.com",
"actor": "alice@example.com",
"url": "https://login.tailscale.com/admin/machines/100.12.345.67"
}
},
{
"timestamp": "2022-09-21T13:59:15.966728-04:00",
"version": 1,
"type": "nodeApproved",
"tailnet": "example.com",
"message": "Node alice-workstation1.yak-bebop.ts.net approved",
"data": {
"nodeID": "nFJw3SRKTM59",
"deviceName": "alice-workstation1.yak-bebop.ts.net",
"managedBy": "alice@example.com",
"actor": "admin@example.com",
"url": "https://login.tailscale.com/admin/machines/100.12.345.67"
}
},
{
"timestamp": "2023-04-21T13:59:15.966728-04:00",
"version": 1,
"type": "nodeDeleted",
"tailnet": "example.com",
"message": "Node alice-workstation1.yak-bebop.ts.net deleted",
"data": {
"nodeID": "nFJw3SRKTM59",
"deviceName": "alice-workstation1.yak-bebop.ts.net",
"managedBy": "alice@example.com",
"actor": "admin@example.com",
"url": "https://login.tailscale.com/admin/machines/100.12.345.67"
}
},
{
"timestamp": "2022-09-27T09:51:46.512946-07:00",
"version": 1,
"type": "policyUpdate",
"tailnet": "example.com",
"message": "Tailnet policy file updated",
"data": {
"newPolicy": "{\\n\\t\\"acls\\": [\\n\\t\\t{\\"action\\": \\"accept\\", \\"src\\": [\\"autogroup:member\\"], \\"dst\\": [\\"\*:\*\\"]},\\n\\t],\\n}",
"oldPolicy": "{\\n\\t\\"acls\\": [\\n\\t\\t{\\"action\\": \\"accept\\", \\"src\\": [\\"\*\\"], \\"dst\\": [\\"\*:\*\\"]},\\n\\t],\\n}",
"url": "https://login.tailscale.com/admin/acls",
"actor": "admin@example.com"
}
},
{
"timestamp": "2022-11-08T10:26:08.775392-08:00",
"version": 1,
"type": "nodeKeyExpiringInOneDay",
"tailnet": "example.com",
"message": "Node alice-workstation1.yak-bebop.ts.net key expiring in less than one day",
"data": {
"nodeID": "nFJw3SRKTM59",
"url": "https://login.tailscale.com/admin/machines/100.12.345.67",
"deviceName": "alice-workstation1.yak-bebop.ts.net",
"managedBy": "alice@example.com",
"actor": "expiring-node-key-marker",
"expiration": "2022-11-08T18:44:46.979292Z"
}
},
{
"timestamp": "2022-11-08T10:45:08.775392-08:00",
"version": 1,
"type": "nodeKeyExpired",
"tailnet": "example.com",
"message": "Node alice-workstation1.yak-bebop.ts.net key recently expired",
"data": {
"nodeID": "nFJw3SRKTM59",
"url": "https://login.tailscale.com/admin/machines/100.12.345.67",
"deviceName": "alice-workstation1.yak-bebop.ts.net",
"managedBy": "alice@example.com",
"actor": "expiring-node-key-marker",
"expiration": "2022-11-08T18:44:46.979292Z"
}
},
{
"timestamp": "2023-02-27T11:49:25.208092-08:00",
"version": 1,
"type": "userRoleUpdated",
"tailnet": "example.com",
"message": "User alice@example.com role changed",
"data": {
"user": "alice@example.com",
"url": "https://login.tailscale.com/admin/users?q=alice%40example.com",
"actor": "admin@example.com",
"oldRoles": ["Member"],
"newRoles": ["Member", "IT admin"]
}
}
]
`
```
## [Testing your webhook](#testing-your-webhook)
To ensure an endpoint is properly configured and able to receive events from Tailscale, you can send a test event:
1. Open the [Webhooks](https://login.tailscale.com/admin/settings/webhooks) page of the admin console.
2. Find the endpoint that you want to test, select the menu to the right of the page, and select **Test endpoint**.
3. Select **Send test event**. If your webhook is configured correctly, within a few seconds your webhook endpoint should receive an event with type of "test".
## [Retries for events that fail to send](#retries-for-events-that-fail-to-send)
Tailscale typically sends an event notification to a webhook within a few seconds of the event's occurrence. If an event notification fails to successfully send (such as when Tailscale receives a `3xx`, `4xx`, or `5xx` error, or no response at all from your webhook endpoint), Tailscale will retry sending the event. For an event that fails to send, we'll retry sending the event hourly, up to a maximum of 24 hours.
## [Updating subscribed events](#updating-subscribed-events)
1. Open the [Webhooks](https://login.tailscale.com/admin/settings/webhooks) page of the admin console.
2. Find the endpoint that you want to update, select the menu to the right of the page, and select **Edit**.
3. Select the events you want to receive as notifications, and deselect those you don't want to receive.
4. Select **Edit endpoint**.
## [Webhook secret](#webhook-secret)
The webhook secret is a signing secret shared between Tailscale and the creator of the webhook endpoint, and is unique per endpoint. If this shared secret is compromised or leaked, whomever knows the secret can send fake events. If you suspect your secret is compromised, [create a new secret](/docs/features/webhooks/how-to/rotate-webhook-secret).
The webhook secret has no expiry.
## [Rotating a webhook secret](#rotating-a-webhook-secret)
Refer to [rotate a new webhook secret](/docs/features/webhooks/how-to/rotate-webhook-secret) to create a new webhook secret. After you create the new secret, update your webhook endpoint to use the new secret.
## [Deleting an endpoint](#deleting-an-endpoint)
1. Open the [Webhooks](https://login.tailscale.com/admin/settings/webhooks) page of the admin console.
2. Find the endpoint that you want to delete, select the menu to the right of the page, and select **Delete**.
3. Select **Delete endpoint** to confirm you want to delete the endpoint.
## [Using a new webhook for an existing endpoint](#using-a-new-webhook-for-an-existing-endpoint)
To add a new webhook (subscribed event) for an existing endpoint, [edit the endpoint](#updating-subscribed-events) instead of setting up a new endpoint.
## [Audit logging of webhook actions](#audit-logging-of-webhook-actions)
In [configuration audit logging](/docs/features/logging/audit-logging), an action will be recorded in your audit log whenever a webhook is created, deleted, or updated. The log entry will show who performed the action, and when the action occurred.
## [Verifying an event signature](#verifying-an-event-signature)
You can verify whether an event was signed by the [webhook secret](#webhook-secret) that was shared between you and Tailscale. Note this doesn't necessarily mean that an event was sent from Tailscale. Rather, it means an event was sent from an entity that has knowledge of the secret shared between you and Tailscale.
A event sent from Tailscale contains a `Tailscale-Webhook-Signature` header. The `Tailscale-Webhook-Signature` header includes a timestamp and a signature:
```
`Tailscale-Webhook-Signature:t=1663781880,v1=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
`
```
The timestamp, prefixed by `t=`, is the epoch time in seconds when the event occurred. The signature, prefixed by `v1=`, is a hash-based message authentication code (HMAC) using SHA-256. The only supported scheme for the signature is `v1`.
Most modern programming languages provide libraries for computing and comparing HMACs. The following flow describes how to verify a signature.
1. Parse the event timestamp and signature from the `Tailscale-Webhook-Signature` header.
Using the `,` character as the separator, split the `Tailscale-Webhook-Signature` data into a list of elements. Then, using the `=` character, split each element to get two key-value pairs. The first key is `t`, with the event timestamp as its value. The second key is `v1`, with the event signature as its value.
2. Compare the event timestamp (the value for `t`) with the current time. For example, if your verification process acts on events as soon as they are received, and if the event time is more than 5 minutes prior to the current time, you might consider the event as a replay attack.
3. Create a string, `string\_to\_sign`, to sign by concatenating:
* The timestamp (the value of `t`) represented as a string.
* The `.` character.
* The decoded event request body. Note this is in the request itself, not in the `Tailscale-Webhook-Signature` header. The request body contains the encoded [events payload](#events-payload), you need to decode the request body for signing purposes.
* Compute the signature of `string\_to\_sign`.
Create an HMAC with the SHA256 hash function. Use your webhook secret for the signing key, and use `string\_to\_sign` as the message to sign.
* Use an HMAC compare function to compare the signature in the `Tailscale-Webhook-Signature` header (the value of `v1`) with the signature you created in the previous step. If they are not identical, that indicates the event's payload was not signed by your webhook's secret, and the event should not be considered an event sent from Tailscale.
### [Sample verification code](#sample-verification-code)
Check out our [example Go code](https://github.com/tailscale/tailscale/blob/main/docs/webhooks/example.go) for help verifying the signature.
On this page
* [How it works](#how-it-works)
* [Prerequisites](#prerequisites)
* [Setting up a webhook endpoint](#setting-up-a-webhook-endpoint)
* [Events](#events)
* [Events payload](#events-payload)
* [Testing your webhook](#testing-your-webhook)
* [Retries for events that fail to send](#retries-for-events-that-fail-to-send)
* [Updating subscribed events](#updating-subscribed-events)
* [Webhook secret](#webhook-secret)
* [Rotating a webhook secret](#rotating-a-webhook-secret)
* [Deleting an endpoint](#deleting-an-endpoint)
* [Using a new webhook for an existing endpoint](#using-a-new-webhook-for-an-existing-endpoint)
* [Audit logging of webhook actions](#audit-logging-of-webhook-actions)
* [Verifying an event signature](#verifying-an-event-signature)
* [Sample verification code](#sample-verification-code)
Scroll to top