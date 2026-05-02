Introducing GitHub secret scanning for Tailscale secrets
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJanuary 22, 2025
# Maintain security for your Tailscale secrets with GitHub
Tailscale provides a programmable network that is both secure enough to earn our customers’ trust and flexible enough to meet their networking needs across a wide range of infrastructure set-ups. We focus on making the locks trustworthy so our customers can focus on keeping track of their keys.
Today we’re announcing a secret scanning integration between Tailscale and GitHub, the world’s largest source code host. This collaborative effort marks our [fourth secret scanning partnership](https://tailscale.com/kb/1301/secret-scanning) established as part of continual efforts to secure customers’ tailnets.
GitHub [secret scanning](https://docs.github.com/en/code-security/secret-scanning/introduction/about-secret-scanning) now scans your source code, issues, pull requests, wikis, and other data for any Tailscale secrets. When a potential match is found, GitHub verifies the authenticity of the secret with Tailscale. If the secret is active, Tailscale will revoke the secret and notify users via email. We actually got this quietly kicked off a few months back in October — since then, it has discovered and revoked over 3,500 keys.
GitHub is now monitoring for five kinds of Tailscale secrets: API keys, Pre-authentication keys, OAuth client secrets, SCIM keys, and webhook keys. Keeping these keys safe is part and parcel to our shared security model.
Tailscale automatic secret scanning is available on any public GitHub repository and GitHub Enterprise Cloud with [GitHub Advanced Security](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security) adds further capabilities for processing data in private repositories.
Share
Author
Sam Linville
Author
Sam Linville
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