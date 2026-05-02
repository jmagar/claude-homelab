Access your tailnet from CodeSandbox · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access your tailnet from CodeSandbox
Last validated: Jan 5, 2026
[CodeSandbox](https://codesandbox.io) is an online code editor and IDE for rapid web development.
Tailscale can be installed within a CodeSandbox Repository environment to be able to access private resources securely.
You can develop your application as if it were hosted in the same network as your other services, without
compromising security.
Tailscale works in CodeSandbox Repository environments by adding a container to a Dockerized application setup (for
example, using `docker-compose`). The additional container runs the Tailscale client and provides networking for the other
containers.
## [Integration](#integration)
Follow the [CodeSandbox instructions for getting Tailscale working in a CodeSandbox Repository](https://codesandbox.io/docs/learn/integrations/tailscale).
You'll need to:
1. Create an [auth key](/docs/features/access-control/auth-keys) in the [Keys](https://login.tailscale.com/admin/settings/keys) page of the Tailscale admin console. The [key type](/docs/features/access-control/auth-keys#types-of-auth-keys)
should be reusable, ephemeral, and pre-authorized. You may also want to make the key type tagged, so your CodeSandbox
environments are automatically labeled and granted access that is controlled by using [Tailscale access control policies](/docs/features/access-control).
2. Add the auth key as a [CodeSandbox environment variable](https://codesandbox.io/docs/learn/environment/secrets), named `TS\_AUTHKEY`.
3. Add the [`tailscale/tailscale` Docker image](https://hub.docker.com/r/tailscale/tailscale) as an additional service beside your application.
## [Authorization](#authorization)
Authenticate to Tailscale from your workspace by referencing the `TS\_AUTHKEY` environment variable in your Docker tasks
when you start Tailscale. For example:
```
`docker-compose exec tailscale tailscale up \\
--auth-key=${TS\_AUTHKEY} --accept-routes --hostname=csb-${HOSTNAME}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
On this page
* [Integration](#integration)
* [Authorization](#authorization)
Scroll to top