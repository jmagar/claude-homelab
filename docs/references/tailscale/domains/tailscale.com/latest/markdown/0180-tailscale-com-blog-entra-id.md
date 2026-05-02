Microsoft Entra ID Access Provisioning Now Available for Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productAugust 13, 2024
# Microsoft Entra ID Access Provisioning Available for Tailscale
Today, we’re making user and group provisioning for Microsoft Entra ID generally available for Tailscale Enterprise plans. This release expands on the [beta support for Microsoft System for Cross-domain Identity Management (SCIM)](https://tailscale.com/blog/sync-azuread-groups) we shipped back in August. Since then, Azure Active Directory has evolved into Microsoft Entra ID, and we’ve evolved along with it.
### [Entra a whole new era of SCIM automation](#entra-a-whole-new-era-of-scim-automation)
The Tailscale and Microsoft Entra ID integration enables you to automate the process of creating new users to access your tailnet, removing users when they no longer need to have access, and more. By integrating Tailscale and Microsoft Entra ID, you can:
* **Create users** in Tailscale from Microsoft Entra ID
* **Disable users** in Microsoft Entra ID to suspend Tailscale access
* **Delete users** in Microsoft Entra ID to suspend them in Tailscale; such users are then automatically deleted from Tailscale in approximately 30 days
* **Keep user attributes in sync** between Microsoft Entra ID and Tailscale
* **Provision groups and group attributes** in Entra ID and push to Tailscale### [Streamline onboarding/offboarding for your Microsoft environment](#streamline-onboardingoffboarding-for-your-microsoft-environment)
Manually onboarding and offboarding users across multiple platforms can be a time consuming and error-prone process. With Tailscale and Microsoft Entra ID, it becomes an automated and transparent function.
When configured, Microsoft Entra ID automatically provisions and deprovisions users and groups to Tailscale using the Microsoft Entra provisioning service. This means no duplicated efforts or inadvertent continued access to resources on your tailnet when a user is deleted. It also means faster ramp-up time as new users are automatically provisioned in Tailscale when added to Entra ID.
### [Get started with modernized user management today](#get-started-with-modernized-user-management-today)
Owners, Admins and IT Admins of Tailscale Enterprise plans can start using Entra ID for user provisioning today Check out the [resources in the Tailscale Knowledge Base](https://tailscale.com/kb/1249/sso-entra-id-scim) and [Microsoft’s Tailscale provisioning ](https://learn.microsoft.com/en-us/entra/identity/saas-apps/tailscale-provisioning-tutorial)tutorial to learn more about setting up and configuring the integration.
Share
Author
Tinku Thomas
Contributors
Andrew Dunham
Ramya Nagarajan
Jenny Zhang
Author
Tinku Thomas
Contributors
Andrew Dunham
Ramya Nagarajan
Jenny Zhang
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