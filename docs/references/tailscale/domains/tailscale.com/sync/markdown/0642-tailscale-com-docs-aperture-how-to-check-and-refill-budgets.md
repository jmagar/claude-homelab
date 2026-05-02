Check and refill budgets · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Check and refill budgets
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
After you configure [per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) or a [team-wide budget](/docs/aperture/how-to/set-team-budget), you can check how budgets are being consumed and manually refill depleted buckets.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with quotas configured. Refer to the [quotas configuration reference](/docs/aperture/configuration#quotas) for details.
* Network access to the Aperture host URL (default: `http://ai`).
* [Admin access](/docs/aperture/how-to/set-up-admin-access) to refill buckets. Checking status does not require admin access.
## [Check quota status in the dashboard](#check-quota-status-in-the-dashboard)
The **Models** page in the [Aperture dashboard](/docs/aperture/reference/dashboard) displays quota status alongside each model's pricing. When quotas are configured, the pricing tooltip shows the applicable bucket names, current balance, refill rate, and last updated timestamp.
## [Check quota status using the API](#check-quota-status-using-the-api)
Query the `GET /api/quotas` endpoint to retrieve the current status of all quota buckets:
```
`curl http://ai/api/quotas
`
```
The response includes each bucket's name, current balance, capacity, and refill rate.
## [Refill a quota bucket](#refill-a-quota-bucket)
Admins can manually add funds to a depleted bucket using the `POST /api/quotas/refill` endpoint:
```
`curl -X POST http://ai/api/quotas/refill \\
-H "Content-Type: application/json" \\
-d '{"bucket": "daily:alice@example.com", "amount": "$5.00"}'
`
```
Replace the `bucket` value with the name of the bucket to refill. The `amount` value adds to the current balance up to the bucket's configured `capacity`. Aperture does not allow the balance to exceed `capacity`.
Only users with [admin access](/docs/aperture/how-to/set-up-admin-access) can refill quota buckets.
## [Next steps](#next-steps)
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) if you have not configured individual budgets yet.
* [Set a team-wide budget](/docs/aperture/how-to/set-team-budget) to cap total organizational spending.
* [Export usage data to S3](/docs/aperture/how-to/export-usage-data-to-s3) for long-term cost analysis and reporting.
On this page
* [Prerequisites](#prerequisites)
* [Check quota status in the dashboard](#check-quota-status-in-the-dashboard)
* [Check quota status using the API](#check-quota-status-using-the-api)
* [Refill a quota bucket](#refill-a-quota-bucket)
* [Next steps](#next-steps)
Scroll to top