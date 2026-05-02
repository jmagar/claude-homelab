Tailscale FedRAMP and FIPS-140 considerations · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale FedRAMP and FIPS-140 considerations
Last validated: Jan 5, 2026
Tailscale is a modern virtual private network (VPN) built on [WireGuard®](https://www.wireguard.com). While Tailscale is not yet [FedRAMP](https://www.fedramp.gov/) authorized, many FedRAMP-certified Cloud Service Providers (CSPs) can use Tailscale today within properly scoped boundaries. The following information provides guidance when you evaluate Tailscale's fit within your FedRAMP Moderate environment.
## [Tailscale security posture](#tailscale-security-posture)
Tailscale is SOC 2 Type II certified. You can download the SOC 2 report from the Tailscale [Legal and Trust](/legal) page. Tailscale uses WireGuard for Transport Layer security (TLS) and provides end-to-end encrypted mesh networking.
Tailscale's approach to secure networking embodies the principles of [least privilege](/learn/principle-of-least-privilege) and [zero trust security](/docs/concepts/zero-trust). Tailscale provides strong cryptographic protection, hardened defaults, and detailed auditing.
## [FedRAMP Considerations](#fedramp-considerations)
Tailscale is useful in FedRAMP-authorized environments even without its own FedRAMP Authority to Operate (ATO) certification if integrated appropriately. Take the following into account:
* **Boundary definition**: Use National Institute of Standards and Technology (NIST) [SP 800-18](https://csrc.nist.gov/pubs/sp/800/18/r1/final) and Federal Information Processing Standards (FIPS) [199](https://csrc.nist.gov/pubs/fips/199/final) to define if Tailscale is inside or outside your system boundary.
* **System categorization**: Determine whether Tailscale is a major system or supporting service.
* **Layered cryptography**: If you already use FIPS-validated TLS or Internet Protocol Security (IPsec), Tailscale can operate as an additional encrypted layer.
Tailscale provides technical documentation to assist CSPs in mapping these boundaries for compliance.
## [FIPS 140-2/3 compliance context](#fips-140-23-compliance-context)
[FIPS 140-3](https://csrc.nist.gov/pubs/fips/140-3/final) and its predecessor FIPS 140-2 define security requirements for cryptographic modules. Tailscale does not currently use a FIPS-validated cryptographic module. However, this is not always required:
* If Tailscale traffic is wrapped in FIPS-validated encryption (such as TLS termination or IPsec), it may be considered compliant.
* FedRAMP guidance provides for un-validated modules in layered encryption scenarios when inner layers meet [SC-8(1)/SC-28(1)](https://www.fedramp.gov/resources/documents/FedRAMP_Policy_for_Cryptographic_Module_Selection_v1.1.0.pdf).
Tailscale is not providing legal advice. We suggest you consult with your own experts regarding whether your use of Tailscale is considered compliant.
On this page
* [Tailscale security posture](#tailscale-security-posture)
* [FedRAMP Considerations](#fedramp-considerations)
* [FIPS 140-2/3 compliance context](#fips-140-23-compliance-context)
Scroll to top