Action required: Upgrade Tailscale to 1.14.4+ prior to updating Windows
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 29, 2021
# Action required: Upgrade Tailscale to 1.14.4+ prior to updating Windows
Due to recent changes in Windows Update, upgrading the operating system on a Windows 10 or Windows 11 machine running Tailscale may break Tailscale connectivity. If this happens, your machine will no longer be able to connect to your tailnet. **To avoid this issue, [upgrade Tailscale on your Windows machines](/kb/1067/update/) to Tailscale 1.14.4 or later before running Windows Update**.
### What happened?
Previously, the Tailscale service stored its state in the SYSTEM user’s `%LocalAppData%` directory, usually `C:\\WINDOWS\\system32\\config\\systemprofile\\AppData\\Local`. This state includes:
* Incoming Taildrop files (`%LocalAppData%\\Tailscale\\Files`)
* Logs (`%LocalAppData%\\Tailscale\\Logs`)
* server-state.conf (`%LocalAppData%\\Tailscale\\server-state.conf`), which is a JSON file containing:
* the machine key
* whether Tailscale should run in [unattended mode](/kb/1088/run-unattended/) on this machine
However, this app data directory is wiped as part of some Windows updates, **including Windows 10 major updates, and when upgrading to Windows 11**.
If this directory is wiped, essential Tailscale files are removed from your system, including Tailscale machine keys. This means that your machine will no longer be recognized as an authorized member of your tailnet. Your machine will need to re-register to join your network, including re-authenticate with a user login. This also applies to machines running with key expiration disabled, such as servers.
The directory could be wiped by operating system updates, system restores and system cleaner utilities on newer versions of Windows.
As of Tailscale 1.14.4, Tailscale no longer relies on storing state in that location, and instead stores state in `%ProgramData%`.
### Who is affected?
Only users with Windows 10 or Windows 11 machines running Tailscale 1.14.3 or earlier are affected. Admins of a tailnet can [view affected machines in the admin console](<https://login.tailscale.com/admin/machines?q=os:windows version:<1.14.4>).
### What do I need to do?
If you haven’t yet updated Windows, and are running Tailscale 1.14.3 or earlier, please [upgrade to 1.14.4 or later](/kb/1067/update/) now.
If you have already upgraded Windows, and your machine’s connectivity to Tailscale is broken, you need to reset Tailscale on the machine, and re-authenticate. [See instructions](/kb/1023/troubleshooting/#updated-windows-machine-stops-connecting-to-tailscale) for several options to resolve this.
If you have any issues, please contact [support@tailscale.com](<mailto:support@tailscale.com?subject=Windows update>).
Share
Author
David Crawshaw
Author
David Crawshaw
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