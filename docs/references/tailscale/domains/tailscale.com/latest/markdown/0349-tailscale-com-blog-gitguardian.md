Protect Tailscale Secrets with GitGuardian’s Secret Detection Tool
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 05, 2024
# Maintain security for your Tailscale secrets with GitGuardian
Tailscale provides a programmable network to our customers that is both secure enough to earn their trust and flexible enough to meet their networking needs across a wide range of infrastructure set-ups. We focus on making the locks trustworthy so our customers can focus on keeping track of their keys. Today, we’re making another step forward on this journey by announcing an integration between Tailscale and GitGuardian, the popular code security platform.
GitGuardian’s Tailscale secret detector scans your source code for any Tailscale secrets, verifies if the secret is still active, and then notifies you so you can revoke the secret.
GitGuardian can now monitor for any of five Tailscale secrets: [API keys](https://docs.gitguardian.com/secrets-detection/secrets-detection-engine/detectors/specifics/tailscale_api_key?_gl=1*1dkn8pl*_up*MQ..*_ga*Mjk0NTk0NjMyLjE3MDYwMjYyMTg.*_ga_L0Y8CSL3HQ*MTcwNjAyNjIxNS4xLjAuMTcwNjAyNjIxNS4wLjAuMA..), [Pre-authentication keys](https://docs.gitguardian.com/secrets-detection/secrets-detection-engine/detectors/specifics/tailscale_pre_auth_key?_gl=1*1dkn8pl*_up*MQ..*_ga*Mjk0NTk0NjMyLjE3MDYwMjYyMTg.*_ga_L0Y8CSL3HQ*MTcwNjAyNjIxNS4xLjAuMTcwNjAyNjIxNS4wLjAuMA..), [OAuth client secrets](https://docs.gitguardian.com/secrets-detection/secrets-detection-engine/detectors/specifics/tailscale_oauth_key?_gl=1*1dkn8pl*_up*MQ..*_ga*Mjk0NTk0NjMyLjE3MDYwMjYyMTg.*_ga_L0Y8CSL3HQ*MTcwNjAyNjIxNS4xLjAuMTcwNjAyNjIxNS4wLjAuMA..), [SCIM keys](https://docs.gitguardian.com/secrets-detection/secrets-detection-engine/detectors/specifics/tailscale_scim_key?_gl=1*1dkn8pl*_up*MQ..*_ga*Mjk0NTk0NjMyLjE3MDYwMjYyMTg.*_ga_L0Y8CSL3HQ*MTcwNjAyNjIxNS4xLjAuMTcwNjAyNjIxNS4wLjAuMA..), and [webhook keys](https://docs.gitguardian.com/secrets-detection/secrets-detection-engine/detectors/specifics/tailscale_webhook_key?_gl=1*1dkn8pl*_up*MQ..*_ga*Mjk0NTk0NjMyLjE3MDYwMjYyMTg.*_ga_L0Y8CSL3HQ*MTcwNjAyNjIxNS4xLjAuMTcwNjAyNjIxNS4wLjAuMA..). Keeping these keys safe is part and parcel of our shared security model.
Tailscale automatic secret scanning is available on all of GitGuardian’s plans. To use it, [integrate your GitHub, GitLab, or Bitbucket repositories with GitGuardian](https://docs.gitguardian.com/platform/getting-started/integrate). When GitGuardian’s secrets detection engine detects a hardcoded Tailscale secret, you’ll be notified of the incident in your GitGuardian dashboard.
Learn more about GitGuardian and the new Tailscale secrets detector in their [announcement post](https://blog.gitguardian.com/wrapping-up-2023-new-detectors-your-favorite-features-and-whats-coming-next-in-the-gitguardian-platform/).
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