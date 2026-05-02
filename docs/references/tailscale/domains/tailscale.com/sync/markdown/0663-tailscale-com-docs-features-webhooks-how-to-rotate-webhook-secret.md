Rotate a webhook secret · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Rotate a webhook secret
Last validated: Jan 20, 2026
[Webhook](/docs/features/webhooks) secrets authenticate incoming webhook events from Tailscale to your endpoint. You rotate a webhook secret when you need to replace the existing secret with a new one, either as part of regular security maintenance or after a potential compromise. This process generates a new secret while maintaining your webhook endpoint configuration.
## [Prerequisites](#prerequisites)
To rotate a webhook secret, ensure you meet the following prerequisites:
* [Be an Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles).
* Have an existing webhook endpoint configured in the admin console.
## [Instructions](#instructions)
The following instructions guide you through the process of rotating a webhook secret in the Tailscale admin console.
Rotating a webhook secret replaces the existing secret with a new one. The old secret stops working immediately after rotation, so you need to update your verification routine with the new secret to continue receiving events.
1. Open the [Webhooks](https://login.tailscale.com/admin/settings/webhooks) page of the admin console.
2. Find the endpoint for which to rotate the secret, then select the menu \> **Rotate webhook secret**. This opens the **Rotate webhook secret** modal.
3. Select **Rotate** to confirm you want a new secret.
4. In the **Rotate webhook secret** modal, select **Copy** to copy the new secret.
5. Save the secret in a secure location. You won't be able to access it again after closing the modal.
Treat the webhook secret like a password. Make sure to store it in a secure location.
6. Select **Done**.
The new secret takes effect immediately for all new events. Update your [signature verification](/docs/features/webhooks#verifying-an-event-signature) routine with the new secret to continue processing webhook events.
## [Next steps](#next-steps)
After rotating your webhook secret, consider the following next steps:
* [Verify webhook signatures](/docs/features/webhooks#verifying-an-event-signature): Update your verification code with the new secret.
* [Test webhook endpoints](/docs/features/webhooks#testing-webhooks): Send test events to confirm your endpoint works with the new secret.
* [Configure webhook events](/docs/features/webhooks#setting-up-a-webhook-endpoint): Manage which events trigger notifications to your endpoint.
On this page
* [Prerequisites](#prerequisites)
* [Instructions](#instructions)
* [Next steps](#next-steps)
Scroll to top