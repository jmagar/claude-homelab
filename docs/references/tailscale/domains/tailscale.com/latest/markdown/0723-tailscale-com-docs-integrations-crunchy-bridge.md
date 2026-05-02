Access Crunchy Bridge privately using Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access Crunchy Bridge privately using Tailscale
Last validated: Jan 12, 2026
[Crunchy Bridge](https://www.crunchydata.com/products/crunchy-bridge) is a managed Postgres service run in major cloud providers such as
Amazon Web Services, Microsoft Azure, and Google Cloud Platform. It is built by the company
[Crunchy Data](https://www.crunchydata.com). Each Crunchy Bridge instance lives in its own virtual private cloud
(VPC). The Tailscale integration for Crunchy Bridge lets users to connect to their Crunchy Bridge
cluster securely for clouds where there are no VPCs, or directly where VPC peering doesn't make
sense, for example, for testing.
## [Prerequisites](#prerequisites)
Before you begin this guide, you'll need a tailnet and a Crunchy Bridge account.
* For information about creating a tailnet, refer to the [Tailscale quickstart](/docs/how-to/quickstart).
* For information about creating a Crunchy Bridge account, refer to [Crunchy Bridge](https://www.crunchydata.com/products/crunchy-bridge).
## [Integration](#integration)
Refer to the full instructions in Crunchy Data's [blog post](https://www.crunchydata.com/blog/crunchy-bridge-with-tailscale) for setting up an
integration with Tailscale.
To use Crunchy Bridge with Tailscale, you'll need to:
1. Create an [auth key](/docs/features/access-control/auth-keys). You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to create an auth key.
To create the key, open the [Keys](https://login.tailscale.com/admin/settings/keys) page in the Tailscale admin console. We
recommend using a tagged reusable pre-authorized key for this purpose. A [tagged](/docs/features/tags) key
restricts the Crunchy Bridge device's permissions based on the [access control rules](/docs/features/access-control)
for the tag that will apply as soon as the device is provisioned. A reusable key is useful in
retry connection logic, and pre-authorized so that every new instance doesn't need to be authorized.
**Be very careful with reusable keys!** These can be very dangerous if stolen.
They're best kept in a key vault product specially designed for the purpose.
1. In the Crunchy Bridge dashboard for managing your cluster, select **Networking** and then select
**Tailscale**. For **Auth Key**, paste in the auth key that you previously created.
2. Select **Connect Tailscale**.
3. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console. After the connection
initializes, you should refer to the Crunchy Bridge cluster device in your tailnet. Copy the
Tailscale IP address, which is in the form [`100.x.y.z` format](/docs/reference/glossary#tailscale-ip-address).
4. Use the Tailscale IP address when you connect to your Crunchy Bridge cluster. For example, if the
Tailscale IP address is `100.100.123.123` and you're using port `5432`:
```
`psql postgres://application:\<your-application-id\>@100.100.123.123:5432/postgres
`
```
## [Limitations](#limitations)
* Auth keys expire after 90 days.
On this page
* [Prerequisites](#prerequisites)
* [Integration](#integration)
* [Limitations](#limitations)
Scroll to top