Setup Wizard Walkthrough | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
This page will guide you through each step of the setup wizard.
## Select Language[​](#select-language)
Select your preferred language for the rest of the setup. This setting only affects the client you are using. Server-wide language settings will be configured later.
## Setup Administrator Account[​](#setup-administrator-account)
Set up an administrator account for managing the server. Choose a strong password for better security. You are able to create more user and administrator accounts once you finish the setup wizard.
## Add Media Libraries[​](#add-media-libraries)
Add media libraries at this page. Click on the + to add a library. Alternatively, click on "Next" without adding anything to skip this step and add media later.
In the popup, chose a type on the "Content Type" dropdown, and set a display name in the "Display Name" field. Then, add some folders using the + button. If you don't see your media folders listed, you might have permission issues. You can get help on our [forum](https://forum.jellyfin.org/) or [chat rooms](/contact). Read more about media libraries at the [media libraries' documentation](/docs/general/server/libraries/).
## Set a Preferred Metadata Language[​](#set-a-preferred-metadata-language)
Select a preferred language and region for metadata fetching as the server-wide default. Metadata from other language / regions may be fetched if metadata is not available with your preferred settings. This can be further customized on a per-library basis.
## Networking Settings[​](#networking-settings)
Some basic options for networking can be set on this page. For most users, it is recommended to **enable** the "Allow remote access to this server" option, and **disable** the "Enable automatic port mapping" option.
## Next Steps[​](#next-steps)
You have finished the setup wizard. Below is a list of items you should configure in order to get the best experience:
* [Setup remote access to use Jellyfin when you are not at home](/docs/general/post-install/networking/#external-access)
* [Setup hardware acceleration to improve performance and/or save power](/docs/general/post-install/transcoding/hardware-acceleration/)
* [Select Language](#select-language)
* [Setup Administrator Account](#setup-administrator-account)
* [Add Media Libraries](#add-media-libraries)
* [Set a Preferred Metadata Language](#set-a-preferred-metadata-language)
* [Networking Settings](#networking-settings)
* [Next Steps](#next-steps)