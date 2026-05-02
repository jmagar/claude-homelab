Automations · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Automations
Last validated: Dec 14, 2025
Streamline and [automate your Tailscale workflow](/learn/provision-manage-and-query-tailscale-resources-programmatically-as-code) using official infrastructure as code (IaC) providers, the Tailscale application programming interface (API), webhooks, and integrations.
## [Infrastructure as code](#infrastructure-as-code)
[Infrastructure as code (IaC)](/docs/integration-infrastructure-as-code) is a method of managing infrastructure using machine-readable definition files rather than physical hardware or interactive configuration tools. Tailscale offers official providers for Terraform and Pulumi that let you interact with the [Tailscale API](/docs/reference/tailscale-api) to manage various Tailscale resources, such as access control policies, devices, nameservers, and other configurations.
[
#### Manage Tailscale resources using Terraform
Use the Terraform Tailscale provider to interact with the Tailscale API.
](/docs/integrations/terraform-provider)
[
#### Manage Tailscale resources using Pulumi
Use the Pulumi Tailscale provider to interact with the Tailscale API.
](/docs/integrations/pulumi-provider)
## [API](#api)
Tailscale offers an API to let you automate various aspects of your network.
[
#### Tailscale API
Explore the Tailscale application programming interface (API).
](/docs/reference/tailscale-api)
## [Webhooks](#webhooks)
Webhooks let you subscribe to certain events on your Tailscale network and process the event notifications through an integration or app.
[
#### Webhooks
Set up a webhook to receive notification of events on your Tailscale network.
](/docs/features/webhooks)
## [GitOps](#gitops)
[GitOps](https://opengitops.dev) for Tailscale is an alternative to managing [access control policies](/docs/features/access-control) and the [tailnet policy file](/docs/features/tailnet-policy-file) using the admin console.
[
#### GitOps for Tailscale with Bitbucket
Use a Bitbucket CI to maintain your tailnet policy file as code.
](/docs/integrations/bitbucket/gitops)
[
#### GitOps for Tailscale with GitLab CI
Use a GitLab CI to maintain your tailnet policy file as code.
](/docs/integrations/gitlab/gitops)
[
#### GitOps for Tailscale with GitHub Actions
Use a GitHub Action to maintain your tailnet policy file as code.
](/docs/integrations/github/gitops)
## [Tailscale Shortcuts for macOS and iOS](#tailscale-shortcuts-for-macos-and-ios)
Tailscale works with the Shortcuts app on macOS and iOS to provide several built-in shortcut actions, allowing you to automate tasks. For example, you can create shortcuts to connect your device to a tailnet, use an exit node, or switch user accounts.
[
#### macOS and iOS shortcuts
Understand how Tailscale works with the Shortcuts app, allowing you to automate tasks.
](/docs/features/mac-ios-shortcuts)
On this page
* [Infrastructure as code](#infrastructure-as-code)
* [API](#api)
* [Webhooks](#webhooks)
* [GitOps](#gitops)
* [Tailscale Shortcuts for macOS and iOS](#tailscale-shortcuts-for-macos-and-ios)
Scroll to top