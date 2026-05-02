Linux systray application · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Linux systray application
Last validated: Jan 5, 2026
This feature is currently [in beta](/docs/reference/tailscale-release-stages#beta). To try it, follow the steps below to enable it for your network using Tailscale v1.88 or later.
You can run the system tray (`systray`) application for Linux desktop clients to access some common actions like [fast user switching](/docs/features/client/fast-user-switching) and [exit node selection](/docs/features/exit-nodes/how-to/setup) like with other Tailscale GUI clients.
The `systray` application works on Linux distributions that include D-Bus, and desktop environments that supports the [StatusNotifierItem specification](https://www.freedesktop.org/wiki/Specifications/StatusNotifierItem/). This includes recent versions of GNOME, KDE Plasma, and COSMIC, as well as Wayland bars such as [waybar](https://github.com/Alexays/Waybar/wiki/Module:-Tray) and [hyprpanel](https://hyprpanel.com/configuration/panel.html#system-tray).
## [Start the `systray` application](#start-the-systray-application)
Start the `systray` app from the command line by running:
```
`tailscale systray
`
```
To launch the `systray` application on startup, you can use a freedesktop autostart file, or a systemd user service.
Tailscale version 1.96 and later supports launching the `systray` application on startup with a freedesktop autostart file by running:
```
`tailscale configure systray --enable-startup=freedesktop
`
```
You can launch the `systray` application on startup as a systemd user service on startup by running:
```
`tailscale configure systray --enable-startup=systemd
`
```
For other init systems, call `tailscale systray` in the appropriate startup scripts.
Do not run `tailscale systray` as superuser (`sudo tailscale systray`), because systray is not designed to run as superuser and the command will fail.
## [Configure GNOME desktops](#configure-gnome-desktops)
The GNOME environment does not have a built-in system tray implementation, so you'll need to install the [AppIndicator Support extension](https://extensions.gnome.org/extension/615/appindicator-support/) to use the Tailscale `systray` application.
On Ubuntu, this extension comes installed as the `apt` package `gnome-shell-extension-appindicator`. You do not need to install the extension manually, however if you do, you might need to remove the `apt` package first.
## [Add clipboard support](#add-clipboard-support)
To integrate with the system clipboard, your environment may need a clipboard utility. Here are the following options and suggested commands to download and install:
### [`xsel` for X11](#xsel-for-x11)
Here are the methods for installing the `xsel` copy and paste utility for X11 in your Linux desktop environment:
* Debian/Ubuntu: `sudo apt install xsel`
* Fedora: `sudo dnf install xsel`
* Arch: `sudo pacman -S xsel`
### [`xclip` for X11](#xclip-for-x11)
Here are the methods for installing the `xclip` copy and paste utility for X11 in your Linux desktop environment:
* Debian/Ubuntu: `sudo apt install xclip`
* Fedora: sudo `dnf install xclip`
* Arch: `sudo pacman -S xclip`
### [wl-clipboard for Wayland](#wl-clipboard-for-wayland)
Here are the methods for installing the `wl-clipboard` copy and paste utility for Wayland in your Linux desktop environment:
* Debian/Ubuntu: `sudo apt install wl-clipboard`
* Fedora: `sudo dnf install wl-clipboard`
* Arch: `sudo pacman -S wl-clipboard`
## [Support for non-Linux desktops](#support-for-non-linux-desktops)
The `systray` application is currently only supported on Linux, and is therefore only bundled in the Linux client. It does run on other operating systems, including macOS and Windows, but some features, like desktop notifications, may be missing. If you are using an unsupported operating system, you can build the application from source and run it using the following:
```
`go run tailscale.com/cmd/systray@latest
`
```
## [Known limitations](#known-limitations)
* The GNOME desktop restricts the depth of sub-menus in `systray` applications. As a result, selecting a [Mullvad exit node](/docs/features/exit-nodes/mullvad-exit-nodes) is limited to the country level and does not extend to individual cities.
* The COSMIC desktop runs the `systray` application, but displays profile images at full size, which may appear oversized in the menu.
* The XFCE desktop is not currently supported. While `xfce-panel` implements the `StatusNotifierItem` specification, additional work is needed to enable compatibility.
On this page
* [Start the systray application](#start-the-systray-application)
* [Configure GNOME desktops](#configure-gnome-desktops)
* [Add clipboard support](#add-clipboard-support)
* [xsel for X11](#xsel-for-x11)
* [xclip for X11](#xclip-for-x11)
* [wl-clipboard for Wayland](#wl-clipboard-for-wayland)
* [Support for non-Linux desktops](#support-for-non-linux-desktops)
* [Known limitations](#known-limitations)
Scroll to top