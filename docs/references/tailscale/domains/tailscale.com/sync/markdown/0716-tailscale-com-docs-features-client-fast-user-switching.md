Fast user switching · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Fast user switching
Last validated: Dec 4, 2025
Fast user switching lets you quickly switch between two or more logged-in accounts on the same device, without
requiring you to re-authenticate.
Fast user switching is available for [all plans](/pricing).
## [How it works](#how-it-works)
A Tailscale client device lets only one active account log in at a time.
With fast user switching, a user on the client device can quickly switch to an account on
another [tailnet](/docs/concepts/tailnet).
This will not require re-authentication unless one of the following is true:
* The account being switched to has never been used on the device.
* The device's [node key](/blog/tailscale-key-management#node-keys) for the tailnet being switched to has expired.
A device is not able to transmit packets on multiple tailnets simultaneously.
When using fast user switching between tailnets, one tailnet doesn't have knowledge of the other tailnet's existence, nor
whether the client device is also in another tailnet.
Note that the active Tailscale client account is independent of which account is used to log into the
Tailscale [admin console](https://login.tailscale.com/admin). You can have only one active account logged into the Tailscale
client on a device, but if you have multiple browsers open, you can simultaneously use different accounts
to log in to the admin console.
### [Adding an account to a device](#adding-an-account-to-a-device)
You can add an account in either the client application (for macOS, iOS, and Windows) or using the
[Tailscale CLI](/docs/reference/tailscale-cli) (for Linux, macOS, and Windows).
#### [Adding an account using the client application](#adding-an-account-using-the-client-application)
[macOS](/docs/features/client/fast-user-switching?tab=macos)[iOS](/docs/features/client/fast-user-switching?tab=ios)[Windows](/docs/features/client/fast-user-switching?tab=windows)[Android](/docs/features/client/fast-user-switching?tab=android)
If you are running Tailscale v1.60.0 or later:
1. Select the Tailscale icon in the menu bar.
2. Select **Settings**.
3. Select **Accounts**.
4. Select **Add Account**.
5. In the browser window that opens, log in with the desired account to complete the authentication process.
If you are running a Tailscale version earlier than v1.60.0:
1. Select the Tailscale icon in the menu bar.
2. Select the account that is currently logged on.
3. Select **Add another account**.
4. In the browser window that opens, log in with the desired account to complete the authentication
process.
#### [Adding an account using the CLI](#adding-an-account-using-the-cli)
1. Run the [`tailscale login`](/docs/reference/tailscale-cli#login) command:
```
`tailscale login
`
```
2. Use the URL that is opened to specify the account that you want to use and complete the authentication process.
### [Switching between accounts](#switching-between-accounts)
You can switch between accounts in either the client application (for macOS, iOS, and Windows) or using
the [Tailscale CLI](/docs/reference/tailscale-cli) (for Linux, macOS, and Windows).
This step assumes you have already [added an additional account](#adding-an-account-to-a-device) to the client device.
#### [Switching between accounts using the client application](#switching-between-accounts-using-the-client-application)
[macOS](/docs/features/client/fast-user-switching?tab=macos)[iOS](/docs/features/client/fast-user-switching?tab=ios)[Windows](/docs/features/client/fast-user-switching?tab=windows)[Android](/docs/features/client/fast-user-switching?tab=android)
1. Select the Tailscale icon in the menu bar.
2. Select the account that is currently logged on.
3. Select the account that you want to switch to.
You won't be asked to re-authenticate unless the device's [node key](/blog/tailscale-key-management#node-keys)
for the tailnet being switched to has expired.
#### [Switching between accounts using the CLI](#switching-between-accounts-using-the-cli)
Use the [`tailscale switch`](/docs/reference/tailscale-cli#switch) command to switch between accounts.
```
`tailscale switch alice@example.com
`
```
You won't be asked to re-authenticate unless the device's [node key](/blog/tailscale-key-management#node-keys) for the tailnet being switched to has
expired.
If you previously [set a nickname](#setting-a-nickname) for an account, use the nickname when you switch between accounts.
```
`tailscale switch work
`
```
### [Viewing all accounts](#viewing-all-accounts)
You can access accounts that have authenticated with the device, using either the client application
or the [Tailscale CLI](/docs/reference/tailscale-cli).
#### [Viewing account using the client application](#viewing-account-using-the-client-application)
[macOS](/docs/features/client/fast-user-switching?tab=macos)[iOS](/docs/features/client/fast-user-switching?tab=ios)[Windows](/docs/features/client/fast-user-switching?tab=windows)[Android](/docs/features/client/fast-user-switching?tab=android)
1. Select the Tailscale icon in the menu bar.
2. Select the account that is currently logged on.
The list of accounts will be displayed, with a check mark indicating which account is currently logged in.
#### [Viewing accounts using the CLI](#viewing-accounts-using-the-cli)
Run the [`tailscale switch`](/docs/reference/tailscale-cli#switch) command with the `--list` flag:
```
`tailscale switch --list
`
```
The list of accounts will be displayed, with an asterisk indicating which account is currently logged in.
```
`alice@example.com
alice@gmail.com \*
`
```
If you [set a nickname](#setting-a-nickname) for an account, the `tailscale switch --list` command displays the
nickname:
```
`alice@example.com
work \*
`
```
### [Setting a nickname](#setting-a-nickname)
Use the [`tailscale set`](/docs/reference/tailscale-cli#set) command to set a nickname for the currently active account.
Before setting the nickname in this example, let's assume that `tailscale switch --list` shows the
active account is `alice@example.com`.
```
`tailscale switch --list
`
```
The output is:
```
`alice@example.com \*
alice@gmail.com
`
```
Set the nickname of the active account to `work`:
```
`tailscale set --nickname=work
`
```
Run `tailscale switch --list` again, and read the nickname `work` appear in the output (instead of `alice@example.com`):
```
`alice@gmail.com
work \*
`
```
### [Logging out of an account](#logging-out-of-an-account)
You can log out of an account using either the client application or the [Tailscale CLI](/docs/reference/tailscale-cli).
#### [Logging out using the client application](#logging-out-using-the-client-application)
[macOS](/docs/features/client/fast-user-switching?tab=macos)[iOS](/docs/features/client/fast-user-switching?tab=ios)[Windows](/docs/features/client/fast-user-switching?tab=windows)[Android](/docs/features/client/fast-user-switching?tab=android)
If you are running Tailscale v1.60.0 or later:
1. Select the Tailscale icon in the menu bar.
2. Select **Settings**.
3. Select **Accounts**.
4. Select **Log Out**.
If you are running a Tailscale version earlier than v1.60.0:
1. Select the Tailscale icon in the menu bar.
2. Select the account that is currently logged on.
3. Select **Log out**.
#### [Logging out using the CLI](#logging-out-using-the-cli)
Run the [`tailscale logout`](/docs/reference/tailscale-cli#logout) command to log out the currently active account:
```
`tailscale logout
`
```
### [Limitations](#limitations)
* You aren't prevented from switching between accounts in the same tailnet. If you don't want to switch
between accounts in the same tailnet, re-authenticate the device instead of switching between accounts.
On this page
* [How it works](#how-it-works)
* [Adding an account to a device](#adding-an-account-to-a-device)
* [Adding an account using the client application](#adding-an-account-using-the-client-application)
* [Adding an account using the CLI](#adding-an-account-using-the-cli)
* [Switching between accounts](#switching-between-accounts)
* [Switching between accounts using the client application](#switching-between-accounts-using-the-client-application)
* [Switching between accounts using the CLI](#switching-between-accounts-using-the-cli)
* [Viewing all accounts](#viewing-all-accounts)
* [Viewing account using the client application](#viewing-account-using-the-client-application)
* [Viewing accounts using the CLI](#viewing-accounts-using-the-cli)
* [Setting a nickname](#setting-a-nickname)
* [Logging out of an account](#logging-out-of-an-account)
* [Logging out using the client application](#logging-out-using-the-client-application)
* [Logging out using the CLI](#logging-out-using-the-cli)
* [Limitations](#limitations)
Scroll to top