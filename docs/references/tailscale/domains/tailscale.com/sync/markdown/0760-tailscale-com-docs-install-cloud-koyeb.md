Tailscale on Koyeb · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale on Koyeb
Last validated: Jan 5, 2026
[Koyeb](https://www.koyeb.com) is a serverless platform for seamlessly deploying AI applications and databases on high-performance infrastructure, including CPUs, GPUs, and Accelerators around the world.
You can add Tailscale to a Koyeb application to let your Koyeb Services communicate with other devices and services in your tailnet.
## [Step 1: Generate an auth key to authenticate your Service on Koyeb](#step-1-generate-an-auth-key-to-authenticate-your-service-on-koyeb)
Start by [generating an auth key](/docs/features/access-control/auth-keys) to let your Koyeb service join your tailnet.
Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console and select **Generate auth key**. It's best practice to use a reusable and pre-authorized [ephemeral key](/docs/features/ephemeral-nodes) for this purpose because it automatically cleans up devices after they shut down.
The **Pre-approved** option will only display in the dialog if [device approval](/docs/features/access-control/device-management/device-approval) is enabled in your Tailscale network.
Next, open a terminal and use the following command to create a [Koyeb Secret](https://www.koyeb.com/docs/reference/secrets) to securely store the auth key on Koyeb.
```
`koyeb secrets create TAILSCALE\_AUTHKEY -v "tskey-\<key\>"
`
```
Pass this Secret using an environment variable to your Koyeb Service to authenticate your application and join your tailnet.
## [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
Next, build a [multistage Dockerfile](https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds) with two stages:
* The first stage compiles and builds your application code.
* The second stage pulls your application code and Tailscale into a final image that you can deploy to Koyeb.
In your `Dockerfile`:
```
`FROM alpine:latest as builder
WORKDIR /app
COPY . ./
# This is where you build the application code as well.
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM alpine:latest
RUN apk update && apk add ca-certificates iptables ip6tables && rm -rf /var/cache/apk/\*
# Copy binary to production image.
COPY --from=builder /app/start.sh /app/start.sh
# Copy Tailscale binaries from the tailscale image on Docker Hub.
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscaled /app/tailscaled
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscale /app/tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale
# Run on container startup.
CMD ["/app/start.sh"]
`
```
The Dockerfile specifies the `/app/start.sh` script as the initial process to run. This script starts Tailscale, then runs the application binary. This is where you use the `TAILSCALE\_AUTHKEY` variable you defined when you generated an auth key.
Create a new file named `start.sh` in the root directory of your application and add the following content to the file to start Tailscale and launch your app:
```
`#!/bin/sh
# Start Tailscale
/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --ssh --auth-key=${TAILSCALE\_AUTHKEY} --hostname=tailscale-on-koyeb
# Start your app
/app/my-app
`
```
You pass the `--ssh` flag to `/app/tailscale up` to authorize SSH connections to the node. This will let you ensure everything is working as expected and let you connect to the node using SSH from your tailnet. Refer to [Tailscale SSH documentation](/docs/features/tailscale-ssh) for more information.
Save the file. You're ready to deploy.
## [Step 3: Deploy your app to Koyeb](#step-3-deploy-your-app-to-koyeb)
To deploy the application on Koyeb, run the following command from your application's root directory. This command creates and deploys a new Koyeb service that connects to your tailnet:
```
`koyeb deploy . myapp/main --instance-type small --region was --type worker --archive-builder docker --env TAILSCALE\_AUTHKEY=@TAILSCALE\_AUTHKEY --privileged
`
```
Run the following command to use SSH to confirm you can connect to the service:
```
`tailscale ssh root@tailscale-on-koyeb
`
```
For more information about Koyeb, the Koyeb CLI, resources, service types, and deployment options, refer to the [Koyeb documentation](https://www.koyeb.com/docs).
## [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
When an ephemeral node goes offline, it is automatically removed from your tailnet. You can also control ephemeral node removal using the [`tailscale logout`](/docs/reference/tailscale-cli#logout) command to either manually force the removal or incorporate the command into the [`tailscaled`](/docs/reference/tailscaled) Tailscale daemon. For more information, refer to [Ephemeral nodes](/docs/features/ephemeral-nodes#faq).
On this page
* [Step 1: Generate an auth key to authenticate your Service on Koyeb](#step-1-generate-an-auth-key-to-authenticate-your-service-on-koyeb)
* [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
* [Step 3: Deploy your app to Koyeb](#step-3-deploy-your-app-to-koyeb)
* [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
Scroll to top