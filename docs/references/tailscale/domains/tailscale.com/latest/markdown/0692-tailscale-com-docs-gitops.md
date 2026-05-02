GitOps for Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# GitOps for Tailscale
Last validated: May 2, 2025
GitOps for Tailscale is available for [all plans](/pricing).
[GitOps](https://opengitops.dev) for Tailscale is an alternative to managing [access control policies](/docs/features/access-control) and the [tailnet policy file](/docs/features/tailnet-policy-file) using the admin console. Using GitOps offers some distinct advantages. It lets you leverage all the benefits of Git version control for your tailnet policy file such as maintaining multiple versions, auditing commits, and adopting a config as code approach.
You can also require reviews before merging changes, invoke automatic tests to run upon tailnet policy file changes, and automatically apply validated changes to your policy file.
When you use GitOps, Tailscale automatically validates changes to the tailnet policy file when you push or pull changes using Git.
GitOps for Tailscale works with Bitbucket, GitHub Actions, and GitLab CI. Explore the following topics to enable, disable, and manage GitOps for Tailscale:
[
#### GitOps for Tailscale with Bitbucket
Use a Bitbucket CI to maintain your tailnet policy file as code.
](/docs/integrations/bitbucket/gitops)
[
#### GitOps for Tailscale with GitHub Actions
Use a GitHub Action to maintain your tailnet policy file as code.
](/docs/integrations/github/gitops)
[
#### GitOps for Tailscale with GitLab CI
Use a GitLab CI to maintain your tailnet policy file as code.
](/docs/integrations/gitlab/gitops)
Scroll to top