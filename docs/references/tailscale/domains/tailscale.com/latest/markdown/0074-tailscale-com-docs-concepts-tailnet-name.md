Tailnet names and types · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailnet names and types
Last validated: Jan 5, 2026
A Tailscale network (known as a tailnet) contains different types of names used to identify and connect everything within it. Each type of name serves a specific purpose, establishes the network's identity and namespace, device names identify individual nodes within it, MagicDNS names make those devices reachable, and access permissions and user identities define who or what can access specific resources.
There are three primary types of names:
* **Tailnet DNS name**: The fully qualified domain (FQDN) that is used for name resolution throughout your tailnet.
* **Machine name**: The name of a device or node in your tailnet.
* **Tailnet ID**: The string used with the [Tailscale API](/docs/reference/tailscale-api).
## [Tailnet DNS name](#tailnet-dns-name)
When you create a new tailnet, Tailscale assigns it a DNS name with the format `tail\<ID\>.ts.net`, where `\<ID\>` is a randomly generated hexadecimal string such as `tailnet-fe8c.ts.net`.
This serves several important purposes, including enabling [MagicDNS](/docs/features/magicdns) to register DNS names for tailnet devices and serving as the fully qualified domain name for [HTTPS](/docs/how-to/set-up-https-certificates) certificates. It's also used by the [sharing](/docs/features/sharing) feature to uniquely identify shared tailnet devices. You can find your tailnet DNS name in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
### [Generate a new tailnet DNS name](#generate-a-new-tailnet-dns-name)
You must be an [Owner, Admin, or Network admin](/docs/reference/user-roles) to generate and select a new tailnet DNS name.
If you want to use a tailnet DNS name that's more memorable than the generated hexadecimal string (`tail\<ID\>.ts.net`), you can generate and choose from a selection randomized name options. This can make it easier to remember or type your tailnet DNS name when using features like [MagicDNS](/docs/features/magicdns). For example, `cat-crocodile.ts.net`. These options are randomly generated, and you can always revert this name back to the originally assigned hexadecimal string name.
After you use a randomized name for HTTPS certificates, you cannot re-generate it. However, you will be able to switch between the randomized name and the default name.
To generate a new name:
1. Open the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
2. Select **Rename tailnet**.
3. Confirm that you want to used the randomized name.
4. Select one of the randomly generated tailnet names. If you don't want any of the proposed names, you can select **Re-roll options** to generate more options.
5. Select **Rename tailnet**.
When you select a random tailnet DNS name, it becomes your active tailnet name. If you previously used your default tailnet DNS name for [MagicDNS](/docs/features/magicdns), [HTTPS certificates](/docs/how-to/set-up-https-certificates), or [sharing](/docs/features/sharing), existing links to devices in your tailnet might break. This also applies when you revert back to the originally assigned tailnet DNS name.
### [Revert to the original tailnet DNS name](#revert-to-the-original-tailnet-dns-name)
To revert back to the default tailnet DNS name:
1. Open the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
2. Select **Rename tailnet**.
3. Confirm that you want to switch your tailnet name.
4. Select the name that you want to use.
5. Select **Rename tailnet**.
Because [MagicDNS](/docs/features/magicdns), [HTTPS certificates](/docs/how-to/set-up-https-certificates), and [sharing](/docs/features/sharing) rely on the tailnet DNS name, switching your tailnet DNS name may break existing links to devices in your tailnet.
## [Machine names](#machine-names)
Machine names are unique to each device in your tailnet. They're generated from the device's hostname (from the operating system) when the device joins the tailnet, and you can change a devices machine name from the admin console or the Tailscale CLI. The list of machines in your tailnet is located in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
## [Tailnet ID](#tailnet-id)
The Tailnet ID is a string assigned to a tailnet and used by the [Tailscale API](/docs/reference/tailscale-api). It's located in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
## [Display name](#display-name)
When you create a tailnet, it displays the private domain or public email address in the Tailscale authentication page, admin console page header, client UI, and the client CLI. For example, `example.com`, `example@gmail.com`, or `user.github`. Setting a custom display name gives your tailnet a recognizable name, making it easier for team members to identify which environment they are authenticating to, joining, or are currently using.
The display name can always be set and viewed of the admin console, and viewing it in the Tailscale client requires version 1.88 or later.
You must be an [Owner or Admin](/docs/reference/user-roles) to set or edit the tailnet display name.
1. Open the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
2. Enter the display name. Use letters, numbers, spaces, apostrophes, and hyphens.
3. Select **Save**.
The display name will appear anywhere your tailnet domain or email address typically displays. Display names can be up to 65 characters and can contain letters, numbers, spaces, apostrophes, and hyphens. You may not use periods or underscores.
## [Legacy ID](#legacy-id)
In October 2025, this field was changed from **Organization** to **Legacy ID** and is only visible to existing tailnets prior to this field name change. Tailnets created after October 2025 will not display the **Legacy ID** field of the admin console.
If you previously used the **Organization** field for the [Tailscale API](/docs/reference/tailscale-api), update your settings to use the **Tailnet ID** field instead.
The **Legacy ID** field is automatically assigned when creating a new tailnet and displays in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console. If you used a custom domain, it displays as the domain name such as `example.com`. If it's an email using a public/shared domain, the email address displays such as `user@gmail.com`. This name displays in the admin console header, the tailnet login page, and in the Tailscale client and provides an indicator of the tailnet you are using. Once created, you cannot change this name.
On this page
* [Tailnet DNS name](#tailnet-dns-name)
* [Generate a new tailnet DNS name](#generate-a-new-tailnet-dns-name)
* [Revert to the original tailnet DNS name](#revert-to-the-original-tailnet-dns-name)
* [Machine names](#machine-names)
* [Tailnet ID](#tailnet-id)
* [Display name](#display-name)
* [Legacy ID](#legacy-id)
Scroll to top