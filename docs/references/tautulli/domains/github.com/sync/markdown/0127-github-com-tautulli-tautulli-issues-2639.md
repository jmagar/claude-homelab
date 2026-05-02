Tautulli (still) does not work with reverse proxy · Issue #2639 · Tautulli/Tautulli · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
# Tautulli (still) does not work with reverse proxy #2639
New issue
New issue
Open
Open
[Tautulli (still) does not work with reverse proxy](#top)#2639
Labels
[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
[](https://github.com/SR-G)
## Description
[](https://github.com/SR-G)
[SR-G](https://github.com/SR-G)
opened [on Mar 3, 2026](https://github.com/Tautulli/Tautulli/issues/2639#issue-4018911567)
### Describe the Bug
Hello.
Was willing to try Tautulli. Installed it without docker (latest release). Spent literraly hours trying multiple configurations - in the end :
* using https://:8181 works
* using httsp://tautulli.\<domain.local\> does not work at login time
In the second situation, there is an immediate logout.
I tried MANY configuration :
* in config.ini (http\_proxy = 0 or 1, http\_domain = localhost OR real local domain, http\_ip : same, http\_base\_url = blank OR [https://tautulli](https://tautulli).\<domain.local\>
* at caddy reverse proxy level (automated configuration, or manual configuration with extra headers (that should NOT be needed) like
```
`tautulli.\<domain.local\> {
reverse\_proxy \<ip\>:8181 {
header\_up X-Forwarded-For {remote}
header\_up X-Forwarded-Proto {scheme}
header\_up X-Forwarded-Ssl on
header\_up X-Real-IP {remote}
header\_up Host {host}
}
}
`
```
)
NOTHING works.
I'm hosting dozens and dozens of other containers with load balancers : i've never had any issue like this anywhere.
There is definitely something broken in recent tautulli releases.
There is nothing inside logs
```
`2026-03-03 22:47:24 - INFO :: Thread-1 (startup\_refresh) : Tautulli Libraries :: Libraries list refreshed.
2026-03-03 22:47:33 - DEBUG :: CP Server Thread-14 : Tautulli WebAuth :: Admin user '\<REDACTED\>' logged into Tautulli using Plex OAuth login.
2026-03-03 22:47:36 - DEBUG :: CP Server Thread-9 : Tautulli WebAuth :: Admin user '\<REDACTED\>' logged into Tautulli using form login.
2026-03-03 22:47:50 - DEBUG :: CP Server Thread-6 : Tautulli WebAuth :: Admin user '\<REDACTED\>' logged into Tautulli using Plex OAuth login.
`
```
(either with PLEX login, either with local account login : the logins are successufl, but, again, at UI level, nothing is happening).
[](https://private-user-images.githubusercontent.com/194141/557754685-1ac05efc-664c-490d-be74-d5ed8b103662.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0MzQsIm5iZiI6MTc3NzYzMjEzNCwicGF0aCI6Ii8xOTQxNDEvNTU3NzU0Njg1LTFhYzA1ZWZjLTY2NGMtNDkwZC1iZTc0LWQ1ZWQ4YjEwMzY2Mi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwNTAxJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDUwMVQxMDQyMTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03MzJiMzEyMjQzY2E1MDc5MDBhNmJhMWVhZWVmNDE5N2MzYTcwMTA0NGMyMDEzNGU3YTE2MDBhZDk2OTY2Mjk1JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZyZXNwb25zZS1jb250ZW50LXR5cGU9aW1hZ2UlMkZwbmcifQ.-1pokeKNn_4-t5pvWigv2VTN7_BOR9p-fMPwYquL1Rc)
There is nothing displayed in web console.
[](https://private-user-images.githubusercontent.com/194141/557755068-4ecaf58d-0f3f-471f-a8b2-6683959fec07.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0MzQsIm5iZiI6MTc3NzYzMjEzNCwicGF0aCI6Ii8xOTQxNDEvNTU3NzU1MDY4LTRlY2FmNThkLTBmM2YtNDcxZi1hOGIyLTY2ODM5NTlmZWMwNy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwNTAxJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDUwMVQxMDQyMTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02NWQxZWJlNGM2NzYzY2M2MzU0NWRjODlkMmE3NDZiMzFlZjc2ODRlNDk1ZjRmMzBkNTI3MmJmYjBmYTI5YTA3JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZyZXNwb25zZS1jb250ZW50LXR5cGU9aW1hZ2UlMkZwbmcifQ.bBbneMF0Cac5k6JxLIWz-RBQUY1tOqI7bdlL_MZBLmw)
### Steps to Reproduce
*No response*
### Expected Behavior
*No response*
### Screenshots
*No response*
### Relevant Settings
*No response*
### Tautulli Version
v2.16.1
### Git Branch
master
### Git Commit Hash
[0a83704](https://github.com/Tautulli/Tautulli/commit/0a837049c1a62124087cca27f82d96603b75eede)
### Platform and Version
docker
### Python Version
3.11.14 (main, Feb 4 2026, 20:24:25) [GCC 14.2.0]
### Browser and Version
1.87.191 Chromium: 145.0.7632.120 (Build officiel) (64 bits)
### Link to Logs
see description
## Metadata
## Metadata
### Assignees
No one assigned
### Labels
[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
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