Tailscale for DevOps: Give CodeSandbox access to private resources on your tailnet
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|February 07, 2023
# Tailscale for DevOps: Give CodeSandbox access to private resources on your tailnet
Developing software in an IDE like CodeSandbox requires access to many on-prem or cloud resources, from package and container image registries to databases. When you’re using CodeSandbox for remote development, you’ll want to access those resources securely and with the lowest possible latency — even if they’re behind a firewall or don’t have public IP addresses. Perhaps most importantly, you’ll want the ability to easily share access with coworkers so they can do things like review code or pair programming. From a CodeSandbox Repository, you can grant applications access to private resources on your tailnet, and share what you’re working on with peers, using Tailscale.
### Using Tailscale with CodeSandbox
[CodeSandbox](https://codesandbox.io/)lets you rapidly develop and share code in remote environments, even from mobile devices such as your phone or iPad. Having Tailscale setup means that you can also grant bi-directional access from containers in your CodeSandbox Repository environment to private resources in your tailnet. Using Tailscale with CodeSandbox also means that you benefit from Tailscale’s fine-grained access control layer (ACLs), visibility, and audit features while also being able to work with the end device of your choice — whether you’re using an iPad in a coffee shop, or on your laptop at home.
Integrating a CodeSandbox Repository with Tailscale requires an[auth key](/kb/1085/auth-keys/)— a secret you embed in the CodeSandbox environment that allows it to join your tailnet. Network admins can generate a key from the[Keys page](https://login.tailscale.com/admin/settings/keys)of the admin console. Depending on your tailnet setup, you may also want the key to be tagged so CodeSandbox environments are automatically labeled and access-controlled via[Tailscale ACLs](/kb/1018/acls/).
To use Tailscale with CodeSandbox you’ll need to add a tailscaled container to a Dockerized application setup (for example, using docker-compose), and add the Tailscale auth key as an environment variable. For more details, see the instructions in[CodeSandbox](https://codesandbox.io/docs/learn/integrations/tailscale)’s or[Tailscale’s docs](/kb/1221/codesandbox/?q=codesand).
Connect your CodeSandbox Repository environment to your tailnet.
### What can you do with Tailscale in CodeSandbox?
* Create web apps and experiment with code
* Test ideas and share staged resources
* Access cloud or on-prem resources like production databases or a package registry
* Complete a coding interview
* Enable pair programming
To connect to your tailnet from a CodeSandbox Repository, follow the[instructions in CodeSandbox’s docs](https://codesandbox.io/docs/learn/integrations/tailscale).
Share
Author
Jeff Spencer
Author
Jeff Spencer
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