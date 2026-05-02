Using Tailscale for Android just got a whole lot better
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMay 15, 2024
# Reimagining Tailscale for Android
Today we're excited to announce a major overhaul that significantly enhances the Android app and brings some of Tailscale's most widely used and requested features to the Android platform.
Since its [debut](https://tailscale.com/blog/tailscale-for-android) in August 2020, the Tailscale Android app has been a reliable tool for secure remote networking, with users registering over 240,000 Android devices to their tailnets. However, the app had started to feel somewhat dated — especially after our [redesigned iOS app](https://tailscale.com/blog/reimagining-tailscale-for-ios) launch. Today’s launch ensures that, both visually and under the hood, Android users are getting the best Tailscale experience ever.
### [A familiar feeling](#a-familiar-feeling)
Our updated version of the app begins with a visual update. The Android app now closely follows the Tailscale design system, mirroring the spacing, color, and typography of our admin console, web client, and iOS apps. To ensure each app feels native to its operating system, we've adapted our components to match Android-specific design patterns, which helps us deliver an intuitive experience to users familiar with the Android ecosystem and optimize performance.
### [Mobile Device Management](#mobile-device-management)
Our Android app now supports the needs of enterprise customers relying on mobile device management ([MDM](https://tailscale.com/kb/1362/mdm)) solutions. These solutions let you easily deploy applications and system configurations to a large fleet of managed devices.
The Tailscale client can be both deployed and configured using these MDM solutions. Network administrators deploying Tailscale on fleets of Android devices can now use our [system policies](https://tailscale.com/kb/1384/android-mdm) to configure Tailscale according to their organization's requirements automatically. Tailscale's Android app supports MDM solutions like [Google Workspace](https://tailscale.com/kb/1386/mdm-google-workspace), [Microsoft Intune](https://tailscale.com/kb/1327/mdm-microsoft-intune), [TinyMDM](https://tailscale.com/kb/1385/mdm-tinymdm), and more.
### [Improvements to exit nodes](#improvements-to-exit-nodes)
The app remembers your last used exit node and prominently displays it at the top of the user interface. Picking an exit node is now much easier, especially if you use our [Mullvad VPN integration](https://tailscale.com/blog/mullvad-integration). As part of this update, we addressed a [known issue](https://github.com/tailscale/tailscale/issues/7510) with LAN access during exit node use.
Your browser does not support the video tag.
### [Fast user switching](#fast-user-switching)
Switch seamlessly between multiple accounts on the same device with Tailscale’s [fast user switching](https://tailscale.com/kb/1225/fast-user-switching), easily log in using a custom coordination server, and sign in using [auth keys](https://tailscale.com/kb/1085/auth-keys) without needing a web browser.
### [Amazon Fire](#amazon-fire)
Tailscale now runs on Amazon Fire devices, fulfilling a [popular request](https://github.com/tailscale/tailscale/issues/10355). Tailscale supports [most Fire tablets and TV devices](https://tailscale.com/kb/1394/install-amazon-fire) released after 2018. This means you can run Tailscale as an exit node on your Amazon Fire TV devices, or connect to your private resources using your Amazon Fire tablets.
### [Visibility where you need it most](#visibility-where-you-need-it-most)
Tailscale’s Android app now displays detailed information throughout.
* Status indicators provide at-a-glance insights into node connectivity, and tapping on nodes shows detailed information about their attributes, including MagicDNS names, IPv4 and IPv6 addresses.
* A dedicated DNS settings view now displays information about resolvers, domains, and routing configurations of your tailnet.
* Tailnet lock configuration, including status and node keys, is now accessible in-app.### [Bug fixes and accessibility enhancements](#bug-fixes-and-accessibility-enhancements)
We’ve fixed some of the most reported issues including DNS resolution and Quick Settings, and introduced accessibility support. And as an added surprise, we now support a much anticipated dark mode.
### [Peeking under the hood](#peeking-under-the-hood)
All of this was possible thanks to a switch to [Jetpack Compose](https://developer.android.com/develop/ui/compose) (a modern toolkit for building native Android user interfaces), which streamlined the developer experience. We also adopted the handlers for the tailscaled API used by our other client platforms, which allowed us to modernize our design and ensure a consistent and efficient backend interaction. Additionally, by integrating [gomobile](https://pkg.go.dev/golang.org/x/mobile) (a Go-based framework for mobile applications), we’ve simplified the interface between our Go backend and the Android platform, enhancing maintainability and development velocity.
In previous versions, Tailscale’s Android app was built using the [Gio UI](https://gioui.org) framework for its user interface, alongside a Java Native Interface (JNI) layer to allow for communication between our Go backend and Android APIs. Building the UI of our app using a Go framework initially expedited our development efforts as it allowed us to easily share logic and data models between the frontend and the backend of our app.
That was very helpful to get our first Android app shipped, and got us a long way. As we were able to focus more resources on Android app development, we found that we were able to get more native-feeling results and better performance out of the Jetpack toolkit, and we’re excited for this new chapter.
### [We welcome feedback](#we-welcome-feedback)
We invite you to experience the new Tailscale Android app today — redesigned and reengineered. [Your feedback](https://github.com/tailscale/tailscale/issues/new/choose) is invaluable to us, so please share your thoughts and let us know how we can continue to improve.
Tailscale v1.66 for Android is available on the [Google Play Store](https://play.google.com/store/apps/details?id=com.tailscale.ipn) and [Amazon Appstore](https://www.amazon.com/dp/B0D38TRB3N).
Share
Authors
Kabir Sikand
Alessandro Mingione
Kari Lam
Andrea Gottardo
Percy Wegmann
JN
Jonathan Nobels
Authors
Kabir Sikand
Alessandro Mingione
Kari Lam
Andrea Gottardo
Percy Wegmann
JN
Jonathan Nobels
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