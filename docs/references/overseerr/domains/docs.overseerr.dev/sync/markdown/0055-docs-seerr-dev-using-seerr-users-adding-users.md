Adding Users | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
There are currently two methods to add users to Seerr: importing Mediaserver users and creating "local users." All new users are created with the [default permissions](/using-seerr/settings/users#default-permissions) defined in **Settings → Users**.
### Importing Mediaserver Users[​](#importing-mediaserver-users)
* Jellyfin
* Emby
* Plex
Clicking the **Import Jellyfin Users** button on the **User List** page will fetch the list of users with access to the Jellyfin server and add them to Seerr automatically.
Importing Jellyfin users is not required, however. Any user with access to the Jellyfin server can log in to Seerr even if they have not been imported, and will be assigned the configured [default permissions](/using-seerr/settings/users#default-permissions) upon their first login.
tip
To disable new Jellyfin sign-ins, navigate to **Settings → Users** and uncheck the [**Enable New Jellyfin Sign-In**](/using-seerr/settings/users#enable-new-jellyfinembyplex-sign-in) box.
### Creating Local Users[​](#creating-local-users)
If you would like to grant Seerr access to a user who doesn't have their own Plex account and/or access to the Plex server, you can manually add them by clicking the **Create Local User** button.
#### Email Address[​](#email-address)
Enter a valid email address at which the user can receive messages pertaining to their account and other notifications. The email address currently cannot be modified after the account is created.
#### Automatically Generate Password[​](#automatically-generate-password)
If an [application URL](/using-seerr/settings/general#application-url) is set and [email notifications](/using-seerr/notifications/email) have been configured and enabled, Seerr can automatically generate a password for the new user.
#### Password[​](#password)
If you would prefer to manually configure a password, enter a password here that is a minimum of 8 characters.
* [Importing Mediaserver Users](#importing-mediaserver-users)
* [Creating Local Users](#creating-local-users)