Connect a Docker container to your tailnet with Docker Compose · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Connect a Docker container to your tailnet with Docker Compose
Last validated: Mar 23, 2026
Use this guide to run a container that combines the Tailscale client with an [nginx](https://nginx.org/) web server and reverse proxy, using the [Docker Compose](https://docs.docker.com/compose/) command line method. The nginx container shares the Tailscale network connection, allowing you to access it securely over your tailnet.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* Docker Engine installed and running.
* Docker Compose installed and accessible using the `docker compose` command.
* A Tailscale account with permission to generate [auth keys](/docs/features/access-control/auth-keys) from the admin console.
Once you have these ready, you can start connecting Docker containers to your tailnet.
## [Generate an auth key](#generate-an-auth-key)
You can automatically connect Docker containers to your tailnet by generating an authentication key and adding it to your Docker configuration, eliminating the need to log in manually.
1. Go to the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. In the **Auth keys** section, select **Generate auth key**.
1. Add a description to identify the key. The description does not affect configuration.
2. Leave all other options as-is.
3. Select **Generate key**.
4. Copy the key now. After you close the dialog, you cannot view it again.
For more information about Tailscale authentication keys, refer to [Auth keys](/docs/features/access-control/auth-keys).
## [Create and run your container](#create-and-run-your-container)
1. Create a new file named `docker-compose.yml` in your project directory and add your configuration instructions in the file. The following configuration defines two services. One for the Tailscale client and one for nginx web server.
```
`services:
tailscale:
image: tailscale/tailscale:latest
hostname: tailscale-nginx
environment:
- TS\_AUTHKEY=\<tskey-YOUR-AUTH-KEY\>
- TS\_EXTRA\_ARGS=--advertise-tags=tag:container
- TS\_STATE\_DIR=/var/lib/tailscale
- TS\_USERSPACE=false
volumes:
- ./tailscale-nginx/state:/var/lib/tailscale
devices:
- /dev/net/tun:/dev/net/tun
cap\_add:
- net\_admin
- net\_raw
restart: unless-stopped
nginx:
image: nginx
depends\_on:
- tailscale
network\_mode: service:tailscale
`
```
Correct YAML formatting is critical. The file uses indentation (spaces, not tabs) to show structure and hierarchy. Each level of indentation must be consistent, typically using two spaces. Incorrect indentation will cause Docker Compose to fail with parsing errors.
2. Replace `\<tskey-YOUR-AUTH-KEY\>` with the auth key you generated.
3. Save the file, then start the containers:
```
`docker compose up -d
`
```
4. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and verify that `tailscale-nginx` appears.
From a browser on a device connected to your tailnet, go to `http://tailscale-nginx`. The "Welcome to nginx" page appears.
## [Docker Compose example details](#docker-compose-example-details)
Based on the Docker Compose YAML example in this topic, here is a breakdown of the included fields and flags for this setup:
* `services`: Defines the containers that will run in the application stack.
* `tailscale` (app #1): Runs the Tailscale client in a container.
* `image: tailscale/tailscale:latest`: Uses the latest stable Tailscale image.
* `hostname: tailscale-nginx`: Sets the node name that appears in your tailnet.
* `environment`: Passes configuration into the container.
* `TS\_AUTHKEY`: Authenticates the container to your tailnet.
* `TS\_STATE\_DIR`: Sets where Tailscale stores state inside the container.
* `TS\_USERSPACE=false`: Uses kernel networking instead of userspace networking.
* `volumes`: Persists Tailscale state across restarts.
* `./tailscale-nginx/state:/var/lib/tailscale`: Stores state on the host.
* `devices`: Lets the container access specific hardware or system devices from the host machine.
* `/dev/net/tun:/dev/net/tun`: Grants access to the host TUN device. This is required when using kernel networking so the container can create and manage its virtual network interface.
* `cap\_add`: Grants additional Linux capabilities to a container beyond the default restricted set.
* `net\_admin`: Lets the container configure network interfaces, routing tables, and other network settings. This capability is required when using kernel networking with Tailscale.
* `restart: unless-stopped`: Restarts the container automatically unless you stop it manually.
* `nginx` (app #2): Runs the nginx web server.
* `image: nginx`: Uses the official nginx Docker image from Docker Hub.
* `depends\_on`: Starts nginx after the Tailscale container.
* `network\_mode: service:tailscale`: Makes the nginx container share the Tailscale container's network stack. This means nginx becomes accessible through the Tailscale connection.
For more example configurations with Tailscale, refer to [`tailscale-dev/docker-guide-code-examples`](https://github.com/tailscale-dev/docker-guide-code-examples).
On this page
* [Prerequisites](#prerequisites)
* [Generate an auth key](#generate-an-auth-key)
* [Create and run your container](#create-and-run-your-container)
* [Docker Compose example details](#docker-compose-example-details)
Scroll to top