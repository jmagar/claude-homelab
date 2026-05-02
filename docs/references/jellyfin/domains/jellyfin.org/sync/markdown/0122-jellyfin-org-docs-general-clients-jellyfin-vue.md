Jellyfin Vue | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
[Jellyfin Vue](https://github.com/jellyfin/jellyfin-vue) is an experimental, alternative browser-based web client for Jellyfin written using Vue.js.
note
Jellyfin Vue is not planned or targeted to replace the main Jellyfin Web client, and is not feature-complete.
Below are concise instructions to get your own instance of Jellyfin Vue up and running.
If you identify with at least one of the following options:
* Want to try it quickly for the first time
* Are not sure whether you want to deploy your own instance
* Don't need to go beyond user customization to change app-wide behaviour.
* Have a working HTTPS setup.
You're probably better using [our hosted instance](https://jf-vue.pages.dev).
More info at [Jellyfin Vue's repository](https://github.com/jellyfin/jellyfin-vue).
## Deployment[​](#deployment)
caution
Since Jellyfin Vue is just an interface for a Jellyfin server, all of these instructions assume that you already have a server up and running.
[Set it up now](/docs/general/installation/) if you haven't already.
## RECOMMENDED: Using Docker[​](#recommended-using-docker)
* In case you don't have Docker, follow [the official installation guide](https://docs.docker.com/engine/install) first.
Learning about [Compose](https://docs.docker.com/compose) is also recommended.
* Docker Compose is now shipped with Docker, so you don't need to install it. It's recommended that you uninstall
the old `docker-compose`.
* [`version` key is deprecated](https://docs.docker.com/reference/compose-file/version-and-name/#version-top-level-element-obsolete)
in Docker Compose, hence not included below.
We're going to use the following `docker-compose.yml` as a starting point:
```
`
services:
jellyfin\_vue:
container\_name: jellyfin\_vue
image: ghcr.io/jellyfin/jellyfin-vue:unstable
restart: always
ports:
- 8080:80
labels:
- 'com.centurylinklabs.watchtower.enable=true'
watchtower:
container\_name: watchtower
image: ghcr.io/nicholas-fedor/watchtower
volumes:
- /var/run/docker.sock:/var/run/docker.sock
environment:
TZ: Europe/Madrid
WATCHTOWER\_CLEANUP: 1
WATCHTOWER\_INCLUDE\_RESTARTING: 1
WATCHTOWER\_POLL\_INTERVAL: 60
WATCHTOWER\_LABEL\_ENABLE: 1
# Needed so watchtower doesn't restart-loop when updating itself
restart: on-failure
`
```
success
Getting things up and running is as easy as doing `docker compose up -d` with your terminal
located where the `docker-compose.yml` file is.
With this compose file:
* Jellyfin Vue will be accessible on `8080` port of the machine that's running the containers
* Watchtower (fork, [the original is unmaintained](https://github.com/containrrr/watchtower/issues/2067))
takes care of updating the container to the latest commit available on the
[repository](https://github.com/jellyfin/jellyfin-vue).
This is a good idea because:
* As of now, stable releases don't exist and there have only been prereleases that don't necessarily meet a quality criteria, but
[major development milestones](https://jellyfin.org/posts/vue-vue3/).
* Only the latest `unstable` image is supported.
After accessing the instance in your browser of choice, you'll be prompted to add a server. You can use your own server or our demo
instance, located at `https://demo.jellyfin.org/stable`
note
The server address you need to type is relative to the device you're accessing Jellyfin Vue. For instance,
if your Jellyfin Server is located at 192.168.0.10 and you have deployed Jellyfin Vue to that same server,
and your client is 192.168.0.20, the address you need to input is `http://192.168.0.10`, not
`http://127.0.0.1` or `http://localhost`.
You can learn more about how the connection to your server works
[in Jellyfin's Vue repository privacy disclaimer](https://github.com/jellyfin/jellyfin-vue#privacy-disclaimer-)
### Using environment variables[​](#using-environment-variables)
This is an example of how environment variables are set in the container by adding the
following keys to the `jellyfin\_vue` definition in [the above `docker-compose.yml`](#recommended-using-docker):
```
`
environment:
HISTORY\_ROUTER\_MODE: 1
`
```
See the [complete reference of environment variables available](https://github.com/jellyfin/jellyfin-vue/wiki/Configuration)
to further customize Jellyfin Vue to your liking at Jellyfin Vue's wiki.
### Using your own webserver[​](#using-your-own-webserver)
Since Jellyfin Vue is an SPA web application, you can use any web server to serve it:
Apache, nginx (the one used in Jellyfin's Vue docker image), Traefik, etc...
If you already have a [reverse proxy](/docs/general/post-install/networking/) set up, do you want to do more complex stuff
that it's out of the scope of this documentation like serving at a subpath, in another subdomain, etc...,
you might want to have Jellyfin Vue served by your own webserver instead of the nginx instance shipped with
the Docker image.
To achieve that, in the `jellyfin\_vue` service definition of the [`docker-compose.yml` shown above](#recommended-using-docker):
* Remove the `ports` key.
* Add the following keys, **replacing** `\_path\_` **with the folder** where your web server expects Jellyfin Vue's assets:
```
`
network\_mode: none
volumes:
- \_𝘱𝘢𝘵𝘩\_:/dest
# This makes the container do nothing and sleep forever,
# frontend will be copied to \_𝘱𝘢𝘵𝘩\_ and will be served by your web server
command: /bin/sh -c 'rm -rf /dest/\* && cp -r . /dest && sleep infinity'
`
```
This approach:
* Keeps the client always updated in a hassle-free way, as explained [above](#recommended-using-docker).
* In case you use [environment variables](#using-environment-variables),
they will still be applied.
## Manually[​](#manually)
caution
Make sure you understand [the implications](#why-updates-needed) before using these methods first.
None of them are supported by Jellyfin Vue.
### `docker run`[​](#docker-run)
In case you don't want to use Docker Compose or automated updates, but still use Docker, this command is enough:
```
`
docker run -d -p 8080:80 ghcr.io/jellyfin/jellyfin-vue:unstable
`
```
### From source / build output[​](#from-source--build-output)
info
This might not be necessary if you just want to test a Pull Request.
Check [these instructions instead](/docs/general/testing/web/)
danger
By default, never trust any assets given by anyone outside the official channels if you can't inspect the source code first.
They might compromise your system or track your activity!
Since Jellyfin Vue is a web application, using it it's a matter of setting up your own web server
and pointing it to Jellyfin Vue's assets. You can get them:
* By building your own version from our source. The repository's [wiki](https://github.com/jellyfin/jellyfin-vue/wiki)
has instructions for setting up the development environment.
* By getting them from [GitHub's Actions artifacts](https://github.com/jellyfin/jellyfin-vue/actions).
* Although those artifacts are built in our repository's CI/CD,
**some runs are sourced from Pull Requests created by external contributors that might not be good actors!**
* All artifacts generated by GitHub Actions are [built with provenances](https://github.com/jellyfin/jellyfin-vue/attestations).
* Our official Docker image is built from GitHub Actions and all the process is transparent and can be audited.
## Other documentation[​](#other-documentation)
* The rest of the documentation about Jellyfin Vue can be found on it's [wiki](https://github.com/jellyfin/jellyfin-vue/wiki).
* You can check [GitHub Packages (GHCR)](https://github.com/jellyfin/jellyfin-vue/pkgs/container/jellyfin-vue) (recommended)
or [DockerHub](https://hub.docker.com/r/jellyfin/jellyfin-vue) for all the tagged Docker images.
* [Deployment](#deployment)
* [RECOMMENDED: Using Docker](#recommended-using-docker)
* [Using environment variables](#using-environment-variables)
* [Using your own webserver](#using-your-own-webserver)
* [Manually](#manually)
* [`docker run`](#docker-run)
* [From source / build output](#from-source--build-output)
* [Other documentation](#other-documentation)