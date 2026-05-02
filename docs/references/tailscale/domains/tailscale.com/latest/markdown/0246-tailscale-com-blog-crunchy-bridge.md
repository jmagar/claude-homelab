Postgres Crunchy Bridge with Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 15, 2022
# Postgres Crunchy Bridge with Tailscale
Today we are happy to announce that [Crunchy Bridge has integrated with Tailscale](https://www.crunchydata.com/blog/crunchy-bridge-with-tailscale) to provide easy access to your database from any of your devices, wherever they are running. [Crunchy Bridge](https://www.crunchydata.com/products/crunchy-bridge) is a managed Postgres product that runs your database for you on your choice of cloud.
Securing access to databases is [tricky business](/blog/introducing-pgproxy/). There is nothing more important to keep away from the general internet than your database, and simultaneously it is the critical piece of infrastructure your applications and your developers need to access.
Crunchy Bridge is one answer to that problem, keeping your data available and backed up, while providing an API for automating management and scaling, and integrating popular PostgreSQL extensions. This makes it easy to go beyond the limits of a single-cloud provider’s VPC peering system, either for multi-cloud environments, cloud migrations, or to reach developer infrastructure where it is.
To use the Crunchy Bridge integration, generate an auth key in the Tailscale admin console and add the key to your Crunch Bridge cluster settings under **Networking**. Your Postgres instance to appears on your tailnet — so you can access it from anywhere. You can then use Tailscale’s network [access control features](/kb/1018/acls/) to limit exactly who and what on your tailnet can reach your database.
To learn more, read [Crunchy Bridge’s blog post](https://www.crunchydata.com/blog/crunchy-bridge-with-tailscale). See [our documentation](/kb/1231/crunchy-bridge/) for instructions on using the integration.
Share
Author
David Crawshaw
Author
David Crawshaw
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