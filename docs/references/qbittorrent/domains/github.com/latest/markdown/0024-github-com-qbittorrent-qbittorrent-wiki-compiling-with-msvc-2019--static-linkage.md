Compiling with MSVC 2019 (static linkage) · qbittorrent/qBittorrent Wiki · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
qbittorrent
](/qbittorrent)
/
**
[qBittorrent](/qbittorrent/qBittorrent)
**
Public
*
* [ Notifications
](/login?return_to=/qbittorrent/qBittorrent) You must be signed in to change notification settings
* [ Fork
4.6k
](/login?return_to=/qbittorrent/qBittorrent)
*
[
Star
36.8k
](/login?return_to=/qbittorrent/qBittorrent)
# Compiling with MSVC 2019 (static linkage)
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[23 revisions](/qbittorrent/qBittorrent/wiki/Compiling-with-MSVC-2019-(static-linkage)/_history)
This page describes how to compile 32-bit and 64-bit qBittorrent using MSVC 2019 under Windows. This is tested under Windows 10 64-bit but it should work the same under any other Windows version. Here the Community Edition of MSVC 2019 was used but any other edition must behave the same.
|
## Table of Contents
[](#table-of-contents)
* [What you will need:](#user-content-What_you_will_need)
* [Info that applies to all steps](#user-content-Info_that_applies_to_all_steps)
* [Compiling Zlib](#user-content-Compiling_Zlib)
* [Compiling OpenSSL](#user-content-Compiling_OpenSSL)
* [Compiling Boost](#user-content-Compiling_Boost)
* [Compiling Libtorrent](#user-content-Compiling_Libtorrent)
* [Compiling Qt5](#user-content-Compiling_Qt5)
* [Install and Configure Qt Creator](#user-content-Install_and_Configure_Qt_Creator)
* [Compiling qBittorrent](#user-content-Compiling_qBittorrent)|
###
What you will need:
[](#what-you-will-need)
* The MSVC 2019 compiler. The free [Community Edition](https://visualstudio.microsoft.com/vs/community/) will do fine.
* A [Perl language](https://www.perl.org/) interpreter. [Strawberry Perl](http://strawberryperl.com/) will do fine.
* Latest release of the [NASM assembler](https://www.nasm.us/).
* Latest release of [Zlib](https://www.zlib.net/).
* Latest release of [OpenSSL](https://www.openssl.org/source/) (1.1.1 branch).
* Latest release of the [Boost libraries](https://www.boost.org/).
* Latest release of [libtorrent(rasterbar)](https://www.libtorrent.org/) (1.2.x branch).
* Latest release of the [Qt libraries](https://download.qt.io/official_releases/qt/) source.
* Choose the latest release, and then download the .tar.xz or .zip file under the 'single' directory. For example, 5.15.1 may be found [here](https://download.qt.io/official_releases/qt/5.15/5.15.1/single/).
* **Note**: This is a massive source tree, with many small files, and will take some time to decompress.
* Latest release of qBittorrent (clone the repository or download the source tarball of the latest release). Typically you want either the latest stable release or the latest master commit, for the latest fixes and improvements.
* [Qt Creator](https://download.qt.io/official_releases/qtcreator/).
###
Info that applies to all steps
[](#info-that-applies-to-all-steps)
* Let's assume that the working directory for our compilation will be `G:\\QBITTORRENT`
* For 32-bit or 64-bit you need to use the appropriate version of the compiler. All commands will be issued from the appropriate compiler command prompt. Open it via `Start-\>All Programs-\>Visual Studio 2019-\>Visual Studio Tools-\>VC`. For **32-bit** use `x86 Native Tools Command Prompt for VS 2019` and for **64-bit** use `x64 Native Tools Command Prompt for VS 2019`
* The above prompt will open and will use a path under the `C:\\` drive. If you want to use another drive for compilation (like mentioned above) you need to switch to that. Simply issuing `G:` (or any other drive letter) will switch there.
* When you want to change paths in the prompt you do it by issuing `cd new-path`. **NOTE:** If the path starts with a different drive letter you need to switch to that first. The `cd` command doesn't do it automatically.
* We will use 2 installation paths
**32-bit:**
* `G:\\QBITTORRENT\\install\_msvc32\\base` will be used for installing all necessary libs except Qt
* `G:\\QBITTORRENT\\install\_msvc32\\base\\qt5` will be used for installing Qt
**64-bit:**
* `G:\\QBITTORRENT\\install\_msvc64\\base` will be used for installing all necessary libs except Qt
* `G:\\QBITTORRENT\\install\_msvc64\\base\\qt5` will be used for installing Qt
* In general these compiler/linker flags will be used (at some places below there are deviations):
* **Compiler (32-bit):** -O1 -Oy- -Gy -Gw -GL -MT
* **Compiler (64-bit):** -O1 -Gy -Gw -GL -MT
* **Linker:** /NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /DEBUG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
###
Compiling Zlib
[](#compiling-zlib)
* Extract the Zlib source inside our working dir.
* Navigate to the Zlib source folder. eg `cd G:\\QBITTORRENT\\zlib-1.2.11`
* Edit the **win32/Makefile.msc** file. Find the CFLAGS, ASFLAGS and LDFLAGS variables and replace them with these:
```
32-bit: CFLAGS = -nologo -O1 -Oy- -Gy -Gw -GL -MT $(LOC)
64-bit: CFLAGS = -nologo -O1 -Gy -Gw -GL -MT $(LOC)
LDFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
```
From ASFLAGS delete "/Zi"
* Issue the following command:
```
nmake -f win32/Makefile.msc
```
* Copy zlib.h, zconf.h, zlib.lib to our install dir.**32-bit**
```
xcopy zlib.h G:\\QBITTORRENT\\install\_msvc32\\base\\include\\
xcopy zconf.h G:\\QBITTORRENT\\install\_msvc32\\base\\include\\
xcopy zlib.lib G:\\QBITTORRENT\\install\_msvc32\\base\\lib\\
```
**64-bit**
```
xcopy zlib.h G:\\QBITTORRENT\\install\_msvc64\\base\\include\\
xcopy zconf.h G:\\QBITTORRENT\\install\_msvc64\\base\\include\\
xcopy zlib.lib G:\\QBITTORRENT\\install\_msvc64\\base\\lib\\
```
###
Compiling OpenSSL
[](#compiling-openssl)
* Make sure you have installed perl and nasm.
* Extract the OpenSSL source inside our working dir.
* Navigate to the OpenSSL source folder. eg `cd G:\\QBITTORRENT\\openssl-1.1.1g`
* Now we will build a static version of OpenSSL. Issue the following commands:
**32-bit**
```
perl Configure VC-WIN32 no-shared no-zlib no-zlib-dynamic threads --release --openssldir=C:\\openssl --prefix=G:\\QBITTORRENT\\install\_msvc32\\base -IG:\\QBITTORRENT\\install\_msvc32\\base\\include -LG:\\QBITTORRENT\\install\_msvc32\\base\\lib --with-zlib-lib=G:\\QBITTORRENT\\install\_msvc32\\base\\lib\\zlib.lib
```
**64-bit**
```
perl Configure VC-WIN64A no-shared no-zlib no-zlib-dynamic threads --release --openssldir=C:\\openssl --prefix=G:\\QBITTORRENT\\install\_msvc64\\base -IG:\\QBITTORRENT\\install\_msvc64\\base\\include -LG:\\QBITTORRENT\\install\_msvc64\\base\\lib --with-zlib-lib=G:\\QBITTORRENT\\install\_msvc64\\base\\lib\\zlib.lib
```
* **NOTE:** Using the `--openssldir` switch is very important. It controls the path that will get hardcoded into openssl when it looks for the file `openssl.cnf`. Otherwise openssl will use the prefix path. If that path is on any other drive other than C: it will cause weird problems for **some** of the end users. If users have assigned to G: (or any other letter you used) a card reader/cdrom/dvdrom that doesn't have a card/cd/dvd plugged in they will get a cryptic message saying `There is no disk in the drive. Please insert a disk into drive G:`. See issue [#4190](https://github.com/qbittorrent/qBittorrent/issues/4190). So for that reason we use a dummy path under drive C: which is always available.
* Edit the generated *makefile* file.
* At the end of the CFLAGS variable append:
**32-bit**
```
-Oy- -Gy -Gw -GL -MT
```
**64-bit**
```
-Gy -Gw -GL -MT
```
Don't use "-O1" because it makes one openssl test fail which might indicate a general problem with the openssl build
* Find the LDFLAGS variable and replace it with:
```
LDFLAGS=/NOLOGO /SUBSYSTEM:CONSOLE /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
```
* Then issue the following:
```
nmake
nmake test
```
* Because we substituted the LDFLAGS variable and removed the "/debug" switch, \*.pdb files weren't generated. The next command expects to find one at "apps/openssl.pdb". So we just create a dummy file with that name. The easiest way is to make a copy of `openssl.exe` (exists in the same subfolder) and rename it to `openssl.pdb`.
* Issue command:
```
nmake install\_sw
```
* Delete the dummy `openssl.pdb` from where it was copied to (adjust for 64-bit):
```
G:\\QBITTORRENT\\install\_msvc32\\base\\bin\\openssl.pdb
```
###
Compiling Boost
[](#compiling-boost)
* Extract the Boost sources in the working dir.
* Navigate to the Boost source folder. eg `cd G:\\QBITTORRENT\\boost\_1\_73\_0`
* Now you will need to bootstrap Boost so it will build b2.exe(previously bjam.exe). Issue the following command:
```
bootstrap.bat
```
* Compile a static version of Boost. Issue the following command. Replace N in `-j N` with the number of CPU cores you have or how many threads you want b2 to use when compiling:**32-bit**
```
b2 -q --with-system --with-date\_time --toolset=msvc-14.2 variant=release link=static runtime-link=static include="G:\\QBITTORRENT\\install\_msvc32\\base\\include" library-path="G:\\QBITTORRENT\\install\_msvc32\\base\\lib" define=BOOST\_ASIO\_DISABLE\_CONNECTEX cxxflags="-O1 -Oy- -Gy -Gw -GL" linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j N
```
**64-bit**
```
b2 -q --with-system --with-date\_time --toolset=msvc-14.2 address-model=64 variant=release link=static runtime-link=static include="G:\\QBITTORRENT\\install\_msvc64\\base\\include" library-path="G:\\QBITTORRENT\\install\_msvc64\\base\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc64\\base" cxxflags="-O1 -Gy -Gw -GL" linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j N
```
###
Compiling Libtorrent
[](#compiling-libtorrent)
* Extract the Libtorrent sources in the working dir.
* Navigate to the Libtorrent source folder. eg `cd G:\\QBITTORRENT\\libtorrent-rasterbar-1.2.10`
* Copy the b2.exe from the Boost directory to the Libtorrent directory
```
copy ..\\boost\_1\_73\_0\\b2.exe b2.exe
```
* Set the following two shell variables, so that boost knows where its build system is:
```
set BOOST\_ROOT=G:\\QBITTORRENT\\boost\_1\_73\_0
set BOOST\_BUILD\_PATH=G:\\QBITTORRENT\\boost\_1\_73\_0\\tools\\build
```
* Compile a static version of Libtorrent. Issue the following command. Replace N in `-j N` with the number of CPU cores you have or how many threads you want b2 to use when compiling:**32-bit**
```
b2 -q --without-python --toolset=msvc-14.2 variant=release link=static runtime-link=static debug-symbols=on encryption=on crypto=openssl openssl-version=1.1 logging=off dht=on windows-version=win7 boost-link=static -sBOOST\_ROOT="G:\\QBITTORRENT\\boost\_1\_73\_0" include="G:\\QBITTORRENT\\install\_msvc32\\base\\include" include="G:\\QBITTORRENT\\boost\_1\_73\_0" library-path="G:\\QBITTORRENT\\install\_msvc32\\base\\lib" library-path="G:\\QBITTORRENT\\boost\_1\_73\_0\\stage\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc32\\base" define=BOOST\_ASIO\_DISABLE\_CONNECTEX cxxflags="-O1 -Oy- -Gy -Gw -GL" linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j N
```
**64-bit**
```
b2 -q --without-python --toolset=msvc-14.2 address-model=64 variant=release link=static runtime-link=static debug-symbols=on encryption=on crypto=openssl openssl-version=1.1 logging=off dht=on windows-version=win7 boost-link=static -sBOOST\_ROOT="G:\\QBITTORRENT\\boost\_1\_73\_0" include="G:\\QBITTORRENT\\install\_msvc64\\base\\include" include="G:\\QBITTORRENT\\boost\_1\_73\_0" library-path="G:\\QBITTORRENT\\install\_msvc64\\base\\lib" library-path="G:\\QBITTORRENT\\boost\_1\_73\_0\\stage\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc64\\base" cxxflags="-O1 -Gy -Gw -GL" define=BOOST\_ASIO\_DISABLE\_CONNECTEX linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j N
```
* Install:**32-bit**
```
b2 -q --without-python --toolset=msvc-14.2 variant=release link=static runtime-link=static debug-symbols=on encryption=on crypto=openssl openssl-version=1.1 logging=off dht=on windows-version=win7 boost-link=static -sBOOST\_ROOT="G:\\QBITTORRENT\\boost\_1\_73\_0" include="G:\\QBITTORRENT\\install\_msvc32\\base\\include" include="G:\\QBITTORRENT\\boost\_1\_73\_0" library-path="G:\\QBITTORRENT\\install\_msvc32\\base\\lib" library-path="G:\\QBITTORRENT\\boost\_1\_73\_0\\stage\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc32\\base" define=BOOST\_ASIO\_DISABLE\_CONNECTEX cxxflags="-O1 -Oy- -Gy -Gw -GL" linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j N install
```
**64-bit**
```
b2 -q --without-python --toolset=msvc address-model=64 variant=release link=static runtime-link=static debug-symbols=on encryption=on crypto=openssl openssl-version=1.1 logging=off dht=on windows-version=win7 boost-link=static -sBOOST\_ROOT="G:\\QBITTORRENT\\boost\_1\_73\_0" include="G:\\QBITTORRENT\\install\_msvc64\\base\\include" include="G:\\QBITTORRENT\\boost\_1\_73\_0" library-path="G:\\QBITTORRENT\\install\_msvc64\\base\\lib" library-path="G:\\QBITTORRENT\\boost\_1\_73\_0\\stage\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc64\\base" cxxflags="-O1 -Gy -Gw -GL" define=BOOST\_ASIO\_DISABLE\_CONNECTEX linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j N install
```
###
Compiling Qt5
[](#compiling-qt5)
* Extract the Qt sources in the working dir.
* Navigate to the Qt source folder. eg `cd G:\\QBITTORRENT\\qt-everywhere-src-5.14.2`
* Now we will build a static version of Qt and make it as small as possible.
* Open **qtbase/mkspecs/common/msvc-desktop.conf** and replace the relevant lines with:
**32-bit**
```
QMAKE\_CFLAGS\_RELEASE = -O1 -Oy- -Gy -Gw -GL -MT
QMAKE\_CFLAGS\_RELEASE\_WITH\_DEBUGINFO += -O1 -Oy- -Gy -Gw -GL -MT -Zi
```
**64-bit**
```
QMAKE\_CFLAGS\_RELEASE = -O1 -Gy -Gw -GL -MT
QMAKE\_CFLAGS\_RELEASE\_WITH\_DEBUGINFO += -O1 -Gy -Gw -GL -MT -Zi
```
**32bit and 64-bit**
```
QMAKE\_CFLAGS\_DEBUG = -Zi -MTd
QMAKE\_LFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG
QMAKE\_LFLAGS\_RELEASE = /DEBUG /OPT:REF /OPT:ICF=5 /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
QMAKE\_LFLAGS\_RELEASE\_WITH\_DEBUGINFO = /DEBUG /OPT:REF /OPT:ICF=5 /INCREMENTAL:NO
```
* Issue the following command:**32-bit**
```
configure -prefix G:\\QBITTORRENT\\install\_msvc32\\qt5 -I G:\\QBITTORRENT\\install\_msvc32\\base\\include -L G:\\QBITTORRENT\\install\_msvc32\\base\\lib -platform win32-msvc -release -opensource -confirm-license -strip -no-shared -static -static-runtime -ltcg -make libs -make tools -nomake examples -no-compile-examples -no-dbus -no-icu -system-zlib -openssl-linked -no-gtk -no-opengl -no-opengles3 -no-angle -no-sql-sqlite -no-sql-odbc -no-sqlite -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcanvas3d -skip qtcharts -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc -skip qtgamepad -skip qtgraphicaleffects -skip qtimageformats -skip qtlocation -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth -skip qtpurchasing -skip qtquickcontrols -skip qtquickcontrols2 -skip qtremoteobjects -skip qtscript -skip qtscxml -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtspeech -skip qtvirtualkeyboard -skip qtwayland -skip qtwebchannel -skip qtwebengine -skip qtwebglplugin -skip qtwebsockets -skip qtwebview -skip qtx11extras -skip qtxmlpatterns ZLIB\_LIBS="-lzlib" OPENSSL\_LIBS="-lzlib -llibcrypto -llibssl -lgdi32 -luser32 -lws2\_32 -lAdvapi32 -lCrypt32"
```
**64-bit**
```
configure -prefix G:\\QBITTORRENT\\install\_msvc64\\qt5 -I G:\\QBITTORRENT\\install\_msvc64\\base\\include -L G:\\QBITTORRENT\\install\_msvc64\\base\\lib -platform win32-msvc -release -opensource -confirm-license -strip -no-shared -static -static-runtime -ltcg -make libs -make tools -nomake examples -no-compile-examples -no-dbus -no-icu -system-zlib -openssl-linked -no-gtk -no-opengl -no-opengles3 -no-angle -no-sql-sqlite -no-sql-odbc -no-sqlite -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcanvas3d -skip qtcharts -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc -skip qtgamepad -skip qtgraphicaleffects -skip qtimageformats -skip qtlocation -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth -skip qtpurchasing -skip qtquickcontrols -skip qtquickcontrols2 -skip qtremoteobjects -skip qtscript -skip qtscxml -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtspeech -skip qtvirtualkeyboard -skip qtwayland -skip qtwebchannel -skip qtwebengine -skip qtwebglplugin -skip qtwebsockets -skip qtwebview -skip qtx11extras -skip qtxmlpatterns ZLIB\_LIBS="-lzlib" OPENSSL\_LIBS="-lzlib -llibcrypto -llibssl -lgdi32 -luser32 -lws2\_32 -lAdvapi32 -lCrypt32"
```
* Now you have 2 choices for compiling. Using `nmake` or `jom`. nmake uses only one core for compilation. That means that the qt compilation will take hours. On the other hand jom can use multiple cores/threads for faster compilation. Download it from [here](https://download.qt.io/official_releases/jom/). Extract the jom.exe to the qt source dir and just issue(N number of cores/threads to use):
```
jom -j N
```
* Now install:
```
jom -j N install
```
###
Install and Configure Qt Creator
[](#install-and-configure-qt-creator)
* Just follow the installer instructions for the installation.
* Launch Qt Creator and select Tools-\>Options...
* Select the **Kits** item from the left and select the **Qt Versions** tab.
* Click the **Add...** button and select the qmake.exe you just build. It should be in **G:\\QBITTORRENT\\install\_msvc32\\qt5\\bin\\qmake.exe** or **G:\\QBITTORRENT\\install\_msvc64\\qt5\\bin\\qmake.exe**
* Name it something meaningful like "Qt5 msvc x32" or "Qt5 msvc x64"
* Apply the changes
* Click the **Kits** tab
* Click the **Add** button. Choose a name eg Qt5 msvc2019 x32. Also choose a Qt version and a compiler from the drop down menus. Be sure to select the 32-bit(x86) version of the compiler if you choose the 32-bit version of Qt and the equivalent for 64-bit. Click Apply.
* If you have configured multiple kits, then select the one you want as default and click the button **Make Default** and click OK. Otherwise, just close the dialog now.
###
Compiling qBittorrent
[](#compiling-qbittorrent)
* Extract the qBittorrent sources in the working dir.
* Launch Qt Creator and open the `qbittorrent.pro` file in `G:\\QBITTORRENT\\qBittorrent`
* From the Window that pops up select the Qt version you added above and specify **release** version. You can also select where qBittorrent will be built if you want.
* If you're compiling the 4.2.x branch with MSVC2019:
* Navigate down to `src/gui/Sources` in the Qt Creator folder tree on the left.
* Open `fspathedit.cpp`.
* At the end of the header inclusions at beginning of that file, add this line:
`#include \<stdexcept\>`
* and save your changes.
* Navigate to `G:\\QBITTORRENT\\qBittorrent` in Windows Explorer, and rename the `conf.pri.windows` file to `conf.pri` (or make a copy of it with that name). You'll have to change a few paths here so that qBittorrent successfully builds and links.
**NOTE:** The paths below use the proper pathnames for a 64-bit build. Make sure you adjust them if you are building for a 32-bit target. Moreover, there are some notes in `conf.pri` itself that provide for alternative configurations that are worth paying attention to, but are not covered here. Keeping that in mind:
* Edit the first INCLUDEPATH to look like this (adjust for actual boost version):
```
INCLUDEPATH += $$quote(G:/QBITTORRENT/boost\_1\_73\_0)
```
* Edit the second INCLUDEPATH to look like this:
```
INCLUDEPATH += $$quote(G:/QBITTORRENT/install\_msvc64/base/include)
```
* Edit the third INCLUDEPATH to look like this:
```
INCLUDEPATH += $$quote(G:/QBITTORRENT/install\_msvc64/qt5/include)
```
* Delete the lines with the rest of the INCLUDEPATH variables
* Edit the first LIBS to look like this (adjust for actual boost version):
```
LIBS += $$quote(-LG:/QBITTORRENT/boost\_1\_73\_0/stage/lib)
```
* Edit the second LIBS to look like this:
```
LIBS += $$quote(-LG:/QBITTORRENT/install\_msvc64/base/lib)
```
* Edit the third LIBS to look like this:
```
LIBS += $$quote(-LG:/QBITTORRENT/install\_msvc64/qt5/lib)
```
* Delete the nearby lines with the rest of the LIBS variables that **expect paths**
* Look for the LIBS variables that take the lib names of libboost\_system.
* These lines may mention the `libtorrent` library as well on versions earlier than the 4.3.x branch; just leave that alone if it is present.
* Adjust the filename of the `libboost\_system` library. Its full name will vary based on the boost version, build-system, and target architecture, among other things. In our example, it can be found under `G:/QBITTORRENT/boost\_1\_73\_0/stage/lib`.
* For example, if you've built an x64 build of boost 1.73.0 with MSVC2019, it should be `libboost\_system-vc142-mt-s-x64-1\_73.lib`
* **Additionally**, if you are building 4.3.x or later, you must **also** specify the correct filename of the `libboost\_date\_time` library here. You can find out what it is by looking in the same directory that the `libboost\_system` library is.
* If you are compiling the 4.2.x branch rather than the latest master commit, find the following line
`LIBS += libeay32.lib ssleay32.lib`
* and replace it with:
`LIBS += libcrypto.lib libssl.lib`
* Save your changes.
* Select Build-\>Build Project "qbittorrent"
* After the compilation ends you should have *qbittorrent.exe* in `\<build folder\>\\src\\release`. "build folder" is where you chose qBittorrent to be built in the popup window.
* If you didn't specify a build directory earlier, then by default, the build folder will be a new directory that's the same depth as--*not under*--your source directory, and may look something like this: `build-qbittorrent-Desktop\_x86\_windows\_msvc2019\_pe\_64bit-Release`.
[Go back to home](https://github.com/qbittorrent/qBittorrent/wiki)
## General
[](#general)
* [Installing qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/Installing-qBittorrent)
* [Frequently Asked Questions (FAQ)](https://github.com/qbittorrent/qBittorrent/wiki/Frequently-Asked-Questions)
* [qBittorrent options (current and deprecated)](https://github.com/qbittorrent/qBittorrent/wiki/Explanation-of-Options-in-qBittorrent)
* [How to use qBittorrent as a tracker](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-qBittorrent-as-a-tracker)
* [How to use portable mode](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-portable-mode)
* [Anonymous mode](https://github.com/qbittorrent/qBittorrent/wiki/Anonymous-Mode)
* [How to bind your vpn to prevent ip leaks](https://github.com/qbittorrent/qBittorrent/wiki/How-to-bind-your-vpn-to-prevent-ip-leaks.md)
### Troubleshooting
[](#troubleshooting)
* [qBittorrent support forum](http://forum.qbittorrent.org/)
* [I forgot my GUI lock password](https://github.com/qbittorrent/qBittorrent/wiki/I-forgot-my-UI-lock-password)
* [I forgot my WebUI password](https://github.com/qbittorrent/qBittorrent/wiki/Web-UI-password-locked-on-qBittorrent-NO-X-(qbittorrent-nox))
* [Speed issues](https://github.com/qbittorrent/qBittorrent/wiki/Things-we-need-to-know-to-help-you-with-'speed'-issues)
### External programs
[](#external-programs)
* [How-to](https://github.com/qbittorrent/qBittorrent/wiki/External-programs-How-to)
* [`savecategory`](https://github.com/qbittorrent/qBittorrent/wiki/External-programs-savecategory)
### Search plugins
[](#search-plugins)
* [List of unofficial search plugins](https://github.com/qbittorrent/search-plugins/wiki/Unofficial-search-plugins)
### Themes
[](#themes)
* [Developing custom UI themes](https://github.com/qbittorrent/qBittorrent/wiki/Create-custom-themes-for-qBittorrent)
* [How to use custom UI themes](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-custom-UI-themes)
* [List of unofficial themes](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-qBittorrent-themes)
### Translation
[](#translation)
* [How to translate qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/How-to-translate-qBittorrent)
## WebUI
[](#webui)
### WebUI API
[](#webui-api)
|State|Version|
|[Current](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0))|qBittorrent \>= 5.0|
|[Previous](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1))|qBittorrent v4.1.0 - v4.6.x|
|[Previous](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.2.0-v4.0.4))|qBittorrent v3.2.0 - v4.0.x|
|[Obsolete](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.1.x))|qBittorrent \< v3.2.0|
### Authentication
[](#authentication)
* [Username/password](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0)#login)
* [API key](https://github.com/qbittorrent/qBittorrent/wiki/API-Key-Authentication-(≥v5.2.0))
### WebAPI clients
[](#webapi-clients)
* [List of unofficial WebAPI clients](https://github.com/qbittorrent/qBittorrent/wiki/List-of-unofficial-WebAPI-clients)
### Alternate WebUI
[](#alternate-webui)
* [Alternate WebUI usage](https://github.com/qbittorrent/qBittorrent/wiki/Alternate-WebUI-usage)
* [Developing alternate WebUIs](https://github.com/qbittorrent/qBittorrent/wiki/Developing-alternate-WebUIs-(WIP))
* [List of unofficial alternate WebUIs](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-alternate-WebUIs)
### Reverse proxy setup for WebUI access
[](#reverse-proxy-setup-for-webui-access)
* [NGINX](https://github.com/qbittorrent/qBittorrent/wiki/NGINX-Reverse-Proxy-for-Web-UI)
* [Microsoft IIS ARR](https://github.com/qbittorrent/qBittorrent/wiki/IIS-ARR-Reverse-Proxy)
* [Traefik](https://github.com/qbittorrent/qBittorrent/wiki/Traefik-Reverse-Proxy-for-Web-UI)
### WebUI HTTPS configuration
[](#webui-https-configuration)
* [Let's Encrypt Certificates + Caddy2 Reverse Proxy](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-HTTPS-with-Let's-Encrypt-&amp;-Caddy2-reverse-proxy)
* [Let's Encrypt certificates + NGINX reverse proxy - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-HTTPS-with-Let's-Encrypt-certificates-and-NGINX-SSL-reverse-proxy)
* [Let's Encrypt certificates - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-Let's-Encrypt-certificates)
* [Self-signed SSL certificates - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-self-signed-SSL-certificates)
## Linux
[](#linux)
* [Running qBittorrent without X server (WebUI only)](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only))
* [Running qBittorrent without X server (WebUI only, systemd service set up, Ubuntu 15.04 or newer)](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer))
* [OpenVPN and qBittorrent without X server](https://github.com/qbittorrent/qBittorrent/wiki/OpenVPN-and-qBittorrent-without-X-server)
## Development
[](#development)
* [Coding style](https://github.com/qbittorrent/qBittorrent/blob/master/CODING_GUIDELINES.md)
* [Contributing](https://github.com/qbittorrent/qBittorrent/blob/master/CONTRIBUTING.md)
* [How to write a search plugin](https://github.com/qbittorrent/search-plugins/wiki/How-to-write-a-search-plugin)
* [Using VSCode for qBittorrent development](https://github.com/qbittorrent/qBittorrent/wiki/Using-VSCode-for-qBittorrent-development)
* [Setup GDB with Qt pretty printers](https://github.com/qbittorrent/qBittorrent/wiki/Setup-GDB-with-Qt-pretty-printers)
* [How to debug WebUI code](https://github.com/qbittorrent/qBittorrent/wiki/How-to-debug-the-WebUI-code)
### Compilation
[](#compilation)
[Common information for CMake](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-with-CMake-common-information)
#### \*BSD, Linux
[](#bsd-linux)
* [Alpine Linux](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Alpine-Linux)
* [CentOS 8.x](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-CentOS-8.x)
* [Debian / Ubuntu and derivatives (CMake)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian,-Ubuntu,-and-derivatives)
* [Debian / Ubuntu and derivatives (autotools/qmake)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian-and-Ubuntu)
* [Docker](https://github.com/qbittorrent/docker-qbittorrent-nox#readme)
* [FreeBSD (no GUI)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-FreeBSD-(no-GUI))
* [Fully static binaries on Linux (glibc or musl)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Fully-static-binaries-on-Linux-(glibc-or-musl))
* [Raspberry Pi OS / DietPi](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Raspberry-Pi-OS-and-DietPi)
* [Raspbian for LeMaker Banana Pro](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Raspbian-for-LeMaker-Banana-Pro)
#### macOS
[](#macos)
* [cmake (x86\_64, arm64, cross-compilation, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-macOS-(x86_64,-arm64,-cross-compilation))
* [autotools/qmake](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-macOS)
#### Windows
[](#windows)
* [MSVC 2019 (CMake, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Windows-(MSVC-2019,-64-bit,-static-linkage))
* [MSVC 2019 (qmake, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compiling-with-MSVC-2019-(static-linkage))
* [MSYS2](https://github.com/Chocobo1/qbittorrent_msys2#readme)
[Obsolete compilation guides](https://github.com/qbittorrent/qBittorrent/wiki/Obsolete-compilation-guides)
### Clone this wiki locally