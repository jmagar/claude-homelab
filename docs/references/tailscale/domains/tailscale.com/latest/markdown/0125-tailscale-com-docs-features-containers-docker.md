Docker · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Docker
Last validated: Mar 23, 2026
Installing applications like web servers, databases, or self-hosted services directly on your machine can create challenges. Each service needs specific dependencies that can conflict with other software, setup requires multiple steps, and removal can be difficult. To access these services remotely, you typically need to expose them to the public internet, which creates security risks. [Docker](https://www.docker.com/) containers solve these problems by packaging each application with everything it needs in an isolated environment. You can run multiple services without conflicts, test software without cluttering your system, and remove containers cleanly. When you connect Docker containers to your tailnet, you can securely access these services from anywhere without public exposure.
Common use cases include running self-hosted applications such as Plex, Grafana, and Home Assistant, accessing development databases and tools remotely, connecting microservices across different hosts, and testing applications in isolated environments. Refer to [Tailscale Docker code examples](https://github.com/tailscale-dev/docker-guide-code-examples) in GitHub, for more ideas and examples of what you can install alongside the Tailscale client in a container.
[
#### Understanding Docker components
Docker components overview covering Engine that runs containers, Dockerfiles that define images, images that package apps, containers that run them, and Compose for multi container setups.
](/docs/features/containers/docker/docker-components)
[
#### Connect a Docker container to your tailnet with standalone Docker
Run the Tailscale Docker image using a single command to create and authenticate a container to your tailnet.
](/docs/features/containers/docker/how-to/connect-docker-standalone)
[
#### Connect a Docker container to your tailnet with Docker Compose
Set up a Tailscale-connected container using Docker Compose with nginx, allowing secure access to the service over your tailnet.
](/docs/features/containers/docker/how-to/connect-docker-container)
[
#### Connect a Docker container to your tailnet with an alternative Docker manager
Run the Tailscale Docker image with alternative container managers like Podman, Portainer, or Colima using the same configuration.
](/docs/features/containers/docker/how-to/connect-docker-alt-manager)
[
#### Docker configuration parameters
Use Docker environment variables to configure how a Tailscale container authenticates, connects to your tailnet, and exposes services.
](/docs/features/containers/docker/docker-params)
For a step-by-step visual guide to getting started, watch this video:
Scroll to top