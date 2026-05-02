Scanning for exposed Tailscale secrets · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Scanning for exposed Tailscale secrets
Last validated: Jan 5, 2026
Tailscale provides a variety of [keys](/docs/reference/key-prefixes) that are used for automation and integration. Treat these keys as secrets and handle them securely. If they are leaked, someone could take harmful action on your Tailscale network (known as a tailnet). To help mitigate accidental disclosure and prevent fraudulent use, Tailscale partners with the following companies to provide secret scanning of source code repositories and other data sources to find leaked Tailscale keys:
* [GitGuardian](https://www.gitguardian.com)
* [GitHub](https://github.com)
* [GitLab](https://about.gitlab.com)
* [TruffleHog](https://trufflesecurity.com/trufflehog)
This topic describes the scanning performed by these companies, and the actions taken when they believe they have discovered an exposed Tailscale secret.
The types of Tailscale keys that are in scope for secret scanning are:
* [API access tokens](/docs/reference/tailscale-api#authentication) (also known as "API keys")
* [OAuth clients](/docs/features/oauth-clients)
* [Pre-authentication keys](/docs/features/access-control/auth-keys) (also known as "auth keys")
* [System for Cross-domain Identity Management (SCIM) keys](/learn/what-is-scim)
* [Webhook keys](/docs/features/webhooks#webhook-secret)
If you are notified or otherwise believe that one of your Tailscale keys has been compromised, refer to [Key and secret management](/docs/reference/key-secret-management) for recommended actions.
Secret scanning is available for [all plans](/pricing).
## [GitGuardian](#gitguardian)
[GitGuardian](https://www.gitguardian.com) scans across your platforms to look for leaked secrets. If it detects a possible Tailscale secret, GitGuardian makes an API call to a Tailscale endpoint to determine whether the secret is an actual active secret. If the secret is active, GitGuardian contacts the user whose data source contains the secret.
The GitGuardian API call to the Tailscale endpoint does not modify your tailnet, it merely checks if a secret is an active Tailscale key.
GitGuardian does not notify Tailscale about any potentially exposed Tailscale secrets that GitGuardian detects.
## [GitHub](#github)
[GitHub](https://github.com) automatically scans all public repositories (including issues, pull requests, comments, and wikis) and all public NPM packages. If GitHub finds a Tailscale secret in those sources, GitHub makes an API call to a Tailscale endpoint to determine whether the secret is an active secret. If it is an active secret, Tailscale will revoke the secret and send an email to the [security issues contact](/docs/reference/contact-preferences#setting-the-security-issues-email) for the tailnet to which the leaked secret belongs.
If you have configured GitHub to scan your private repositories and issues and GitHub finds a Tailscale secret in those sources, GitHub makes an API call to a Tailscale endpoint to determine whether the secret is an active secret. If it is an active secret, Tailscale will revoke secret and send an email to the security issues contact for the tailnet to which the leaked secret belongs. Additionally, GitHub will report the leaked secret as an alert on the **Security** tab of the GitHub repository. GitHub's scanning of a private repository's issues includes scanning the titles, descriptions, and comments in open and historical issues.
For more information about GitHub secret scanning, refer to the GitHub [About secret scanning](https://docs.github.com/en/code-security/secret-scanning/about-secret-scanning) topic.
## [GitLab](#gitlab)
[GitLab](https://about.gitlab.com) provides GitLab Secret Detection, which [when enabled](https://docs.gitlab.com/ee/user/application_security/secret_detection/#enable-secret-detection) scans all text files in your GitLab repository to find leaked secrets. GitLab uses a regular expression (also known as a regex) provided by Tailscale as the scan criteria for leaked secrets. If a secret that is believed to be a Tailscale secret is discovered, GitLab will report the leaked secret in a [GitLab artifact report](https://docs.gitlab.com/ee/ci/yaml/artifacts_reports.html) for the GitLab repository. GitLab does not notify Tailscale about any potentially exposed Tailscale secrets in GitLab repositories. For more information about GitLab secret scanning, refer to the GitLab [Secret Detection](https://docs.gitlab.com/ee/user/application_security/secret_detection) topic.
## [TruffleHog](#trufflehog)
[TruffleHog](https://trufflesecurity.com/trufflehog) scans across your platforms to look for leaked secrets. If it detects a possible Tailscale secret, TruffleHog makes an API call to a Tailscale endpoint to determine whether the secret is an actual active secret. If the secret is active, TruffleHog contacts the user whose data source contains the secret.
The TruffleHog API call to the Tailscale endpoint does not modify your tailnet, it merely checks if a secret is an active Tailscale key.
When Tailscale receives notice of an exposed secret from TruffleHog, Tailscale does **not** automatically revoke the secret.
On this page
* [GitGuardian](#gitguardian)
* [GitHub](#github)
* [GitLab](#gitlab)
* [TruffleHog](#trufflehog)
Scroll to top