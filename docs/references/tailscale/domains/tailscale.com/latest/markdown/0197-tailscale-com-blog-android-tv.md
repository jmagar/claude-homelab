Android TV remote control
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 25, 2022
# Android TV remote control
*In this guest post, Elias Naur walks us through running Tailscale on Android TV.*
Running Tailscale on an Android TV device is useful for the situations where
you’re trying to connect to a big screen, but can’t use a desktop or mobile device. For example, you might want to access your
home media server to watch your favorite TV shows when you’re on the go in a hotel room or Airbnb, and only
have an Android TV stick to connect to the provided TV.
The [Tailscale Android app](https://play.google.com/store/apps/details?id=com.tailscale.ipn&amp;hl=en_US&amp;gl=US) now includes support for Android TV, and
is available in the [Google Play Store](https://play.google.com/store/apps/collection/promotion_3000e26_androidtv_apps_all?clp=CiwKKgokcHJvbW90aW9uXzMwMDBlMjZfYW5kcm9pZHR2X2FwcHNfYWxsEEoYAw==:S:ANO1ljKfbnM&amp;gsr=Ci4KLAoqCiRwcm9tb3Rpb25fMzAwMGUyNl9hbmRyb2lkdHZfYXBwc19hbGwQShgD:S:ANO1ljIUgNQ&amp;hl=en_US&amp;gl=US) for compatible TV devices.
Read on for technical details on how we made this possible.
## What took so long?
For most Android apps, supporting Android TV is relatively straightforward:
supply a set of metadata and media for the Play Store and test the app on a
device (or emulator). However, the user interface of the Tailscale app is
built with [Gio](https://gioui.org), that until recently didn’t have the
necessary support for TV remote control.
Allowing Gio programs to be navigated with the 4 directional buttons and
one activation button of a remote required several additional features:
* First, support for selecting interactive controls had to be expanded. Before, only the search text field could be selected, now buttons, the menu, and hosts can be selected.
* Then, focus had to be controllable by something other than a tap of a
finger, in particular clicking one of the directional buttons.
* To move the focus, you need to know what other widget is most appropriate for
the direction. So every widget on the screen had to be logically partitioned
into a grid, even if their positions may not even resemble a regular grid
at all.
That was it, except for [one more thing](https://github.com/tailscale/tailscale/issues/4278):
if you reach the end of, say, the list of hosts in your Tailscale network it should
scroll as you keep pressing the directional button. So that also means,
* Focus should be able to move to off-screen elements near the visible area
of lists.
* If a focused widget is partly or entirely outside the screen, scroll it into view.
* If there are no focusable widgets available, scroll the list a bit to reveal
additional widgets.
## Why not use the native UI?
The downside of a from-scratch GUI toolkit is that the usual features
from the native interface toolkit have to be implemented, well, from
scratch. Fortunately, the Gio community has recently completed support for
accessibility, complex text scripts and fonts, right-to-left text layout -
all funded by companies such as Tailscale.
Of course, there are several upsides to avoiding the native UI toolkit:
* Tailscale itself is written in Go, and it is much easier to write a user
interface if the toolkit is in the same language.
* Gio is portable across the major mobile and desktop platforms.
* The [immediate mode](https://www.youtube.com/watch?v=Z1qyvQsjK5Y) design
simplifies UI logic.
* Simpler tools, similar to the standard Go tools.
For example, with a recent Go installed on Windows this one command,
```
`$ go run gioui.org/example/kitchen@latest
`
```
will bring up a fully functioning GUI window. You can use the same
command on the other platforms, with a few additional [developer tools](https://gioui.org/doc/install) installed.
To try out the Tailscale app on your Android TV, download it from the [Play Store](https://play.google.com/store/apps/details?id=com.tailscale.ipn&amp;hl=en_US&amp;gl=US).
Share
Author
Elias Naur
Author
Elias Naur
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