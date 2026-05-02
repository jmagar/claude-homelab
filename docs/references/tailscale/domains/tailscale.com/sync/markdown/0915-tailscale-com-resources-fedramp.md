Using Tailscale in FedRAMP Moderate Environments
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
Using Tailscale in FedRAMP Moderate environments
Tailscale is a modern VPN built on WireGuard, designed to simplify secure access and private networking. While Tailscale is not yet FedRAMP authorized, many FedRAMP-certified cloud service providers (CSPs) could use Tailscale today within properly scoped boundaries. This document provides guidance for organizations to evaluate Tailscale's fit within your FedRAMP Moderate environment.
## We're here to help
We can collaborate with your Security and Compliance teams, help define Tailscale's role in your boundary documentation, or review architecture designs on request.
[
Contact us
](mailto:security@tailscale.com)
****
### [**Tailscale's security posture**](#tailscales-security-posture)
Tailscale is **SOC 2 Type II** certified. **WireGuard** is used for transport-layer security and end-to-end encrypted mesh networking. Tailscale enables **Zero Trust** by default through least-privilege access and device-based authentication.
Tailscale is designed with security as a foundational principle, with strong cryptographic protections, hardened defaults, and detailed auditing available.
### [**FedRAMP considerations**](#fedramp-considerations)
Tailscale can be used in FedRAMP-authorized environments **even without its own FedRAMP Authority to Operate (ATO)** if integrated appropriately. This involves properly defining where Tailscale will sit within your system boundary, categorizing whether Tailscale would be a system or service, and layering cryptography:
* **Boundary Definition**: Use NIST SP 800-18 and FIPS 199 to define if Tailscale is inside or outside your system boundary
* **System Categorization**: Determine whether Tailscale is a major system or a supporting service
* **Layered Cryptography**: If you already use FIPS-validated TLS or IPsec, Tailscale can operate as an additional encrypted layer
Tailscale provides technical documentation to assist CSPs in mapping these boundaries for compliance.
### [**FIPS 140-2/3 compliance context**](#fips-140-23-compliance-context)
Tailscale does not currently use a FIPS-validated cryptographic module. However, this is **not always required**, such as in the following scenarios:
* If Tailscale traffic is wrapped in FIPS-validated encryption (e.g., TLS termination, IPSec), it may be considered compliant
* FedRAMP guidance allows for **unvalidated modules** in layered encryption scenarios when inner layers meet SC-8(1)/SC-28(1)
For more on FedRAMP, refer to [this official source](https://www.fedramp.gov/rev5/fips/).