Crash Report. 20th+ crash of the day. Crashes every 5-60 min. · Issue #17082 · qbittorrent/qBittorrent · GitHub
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
# Crash Report. 20th+ crash of the day. Crashes every 5-60 min. #17082
New issue
New issue
Open
Open
[Crash Report. 20th+ crash of the day. Crashes every 5-60 min. ](#top)#17082
Labels
[Confirmed bugAn issue confirmed by project team to be considered as a bug](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Confirmed bug">)[Crash](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Crash">)[Libtorrent](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Libtorrent">)[OS: WindowsIssues specific to Windows](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"OS: Windows">)[Proxy/VPNIssues related to the use of proxy/VPN](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Proxy/VPN">)[Waiting upstreamWaiting for changes in dependent libraries](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Waiting upstream">)
[](https://github.com/Quest79)
## Description
[](https://github.com/Quest79)
[Quest79](https://github.com/Quest79)
opened [on May 23, 2022](https://github.com/qbittorrent/qBittorrent/issues/17082#issue-1244487960)
### qBittorrent & operating system versions
qBittorrent version: v4.4.2 (64-bit)
Libtorrent version: 2.0.5.0
Qt version: 5.15.2
Boost version: 1.78.0
OpenSSL version: 1.1.1n
zlib version: 1.2.11
OS version: Windows 10 Version 2009 10.0.22000 x86\_64 (This is windows 11 why is this app reporting windows 10?)
Caught signal: SIGABRT
### What is the problem?
qBittorrent has crashed
Please file a bug report at [http://bugs.qbittorrent.org](http://bugs.qbittorrent.org) and provide the following information:
qBittorrent version: v4.4.2 (64-bit)
Libtorrent version: 2.0.5.0
Qt version: 5.15.2
Boost version: 1.78.0
OpenSSL version: 1.1.1n
zlib version: 1.2.11
OS version: Windows 10 Version 2009 10.0.22000 x86\_64
Caught signal: SIGABRT
```
`# 0 qbittorrent.exe 0x00007ff61e1499ec straceWin::getBacktrace()[ app\\stacktrace\_win.h : 220 ]
# 1 qbittorrent.exe 0x00007ff61e14ab6b sigAbnormalHandler(signum)[ app\\main.cpp : 368 ]
# 2 qbittorrent.exe 0x00007ff61ef7a365 raise(signum)[ minkernel\\crts\\ucrt\\src\\appcrt\\misc\\signal.cpp : 541 ]
# 3 qbittorrent.exe 0x00007ff61ef86a94 abort()[ minkernel\\crts\\ucrt\\src\\appcrt\\startup\\abort.cpp : 64 ]
# 4 qbittorrent.exe 0x00007ff61ef7dd73 terminate()[ minkernel\\crts\\ucrt\\src\\appcrt\\misc\\terminate.cpp : 58 ]
# 5 qbittorrent.exe 0x00007ff61ef551b7 \_\_scrt\_unhandled\_exception\_filter(pointers)[ d:\\agent\\\_work\\1\\s\\src\\vctools\\crt\\vcstartup\\src\\utility\\utility\_desktop.cpp : 91 ]
# 6 KERNELBASE.dll 0x00007ffb5f236391 UnhandledExceptionFilter()
# 7 ntdll.dll 0x00007ffb617aaeec memset()
# 8 ntdll.dll 0x00007ffb61793eb6 \_C\_specific\_handler()
# 9 ntdll.dll 0x00007ffb617a8e4f \_chkstk()
# 10 ntdll.dll 0x00007ffb61735e9a RtlRestoreContext()
# 11 ntdll.dll 0x00007ffb61733163 RtlRaiseException()
# 12 KERNELBASE.dll 0x00007ffb5f13474c RaiseException()
# 13 qbittorrent.exe 0x00007ff61ef73611 \_CxxThrowException(pExceptionObject, pThrowInfo)[ d:\\agent\\\_work\\1\\s\\src\\vctools\\crt\\vcruntime\\src\\eh\\throw.cpp : 129 ]
# 14 qbittorrent.exe 0x00007ff61e14279b boost::throw\_exception(e)[ g:\\qbittorrent\\boost\_1\_78\_0\\boost\\throw\_exception.hpp : 148 ]
# 15 qbittorrent.exe 0x00007ff61e13c8ed boost::asio::detail::do\_throw\_error(err, location)[ g:\\qbittorrent\\boost\_1\_78\_0\\boost\\asio\\detail\\impl\\throw\_error.ipp : 38 ]
# 16 qbittorrent.exe 0x00007ff61e47929e boost::asio::detail::socket\_select\_interrupter::open\_descriptors()[ g:\\qbittorrent\\boost\_1\_78\_0\\boost\\asio\\detail\\impl\\socket\_select\_interrupter.ipp : 66 ]
# 17 qbittorrent.exe 0x00007ff61e479e3e boost::asio::detail::select\_reactor::run(ops, ops)[ g:\\qbittorrent\\boost\_1\_78\_0\\boost\\asio\\detail\\impl\\select\_reactor.ipp : 266 ]
# 18 qbittorrent.exe 0x00007ff61e47a099 boost::asio::detail::select\_reactor::run\_thread()[ g:\\qbittorrent\\boost\_1\_78\_0\\boost\\asio\\detail\\impl\\select\_reactor.ipp : 303 ]
# 19 qbittorrent.exe 0x00007ff61e4126cf boost::asio::detail::win\_thread\_function(arg)[ g:\\qbittorrent\\boost\_1\_78\_0\\boost\\asio\\detail\\impl\\win\_thread.ipp : 119 ]
# 20 qbittorrent.exe 0x00007ff61ef864a0 thread\_start(parameter, parameter)[ minkernel\\crts\\ucrt\\src\\appcrt\\startup\\thread.cpp : 115 ]
# 21 KERNEL32.DLL 0x00007ffb5f9154e0 BaseThreadInitThunk()
# 22 ntdll.dll 0x00007ffb6170485b RtlUserThreadStart()
`
```
### Steps to reproduce
1. Launch app
2. wait 5-30 min
3. another crash
### Additional context
Nothing else on my system network related or otherwise is crashing (online games included). I have a feeling it is crashing every time my wifi is interrupted. So instead of just neatly allowing for sudden connection loss, it just flat out freaks out and dies? A wild guess as I have no other ideas.
This is a fresh (few days old) install of windows 11 22000.
### Log(s) & preferences file(s)
*No response*
## Metadata
## Metadata
### Assignees
No one assigned
### Labels
[Confirmed bugAn issue confirmed by project team to be considered as a bug](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Confirmed bug">)[Crash](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Crash">)[Libtorrent](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Libtorrent">)[OS: WindowsIssues specific to Windows](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"OS: Windows">)[Proxy/VPNIssues related to the use of proxy/VPN](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Proxy/VPN">)[Waiting upstreamWaiting for changes in dependent libraries](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Waiting upstream">)
### Type
No type
### Projects
No projects
### Milestone
No milestone
### Relationships
None yet
### Development
No branches or pull requests
## Issue actions