Testing Jellyfin Server | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
Backups!
Unstable often makes irreversible changes to existing Jellyfin setups. Please make regular backups of Jellyfin files. [Learn how to create backups.](/docs/general/administration/configuration#server-paths)
## Weekly Unstable Build[​](#weekly-unstable-build)
The weekly unstable builds are generated every Monday 5:00 AM UTC. Testing using the Unstable builds can not only test Jellyfin itself, but also help identify issues with packaging.
To install them, navigate to our [downloads page](/downloads/server) and choose `Server`, choose your platform, then choose `Unstable`. The choices have to be made in this order. After choosing, scroll down and find the installation method you would like to use.
Follow the steps in the [Upgrade & Downgrade documentation](/docs/general/testing/upgrades) for more detailed instructions.
## Testing from Master Branch[​](#testing-from-master-branch)
The Master branch of the server can be used to obtain the absolute bleeding edge. This is only intended for developers. Further info can be found [in the packaging repository itself](https://github.com/jellyfin/jellyfin-packaging) and [in the contributing docs](/docs/general/contributing/development).
* [Weekly Unstable Build](#weekly-unstable-build)
* [Testing from Master Branch](#testing-from-master-branch)