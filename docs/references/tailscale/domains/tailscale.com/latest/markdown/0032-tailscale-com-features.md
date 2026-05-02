Features · Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
## Networking should be simple(r)
Tailscale makes it easy to overlay any network topology, enforce the principle of least privilege, and continuously monitor your tailnet.
[
Get started
](https://login.tailscale.com/start)[
Contact sales
](/contact/sales)
## Application networking
Accelerate application development through 65+ integrations to accommodate any workflow.
### Auth keys
Pre-authentication keys automatically register new nodes without having to sign in via a web browser.
[
Learn more
](https://tailscale.com/kb/1085/auth-keys/)
### Service provisioning
ACL tags assign an identity to a node that’s used as part of an ACL to restrict access.
[
Learn more
](https://tailscale.com/kb/1068/acl-tags/)
### OAuth clients
Create access tokens for scoped access to the Tailscale API.
[
Learn more
](https://tailscale.com/kb/1215/oauth-clients/)
### Tailscale SSH
Tailscale brokered and authenticated SSH connection without managing SSH keys.
[
Learn more
](https://tailscale.com/kb/1193/tailscale-ssh/)
### Tailscale SSH console
Initiate browser-based SSH session from the admin console to a designated node.
[
Learn more
](https://tailscale.com/kb/1216/tailscale-ssh-console/)
### Tailscale funnel
Share a folder or service with the public internet over HTTPS.
[
Learn more
](https://tailscale.com/kb/1223/tailscale-funnel/)
## Continuous monitoring
Create a system of record to monitor performance, user-to-node interactions, and potential security incidents.
### Webhooks
Create event triggers that notify you in real-time via partner integrations.
[
Learn more
](https://tailscale.com/kb/1213/webhooks/)
### Configuration audit logging
Surface what configuration-based actions occurred, by whom, and when.
[
Learn more
](https://tailscale.com/kb/1203/audit-logging/)
### Network flow logging
Surface what node-to-node interaction occurred, and when.
[
Learn more
](https://tailscale.com/kb/1219/network-flow-logs/)
### Log streaming
Natively stream configuration or network flow logs to our SIEM integration partners.
[
Learn more
](https://tailscale.com/kb/1255/log-streaming/)
### Tailscale SSH session recording
Store any Tailscale SSH session recording long-term in any S3-compatible service or local disk.
[
Learn more
](https://tailscale.com/kb/1246/tailscale-ssh-session-recording/)
## Least privilege access
Identity is weaved directly into the network fabric to safeguard valuable resources with Access Control Lists (ACLs) enforceable at the node level.
### Access control lists (ACLs)
Create RBAC policies to determine which users, roles, or groups can access, which nodes on your tailnet.
[
Learn more
](https://tailscale.com/kb/1018/acls/)
### ACL tests
Verify ACLs coverage provides sufficient coverage against unnecessary exposure.
[
Learn more
](https://tailscale.com/kb/1337/acl-syntax#tests-tests)
### GitOps for ACLs
Manage ACLs version control within a CI/CD workflow using [GitHub](https://tailscale.com/kb/1204/gitops-acls/) or [GitLab](https://tailscale.com/kb/1254/gitops-acls-gitlab/).
[
Learn more
](https://tailscale.com/kb/1204/gitops-acls/)
### On-demand access
[Partner integrations](https://tailscale.com/kb/ondemand-access/) allow administrators to provide time-bound, elevated privileges for users.
[
Learn more
](https://tailscale.com/kb/ondemand-access/)
### Separation of administrative duties
Administrative roles with varying privileges to manage your tailnet.
[
Learn more
](https://tailscale.com/kb/1138/user-roles/)
## Mobile device management
Tailor Tailscale for the needs of your business with UI customization, auto-updates, runtime configurations and more, all integrated with your favorite Mobile Device Management solution.
### System Policies
Customize Tailscale using system policies
[
Learn more
](/kb/1315/mdm-keys)
### MDM solution integrations
Configure and deploy Tailscale using MDM solutions
[
Learn more
](/kb/integrations/mdm)
## Network connectivity
Securely connect users, devices, and services across any infrastructure without interruptions.
### Peer-to-peer connections
Tailscale uses WireGuard VPN protocol to establish low-latency, peer-to-peer connections.
[
Learn more
](https://tailscale.com/kb/1094/is-all-traffic-routed-through-tailscale/)
### End-to-end encryption
Tailscale uses WireGuard VPN protocol for end-to-end encryption.
[
Learn more
](https://tailscale.com/blog/how-tailscale-works/)
### Split tunneling
Split tunneling only routes internal traffic through the VPN for improved latency.
[
Learn more
](https://tailscale.com/learn/why-split-dns/)
### HA subnet routers
Ensure users can still access resources if a routing device becomes unavailable.
[
Learn more
](https://tailscale.com/kb/1115/subnet-failover/)
### Short DNS host names
MagicDNS automatically registers DNS names as human-readable for better discoverability.
[
Learn more
](https://tailscale.com/kb/1081/magicdns/)
### Search domains
Ensure users can still access resources if a routing device becomes unavailable.
[
Learn more
](https://tailscale.com/kb/1054/dns/#search-domains)
### IP space collision resolution
Route traffic to overlapping IPv4 subnets without renumbering with 4via6 subnet routers, by assigning unique IPv6 addresses for each subnet.
[
Learn more
](https://tailscale.com/kb/1201/4via6-subnets/)
### Exit node
Route all traffic through a designated egress point, similar to a privacy VPN.
[
Learn more
](https://tailscale.com/kb/1103/exit-nodes/)
## Posture management
Harden your security posture with built-in features to continuously enforce node-level policies.
### Device approval
Require devices to be approved by an administrator before joining the tailnet.
[
Learn more
](https://tailscale.com/kb/1099/device-approval/)
### Tailnet lock
A predetermined trusted node must verify the trusted keys of any nodes attempting to join your tailnet.
[
Learn more
](https://tailscale.com/kb/1226/tailnet-lock/)
### Device posture management
Collect device attributes and use them as part of connectivity rules within your Tailnet to limit access for devices that do not meet security requirements.
[
Learn more
](/kb/1288/device-posture)
### Device posture integrations
Configure EDR integrations like Crowdstrike to use their custom attributes as part of device posture checks for your Tailnet.
[
Learn more
](/kb/1289/crowdstrike-zta)
## Services Management
Monitor and safely share access to services running on machines on your tailnet.
### Node sharing
Share a node with any Tailscale user on any tailnet without exposing it to the public internet.
[
Learn more
](https://tailscale.com/kb/1084/sharing/)
### Taildrop
Transfer sensitive or large files with minimal latency between devices.
[
Learn more
](https://tailscale.com/kb/1106/taildrop/)
### Services
Monitor services on your tailnet in one central location.
[
Learn more
](https://tailscale.com/kb/1100/services/)
### HTTPS certificates
Enable HTTPS when connecting with web APIs or browsers to encrypt communications.
[
Learn more
](https://tailscale.com/kb/1153/enabling-https/)
### tsnet
Embed Tailscale inside Go programs to run multiple services on a single machine to create tools like [golinks](/blog/golink).
[
Learn more
](https://tailscale.com/kb/1244/tsnet/)
## User management
Create intuitive workflows to streamline user access with SSO, IdP, and SCIM support.
### SSO with IdP
Users can authenticate using one of our supported identity providers to access the tailnet.
[
Learn more
](https://tailscale.com/kb/1013/sso-providers/)
### User approval
Require users to be approved by an administrator before gaining access to the tailnet.
[
Learn more
](https://tailscale.com/kb/1239/user-approval/)
### Custom authentication periods
Require users to re-authenticate regularly.
[
Learn more
](https://tailscale.com/kb/1028/key-expiry/#setting-a-custom-authentication-period)
### Custom OIDC provider
Users can authenticate themselves using their organization’s custom OIDC.
[
Learn more
](https://tailscale.com/kb/1240/sso-custom-oidc)
### User & group provisioning (SCIM)
Sync users and group settings from one of our supported IdPs to keep ACLs up-to-date.
[
Learn more
](https://tailscale.com/kb/1180/sso-okta-scim/)
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)