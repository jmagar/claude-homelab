Nix Package Manager (Advanced) | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
warning
This method is not recommended for most users. It is intended for advanced users who are using NixOS distribution.
danger
The seerr service and package are available in the unstable channel only and will be officially included in the 26.05 release.
Refer to [NixOS documentation](https://search.nixos.org/options?channel=unstable&amp;query=seerr)
## Installation[​](#installation)
To get up and running with seerr using Nix, you can add the following to your `configuration.nix`:
```
`{ config, pkgs, ... }:
{
services.seerr.enable = true;
}
`
```
After adding the configuration to your `configuration.nix`, you can run the following command to install seerr:
```
`nixos-rebuild switch
`
```
After rebuild is complete seerr should be running, verify that it is with the following command.
```
`systemctl status seerr
`
```
info
You can now access Seerr by visiting `http://localhost:5055` in your web browser.
* [Installation](#installation)