Troubleshoot Windows RDP user account restriction · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot Windows RDP user account restriction
Last validated: Feb 18, 2026
Users in a Windows domain environment might encounter the following error when attempting to connect to another machine using Remote Desktop Protocol (RDP):
```
`A user account restriction (for example, a time-of-day restriction)
is preventing you from logging on. For assistance, contact your system
administrator or technical support.
`
```
This can occur in an environment where the following is true:
* [MagicDNS](/docs/features/magicdns) is enabled in the tailnet.
* The remote machine is accessed by its unqualified name or MagicDNS domain name instead of the FQDN in the Active Directory domain.
* An example of an unqualified name is `win11e`.
* An example of a MagicDNS name is `win11e.example.ts.net`.
* An example of a FQDN in Active Directory is `win11e.example.com`.
* Kerberos authentication is required due to [NTLM](https://en.wikipedia.org/wiki/NTLM) authentication [restrictions](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/jj865668(v=ws.10)) in the domain.
* A [service principal name](https://learn.microsoft.com/en-us/windows/win32/ad/service-principal-names) (SPN) is not configured for the remote machine.
We recommend using the [`setspn`](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/cc731241(v=ws.10)) command to register an SPN. To do this, run the following command as a domain administrator:
```
`setspn -S TERMSRV/win11e.example.ts.net WIN11E
`
```
In the example above, `win11e.example.ts.net` is the hostname in the tailnet, and `WIN11E` is the account name in Active Directory.
Scroll to top