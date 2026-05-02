Connect a Docker container to your tailnet with standalone Docker · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Connect a Docker container to your tailnet with standalone Docker
Last validated: Mar 23, 2026
You can create a Docker container in a single command by specifying all required options inline. The advantage of this method is it's faster, and requires no additional setup.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* A Tailscale account with permission to generate [auth keys](/docs/features/access-control/auth-keys) from the admin console.
* Basic familiarity with using a terminal or command line interface.
Once you have these ready, you can start connecting Docker containers to your tailnet.
## [Pull the Tailscale Docker image](#pull-the-tailscale-docker-image)
Before running a container, Docker needs a copy of the image on your local system. You can download an image explicitly using `docker pull`, or you can let Docker handle it automatically when you run `docker run` or `docker compose up`. In most cases, Docker will pull the image for you if it is not already present. However, running `docker pull` manually is useful when you want to ensure you are using the most recent version or when preparing environments in advance.
To get started, download the Tailscale image from a container registry such as Docker Hub or GitHub Container Registry to the machine where you plan to run containers. Pulling the image once lets you create as many containers as needed, and you can pull it again later to upgrade to a newer Tailscale version.
To pull the Docker image from Docker Hub, run:
```
`docker pull tailscale/tailscale:latest
`
```
To pull the Docker image from GitHub Container Registry, run:
```
`docker pull ghcr.io/tailscale/tailscale:latest
`
```
To pull a specific stable version, either with or without the patch version number (for example, `.1`):
```
`docker pull tailscale/tailscale:v1.94.1
`
```
To pull a specific unstable version:
```
`docker pull tailscale/tailscale:unstable-v1.94.38
`
```
For information about Tailscale client releases and version, refer to [Tailscale client versions and release tracks](/docs/reference/tailscale-client-versions).
## [Generate an auth key](#generate-an-auth-key)
You can automatically connect Docker containers to your tailnet by generating an authentication key and adding it to your Docker configuration, eliminating the need to log in manually.
1. Go to the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. In the **Auth keys** section, select **Generate auth key**.
1. Add a description to identify the key. The description does not affect configuration.
2. Leave all other options as-is.
3. Select **Generate key**.
4. Copy the key now. After you close the dialog, you cannot view it again.
For more information about Tailscale authentication keys, refer to [Auth keys](/docs/features/access-control/auth-keys).
## [Run the container](#run-the-container)
The Tailscale Docker image is run using the `docker run` command with the various instructions and details that are specific to your setup.
Alternatively, you can use [Docker Compose](https://docs.docker.com/compose/) which lets you define and manage multi container applications using a saved and reusable YAML file, instead of running a single Docker command. One of the main advantages of this method is that you can configure and start multiple related containers together as a single application stack. For information about installing Tailscale using Docker Compose, refer to [Connect Docker containers to your tailnet with Docker Compose](/docs/features/containers/docker/how-to/connect-docker-container).
In the following example, a Docker container is created that runs only the Tailscale client and is automatically authenticated to your tailnet using a generated auth key.
Make sure to replace `\<tskey-YOUR-AUTH-KEY\>` with the auth key you generated. You can also customize the field `--hostname=docker-node` to reflect the node name you want to appear in the Tailscale admin console.
```
`docker run -d \\
--name=tailscale \\
--hostname=docker-node \\
--cap-add=NET\_ADMIN \\
--cap-add=NET\_RAW \\
--device=/dev/net/tun \\
-e TS\_AUTHKEY=\<tskey-YOUR-AUTH-KEY\> \\
-e TS\_EXTRA\_ARGS=--advertise-tags=tag:container \\
-e TS\_STATE\_DIR=/var/lib/tailscale \\
-e TS\_USERSPACE=false \\
-v ./tailscale-nginx/state:/var/lib/tailscale
--restart unless-stopped \\
tailscale/tailscale:latest
`
```
Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and verify that `docker-node` entry displays. This confirms that the node is successfully added to your tailnet.
Refer to [Connect a Docker container to your tailnet with Docker Compose](/docs/features/containers/docker/how-to/connect-docker-container), for an example YAML file as well as field and flag descriptions that you can also use for installing Docker in a container from either the command line or in the GUI of your [preferred container management tool](/docs/features/containers/docker/how-to/connect-docker-alt-manager).
Refer to [Docker's official CLI documentation](https://docs.docker.com/reference/cli/docker/) for a list of Docker commands.
On this page
* [Prerequisites](#prerequisites)
* [Pull the Tailscale Docker image](#pull-the-tailscale-docker-image)
* [Generate an auth key](#generate-an-auth-key)
* [Run the container](#run-the-container)
Scroll to top