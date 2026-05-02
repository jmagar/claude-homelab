Aperture dashboard reference · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Aperture dashboard reference
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Access the Aperture dashboard at `/ui/` on your Aperture hostname (for example, `http://\<aperture-hostname\>/ui/`) to review usage data, session logs, and adoption metrics.
This page is part of the [Aperture reference](/docs/aperture/reference) documentation. For how-to guides on observing and exporting usage data, refer to [Observe and export AI usage](/docs/aperture/observe-and-export).
## [Dashboard page](#dashboard-page)
If you incorrectly authenticate user devices with tag identities, all LLM sessions from those devices appear to come from the tag identity instead of the individual user. This happens because Tailscale tags do not provide per-user identity. Refer to [all sessions appear to come from the same user](/docs/aperture/troubleshooting#all-sessions-appear-to-come-from-the-same-user) for more information.
The **Dashboard** page shows token usage for the current user. It includes the following components:
* Total tokens by model (bar chart)
* Recent activity timeline
* Quick stats: total requests, total tokens, active sessions
Admins can access other users' dashboards by going to `/ui/dashboard/:loginName` where `loginName` is the Tailscale login name of the user (for example, `alice`). For instructions on checking and managing budgets, refer to [Check and refill budgets](/docs/aperture/how-to/check-and-refill-budgets).
## [Logs page](#logs-page)
The **Logs** page shows request history with session grouping. It provides the following views:
* **Sessions list**: Shows aggregated metrics per session (total tokens, request count, and duration).
* **Session expansion**: Select a session to show its individual requests.
* **Request detail**: Select a request to show full capture data, including headers, request body, response body, and tool use details.
* **Filtering**: Filter by date range, model, or user.
Session grouping helps you understand the context of conversations. A Claude Code session can show dozens of requests that together represent a single coding task.
## [Tool Use page](#tool-use-page)
The **Tool Use** page shows tool invocation patterns across sessions:
* Tool use histogram over time
* Tool type breakdown per session
* Filter by user, model, or specific tool names
## [Adoption page](#adoption-page)
The **Adoption** page shows organization-wide metrics:
* Active users over time
* Usage distribution histogram (how usage is spread across users)
* Top users by token consumption
* Model popularity breakdown
This page helps platform teams understand LLM adoption patterns and identify users who need support or training. To export this data for external analysis, refer to [Export usage data to S3](/docs/aperture/how-to/export-usage-data-to-s3).
## [Models page](#models-page)
The **Models** page lists all configured models with their provider information:
* Model ID
* Provider name and description
* API compatibility (which endpoints the model supports)
All providers and models configured in the Aperture settings show on the **Models** page. Users can reference this page to choose which model to use through Aperture when configuring LLM clients. For a list of supported providers and API formats, refer to [Supported models and providers](/docs/aperture/provider-compatibility).
## [Settings page](#settings-page)
The **Settings** page lets admins edit the [Aperture configuration](/docs/aperture/configuration) using the **Visual editor** (default) or the **JSON editor**.
On this page
* [Dashboard page](#dashboard-page)
* [Logs page](#logs-page)
* [Tool Use page](#tool-use-page)
* [Adoption page](#adoption-page)
* [Models page](#models-page)
* [Settings page](#settings-page)
Scroll to top