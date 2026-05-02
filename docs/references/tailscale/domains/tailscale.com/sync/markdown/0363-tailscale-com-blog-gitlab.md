Maintain security for your Tailscale secrets with GitLab
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMarch 07, 2024
# Maintain security for your Tailscale secrets with GitLab
Tailscale provides a programmable network to our customers that is both secure enough to earn their trust and flexible enough to meet their networking needs across a wide range of infrastructure set-ups. We focus on making the locks trustworthy so our customers can focus on keeping track of their keys. Today we’re making another step forward on this journey by announcing an integration between Tailscale and GitLab, the popular DevSecOps platform.
GitLab’s [Secret Detection](https://docs.gitlab.com/ee/user/application_security/secret_detection/) can now scan your source code for any Tailscale secrets, and notifies you when you find matches so you can revoke the secret and prevent unauthorized access to your Tailscale resources.
GitLab can now monitor for any of five Tailscale secrets: API keys, Pre-authentication keys, OAuth client secrets, SCIM keys, and webhook keys. Keeping these keys safe is part and parcel to our shared security model.
Tailscale automatic secret scanning is available on any GitLab tier, and GitLab Ultimate adds further capabilities for processing secret detection results. When GitLab’s secrets detection engine detects a hardcoded Tailscale secret, you’ll be notified of the incident in a [Secret Detection JSON report artifact](https://docs.gitlab.com/ee/ci/yaml/artifacts_reports.html#artifactsreportssecret_detection).
Read more in our docs about [secret scanning with Tailscale](https://tailscale.com/kb/1301/secret-scanning).
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