Add multifactor authentication to any legacy service · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Add multifactor authentication to any legacy service
Last validated: Jan 5, 2026
The larger your company, the more likely you have "legacy" servers—the
ones that work, but your security team complains about because they refuse
to cooperate with your newest security features, especially multifactor
authentication (MFA).
Tailscale integrates with your [existing single-sign on (SSO)
provider](/docs/integrations/identity) for authentication (including multifactor
authentication). Then we enforce connection policy and authorization control
as part of the network itself. If someone isn't allowed to talk to a server,
the server completely disappears from their list of devices on the network, making it
inaccessible and immune to password-guessing or phishing attacks.
Tailscale lets you apply MFA to any and all legacy servers
including:
* Windows file shares
* Remote Desktop (RDP, Windows Terminal Services)
* Citrix
* SSH
* Database servers including Oracle, MS SQL, MySQL, and PostgreSQL
* Custom client-server apps (even if they are not web based)
* Any web app
No app-level integration or reconfiguration is required, because security is
built into the network itself. If you configure your network to require
Tailscale, every one of your internal services will be subject to
multifactor authentication.
Scroll to top