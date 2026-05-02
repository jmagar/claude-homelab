Building from source | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
As an alternative to using binary packages, you can build Jellyfin from source.
Jellyfin supports several methods of building for different platforms and instructions for all supported platforms are below.
All package builds begin with these two steps:
1. Clone the repository.
```
`
git clone https://github.com/jellyfin/jellyfin-packaging.git
cd jellyfin-packaging
`
```
2. Initialize the submodules.
```
`
git submodule update --init
`
```
## Container image[​](#container-image)
1. Build the container image using Docker or Podman.
```
`
docker build -t $USERNAME/jellyfin --file docker/Dockerfile .
`
```
or
```
`
podman build -t $USERNAME/jellyfin --file docker/Dockerfile .
`
```
or use provided Python build script:
```
`
./build.py auto docker
`
```
Replace "auto" with your own Jellyfin version tag if you want to.
2. Run Jellyfin in a new container using Docker or Podman from the built container image.
```
`
docker run -d -p 8096:8096 $USERNAME/jellyfin
`
```
or
```
`
podman run -d -p 8096:8096 $USERNAME/jellyfin
`
```
## Linux or MacOS[​](#linux-or-macos)
1. Use the included `build` script to perform builds.
```
`
./build --help
./build --list-platforms
./build \<platform\> all
`
```
2. The resulting archives can be found at `../bin/\<platform\>`.
note
This will very likely be split out into a separate repository at some point in the future.
## Windows[​](#windows)
1. Install dotnet SDK 8.0 from [Microsoft's Website](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) and [install Git for Windows](https://gitforwindows.org/).
You must be on Powershell 3 or higher.
2. From Powershell set the execution policy to unrestricted.
```
`
set-executionpolicy unrestricted
`
```
3. If you are building a version of Jellyfin newer than 10.6.4, you will need to download the build script from a separate repository.
```
`
git clone https://github.com/jellyfin/jellyfin-server-windows.git windows
`
```
4. Run the Jellyfin build script.
```
`
windows\\build-jellyfin.ps1 -verbose
`
```
* The `-WindowsVersion` and `-Architecture` flags can optimize the build for your current environment; the default is generic Windows x64.
* The `-InstallLocation` flag lets you select where the compiled binaries go; the default is `$Env:AppData\\Jellyfin-Server\\`.
* The `-InstallFFMPEG` flag will automatically pull the stable `ffmpeg` binaries appropriate to your architecture (x86/x64 only for now) from [BtbN](https://github.com/BtbN/FFmpeg-Builds/releases) and place them in your Jellyfin directory.
* The `-InstallNSSM` flag will automatically pull the stable `nssm` binary appropriate to your architecture (x86/x64 only for now) from [NSSM's Website](https://nssm.cc/) and place it in your Jellyfin directory.
* (Optional) Use [NSSM](https://nssm.cc) to configure Jellyfin to run as a service.
* Jellyfin is now available in the default directory, or whichever directory you chose.
* Start it from PowerShell.
```
`
&"$env:APPDATA\\Jellyfin-Server\\jellyfin.exe"
`
```
* Start it from CMD.
```
`
%APPDATA%\\Jellyfin-Server\\jellyfin.exe
`
```
note
This will very likely be split out into a separate repository at some point in the future.
* [Container image](#container-image)
* [Linux or MacOS](#linux-or-macos)
* [Windows](#windows)