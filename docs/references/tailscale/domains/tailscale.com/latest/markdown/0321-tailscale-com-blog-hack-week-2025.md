Satellites, Linux trays, and laundry: Hack Week 2025 at Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsAugust 27, 2025
# Satellites, Linux trays, and laundry: Hack Week 2025 at Tailscale
Every so often, the code creators at Tailscale get to reasonably ignore their to-do lists and build something useful, unexpected, or that just scratches a particular itch, so long as it fits into one week. Earlier this month, Hack Week at Tailscale generated a bunch of such projects, some of which you might even see in your own client.
Tailscale has previously hosted a “St. Hackentine’s Hackathon,” one-day off-site hackathons, and other small-group sprints. This time it was a full week’s work, with a 5-minute presentation at week’s end. The projects that made it to the final show included deep, granular infrastructure work, along with a system for better roommate laundry coordination. Tailscale was the line through all of them.
Here’s a glimpse at what got hacked together:
## [A Reddit AMA hosted by a Tailscale software developer](#a-reddit-ama-hosted-by-a-tailscale-software-developer)
Simon Law, proving that his hack for hack week was being a nice guy and answering questions for a very long time.
Software developer Simon Law hacked on community engagement by taking part in [an Ask Me Anything (AMA) on Tailscale’s subreddit](https://www.reddit.com/r/Tailscale/comments/1mcixap/hi_im_a_software_developer_at_tailscale_ask_me/). Redditors brought some gripes (some of which [have been fixed](https://github.com/tailscale/tailscale/issues/16367#issuecomment-3168698039)!) and some [praise](https://www.reddit.com/r/Tailscale/comments/1mcixap/comment/n5uqgj9/). Simon shared [his developer journey](https://www.reddit.com/r/Tailscale/comments/1mcixap/comment/n761j8z/), and it all went much, much better than a lot of AMAs this writer has seen elsewhere.
## [A Linux systray (graphical) client](#a-linux-systray-graphical-client)
Will Norris, a Tailscale engineer, switched from macOS to a Framework laptop running Linux last year. As is often the case with a Linux desktop, he found a number of unofficial apps that improved on Tailscale’s command-line nature, including [tailscale-systray](https://github.com/mattn/tailscale-systray). Some were built for specific desktops environments (like GNOME or KDE), some worked better than others, but none provided everything Norris and other Linux-using Tailscalars wanted to see. So Norris, along with Claus Lensbøl, hacked on [Tailscale’s first Linux systray application](https://tailscale.com/kb/1597/linux-systray).
An early version of a systray client for Tailscale's Linux app, available now in the unstable builds.
You can check it out yourself, and report any issues with your system, by [installing an unstable build of Tailscale on Linux](https://pkgs.tailscale.com/unstable/) (fear not; as [Will wrote](https://www.reddit.com/r/Tailscale/comments/1mqe4ei/hey_desktop_linux_users_help_us_test_a_new/), “They’re not that unstable”). It should work on any desktop that includes D-Bus, and a desktop environment that supports the [StatusNotifierItem specification](https://www.freedesktop.org/wiki/Specifications/StatusNotifierItem/). XFCE is not yet supported, but likely to be added in the future, and there are some sizing and display quirks on COSMIC and GNOME desktops. But it keeps you from having to memorize every tailscale command line argument to switch profiles or select exit nodes.
With good feedback and progress, the system tray may be rolled into a future stable release on Linux.
## [Laundromates: Roommate laundry notifications, powered by Tailscale](#laundromates-roommate-laundry-notifications-powered-by-tailscale)
When it comes to roommate laundry syncing, knowing is half the battle.
There are 24 hours in a day, so it seems like four people sharing one washer and one dryer should be able to fit all their washing in. Ah, but humans, clothes, and perception of time do not snap into a schedule quite so easily. If you’ve ever angrily unloaded someone else’s underwear while you were in a hurry, you know it’s not a community-building exercise.
Some of the NFC stickers/buttons Bailey crafted to make updating washer and dryer status easier.
[Laundromates](https://github.com/tailscale-dev/laundromates) is a laundry room manager that can monitor a washer and dryer and notify people when they’re in use or free. Tailscale’s Bailey Jayes built the system with a Tailscale integration that can identify users, as well as make the notifications and networking secure. It can work as a phone-friendly web dashboard, showing when washers and dryers are in use and providing buttons for setting or clearing statuses. Or you can program NFC tags and stick them to the washer and dryer, so people can tap the phone they always have on them to start their process.
It’s the kind of self-hosted, limited-purpose app that works well with Tailscale, as it doesn’t require a sysadmin and security audit, just so you can check on whether the dryer will be free when you get home from grabbing coffee. Also: it works, according to Bailey. “I've done three times the normal amount of laundry since setting it up because I know when it's actually available, it's been really nice!”
## [The self-powering solar battery satellite Tailscale dashboard object](#the-self-powering-solar-battery-satellite-tailscale-dashboard-object)
Using the sun's power to reach internet in the stars.
Infrastructure engineer Jason O’Donnell built out a box that gets its power from the sun, its web access from the stars, and keeps itself properly topped off and working in the dark hours with a big lithium-ion battery, monitored by [Prometheus](https://prometheus.io/) and easily reachable from anywhere by Tailscale.
The 3D-printed mount attaching the Starlink unit to the battery handle? That used to be a Mountain Dew bottle.
That’s a lot to work out, but O’Donnell kept digging. He 3D-printed a custom mount for the [Starlink Roam](https://www.starlink.com/roam) dish so it could sit on top of his EcoFlow battery, making room as well for the connecting cables and the Raspberry Pi he can [SSH into](https://duckduckgo.com/y.js?ad_domain=tailscale.com&amp;ad_provider=bingv7aa&amp;ad_type=txad&amp;click_metadata=qHZtNVwOQxA5KimnhK49UFEYQApSFiKeqmsikwLfKOaL5-fh5DcaYrWl4_po2Q-hmAplZwuykmJ5meFEYd7SabISwVwpiZoKAfienVItQDJUJbHtLuCF6CvnhNCrwMGf.FhJHkyG2UuPtXisUVFfopg&amp;eddgt=K3N_cC_hk8DzGHu41EIzqA==&amp;rut=49d8d6b17723cb204e0c2160ff94793cdee6f811167a3503e7ca60caf271b9c3&amp;u3=https://www.bing.com/aclick?ld=e8XdlgiipAOGvdBX2n_SnE9TVUCUxhf2pfRGZXybgLZJvq3MPckcnEUJr3MPBfaGXXX3w-xbq3tTY9mvowNfnwvBWSjoM7YzMDvWzzj7fJieYoXb4_qfhOg-ahsIZRzS2IDKjTA3sXCKm1WMZm_ke_t7wrq1e3XhZQCX6XLEPX5NiI2ANKNGIrLFlH1HiOFEgAPG3VOm9j8WjFR0Nb6VZTHOZaJYQNIjvdaROxtu8RTEd_WvxYcyWAOQbufSrbJTmrV_EkbHdi2nTIxElk2V2dvndviD_GGPT-BWnz-8NHLUcv65Klr9Ce5g2zys-PVi_kWn86s2TvyeDULQiZ7SZaSfYp5huYFfaD0FrW1bx1w2pgg_hr-X5-px3GREVbgtXjLwTkBySSwGsu58T9EYzxtmcp0_6_7Rn4ShMTu4geyAtXFswVFrBwjaG1qfoOl4Ocue3rAu1GzhLK6V-CDGTVXlu0cq3gFHxgridUwAXHVXGpF0g0AmTraQk-IQHdE8mR6wHXmh_YWVMop32wiBmhn0OynYeaSvbsTI5e7RcHhqQux_acMUqFs7zrpOMJ8tLmxHH-W5xRuUJIm8_SMt_bxfGhMY0bJfWNINv0Q5TGFvmQkwRGNJAuiEq-yM-x7UKzXaTEoukjjVwmUXBeTFjZEy-8E4-FBsJUf532GB4OAY0V8FunzvM3Ouo3GUWLUxTNXtT5b9CwX9naeAdVHU39VRAsZ4SpFe_y-6IJcKt_KPUxcZAErBng6JhFxikE7EEBv2V1NQ&u=aHR0cHMlM2ElMmYlMmZ0YWlsc2NhbGUuY29tJTJmdGFpbHNjYWxlLXNzaCUzZm1zY2xraWQlM2Q0MjZiMmNiMmIxNzUxMDdhZjkwZDQ0MTUyYWRiOWUzOCUyNnV0bV9zb3VyY2UlM2RiaW5nJTI2dXRtX21lZGl1bSUzZGNwYyUyNnV0bV9jYW1wYWlnbiUzZEItUE1heC1TU0gtVVMlMjZ1dG1fdGVybSUzZHRhaWxzY2FsZS5jb20lMjZ1dG1fY29udGVudCUzZEItUE1heC1TU0gtVVM&rlid=426b2cb2b175107af90d44152adb9e38&amp;vqd=4-281743515475696942533376425199916041171&amp;iurl={1}IG=87C26256456A48DC833E55AAEF9E919A&CID=2FC740FF12EB6D0E349556B013D46CCE&ID=DevEx,5045.1) (“Ethernet to Starlink, Starlink through Tailscale over to my house,” he said). The PETG filament for that mount came from reused Mountain Dew bottles. It’s a neat bit of overkill, and it’s going to make neighbors jealous during the next local internet or power outage.
## [Other projects of note](#other-projects-of-note)
While the other completed HackWeek projects lacked the immediate visual and headline appeal of satellites, laundry machines, and desktop Linux (for which this *has* to be the year), they’re equally important. Tailscale’s technical staff worked out edge cases and built out infrastructure that could pay off down the road.
In (very) brief summary, these projects were:
* Improvements to the web/visual view of [Tailscale’s session recorder](https://tailscale.com/blog/session-recording-beta), by Tom Meadows
* A read-only NFS server that acts like a globally populated GOMODCACHE directory, to speed up Go builds, by Brad Fitzpatrick and Irbe Krumina
* A proof-of-concept video streaming app (“TailTube”), built in pure Swift using [tsnet](https://tailscale.com/blog/tsnet-virtual-private-services), by Jonathan Nobels
* A Tailscale “app” on Garmin watches, packed into an incredibly small space, just to see if it worked, by Mario Minardi
* A repository of standardized UI components for smaller projects, by Paul Rubritz
* Proof-of-concept work on PostgreSQL connectivity, by Max Coulombe
Thanks to Tailscale’s technical staff, who answered this writer’s questions and stole screenshots so that I could share their work with the web.
Share
Author
Kevin Purdy
Author
Kevin Purdy
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