Connect a Docker container to your tailnet with an alternative Docker manager · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Connect a Docker container to your tailnet with an alternative Docker manager
Last validated: Mar 23, 2026
You can run the `tailscale/tailscale` image with container management tools other than the Docker CLI or Docker Compose. The image and configuration remain the same. Only the method used to start and manage the container changes.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* A Tailscale account with permission to generate [auth keys](/docs/features/access-control/auth-keys) from the admin console.
* Basic familiarity with using a terminal or command line interface.
Once you have these ready, you can start connecting Docker containers to your tailnet.
## [Common management tools](#common-management-tools)
Common Docker management tools include:
* [Colima](https://github.com/abiosoft/colima): Lightweight container runtime often used on macOS as an alternative to Docker Desktop.
* [Dockhand](https://dockhand.pro/): A more advanced web-based interface for managing Docker containers.
* [Portainer](https://www.portainer.io/): Web-based interface for managing Docker containers.
* [Podman](https://podman.io/): Docker compatible container engine that does not require a background service.
Make sure to consult the product specific documentation for set up and management guidance.
Docker Desktop is another application available for macOS and Windows that includes Docker Engine, Docker Compose, a graphical interface, and supporting services for running containers locally. Tailscale recommends installing Docker Engine and the Docker Compose plugin directly when possible to reduce additional system overhead and more closely match production Linux environments.
## [Generate an auth key](#generate-an-auth-key)
You can automatically connect Docker containers to your tailnet by generating an authentication key and adding it to your Docker configuration, eliminating the need to log in manually.
1. Go to the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. In the **Auth keys** section, select **Generate auth key**.
1. Add a description to identify the key. The description does not affect configuration.
2. Leave all other options as-is.
3. Select **Generate key**.
4. Copy the key now. After you close the dialog, you cannot view it again.
For more information about Tailscale authentication keys, refer to [Auth keys](/docs/features/access-control/auth-keys).
## [Further exploration](#further-exploration)
Refer to [Connect a Docker container to your tailnet with Docker Compose](/docs/features/containers/docker/how-to/connect-docker-container), for an example YAML file as well as field and flag descriptions that you can use for installing Docker in a container from either the command line or in the GUI, using your preferred container management tool.
On this page
* [Prerequisites](#prerequisites)
* [Common management tools](#common-management-tools)
* [Generate an auth key](#generate-an-auth-key)
* [Further exploration](#further-exploration)
Scroll to top