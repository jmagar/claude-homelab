TruffleHog: Automatically maintain security for your Tailscale secrets
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 15, 2023
# Maintain security for your Tailscale secrets automatically with TruffleHog
At Tailscale, we aim to provide users with a programmable network that is both secure enough to earn their trust and flexible enough to meet their networking needs across a wide range of infrastructure set-ups. We focus on making the locks trustworthy so our customers can focus on keeping track of their keys.
Today we’re announcing an integration between Tailscale and [Truffle Security](https://trufflesecurity.com/), the team behind the popular open-source secret scanning tool TruffleHog. TruffleHog scans data sources for any Tailscale secrets, verifies if the secret is still active, and then notifies you so you can revoke the secret.
TruffleHog can now monitor for any of five Tailscale secrets: API keys, Pre-authentication keys, OAuth client secrets, SCIM keys, and webhook keys. Keeping these keys safe is part and parcel to our shared security model.
Tailscale automatic secret scanning is available for both open source and Enterprise versions of TruffleHog. To use it, install and run TruffleHog following [the documentation in Truffle’s GitHub repo](https://github.com/trufflesecurity/trufflehog). And if you’d like to read more about how Truffle and Tailscale worked together on this integration, they’ve done a [great job of outlining it in their blog post](https://trufflesecurity.com/blog/tailscale-truffle-a-blueprint-for-open-source-trufflehog-contributions/).
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