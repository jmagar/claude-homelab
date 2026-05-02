Access your tailnet GitHub Codespaces · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access your tailnet GitHub Codespaces
Last validated: Jan 5, 2026
[GitHub Codespaces](https://github.com/features/codespaces) is a way to run Visual Studio
Code—with its editor, terminal, debugger, version control, settings sync,
and the entire ecosystem of extensions—hosted in the cloud.
Tailscale can be installed within a Codespace to be able to access private resources
such as package registries or license servers securely, regardless of whether they're in
the cloud or on premises. You can also use Tailscale to share your development or staging
environment with a colleague.
## [Integration](#integration)
When using [GitHub Codespaces](https://github.com/features/codespaces), you can include Tailscale as a [feature](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-features-to-a-devcontainer-file) in your [dev container](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/introduction-to-dev-containers).
This feature is available from the [`tailscale/codespace` repository](https://github.com/tailscale/codespace).
To use the Tailscale feature, in your `devcontainer.json` include:
```
`"runArgs": ["--device=/dev/net/tun"],
"features": {
// ...
"ghcr.io/tailscale/codespace/tailscale": {}
// ...
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Then launch your codespace.
## [Authorization](#authorization)
The first time the codespace starts it is necessary to authenticate it to join the tailnet.
In the terminal window run: `tailscale set --accept-routes`
This will print a URL to visit in a browser where you can log into the desired account.
On this page
* [Integration](#integration)
* [Authorization](#authorization)
Scroll to top