Security - Memos
[Memos](/)
Search
⌘K
Documentation
[Documentation](/docs)
Getting Started
Deploy
Configuration
[Configuration](/docs/configuration)[Environment Variables](/docs/configuration/environment-variables)[Database](/docs/configuration/database)[Storage](/docs/configuration/storage)[Authentication](/docs/configuration/authentication)[Security](/docs/configuration/security)
Usage
Operations
Development
Integrations
Admin
Troubleshooting
[FAQ](/docs/faq)
[](https://github.com/usememos/memos)
Configuration
# Security
Practical guidance for hardening a Memos deployment.
Memos is self-hosted by design. You control the infrastructure, storage, and access policies.
## [Token security model](#token-security-model)
Three token types handle authentication:
|Token type|Lifetime|Storage|Notes|
|Access token (JWT)|15 minutes|Client memory|Stateless; no DB query needed to verify|
|Refresh token (JWT)|30 days|HTTP-only cookie|Stored in DB, revocable; `SameSite=Lax`, `Secure=true` in production|
|Personal access token|User-defined|SHA-256 hash in DB|Prefix `memos\_pat\_`; plain token shown only once at creation|
The JWT secret is auto-generated as a UUID on first run and stored in the database. In demo mode, the fixed secret `usememos` is used — never deploy demo mode as production.
## [Core recommendations](#core-recommendations)
* set a public instance URL with `MEMOS\_INSTANCE\_URL` when running behind a reverse proxy
* disable user registration if your instance is private
* disable public memo visibility if you do not want any public content
* use HTTPS in front of the instance
* review who can create personal access tokens and who can publish public memos
## [Session and auth hygiene](#session-and-auth-hygiene)
* protect the host admin account carefully
* prefer SSO for team deployments when available
* rotate credentials and tokens that are exposed or no longer needed
* avoid leaving old PATs active indefinitely
* never enable demo mode on a production instance (it uses a hardcoded JWT secret)
## [Reverse proxy requirements](#reverse-proxy-requirements)
Your proxy should:
* terminate TLS
* preserve `Host` and `X-Forwarded-\*` headers
* expose the same public URL configured in `MEMOS\_INSTANCE\_URL`
## [Attachment and sharing considerations](#attachment-and-sharing-considerations)
Security is not only about login. Public memos may expose:
* memo body content
* attached files
* links and references embedded in the memo
Treat visibility and attachment review as part of your security model.
## [Backup and recovery](#backup-and-recovery)
Security is also about recoverability. Keep regular backups of:
* the database
* attachment storage when it is not stored in the database
* deployment configuration needed to recreate the instance
[
Authentication
Configure password login, SSO providers, and API tokens.
](/docs/configuration/authentication)[
Usage
Daily workflows for writing, organizing, and finding memos.
](/docs/usage)
### On this page
[Token security model](#token-security-model)[Core recommendations](#core-recommendations)[Session and auth hygiene](#session-and-auth-hygiene)[Reverse proxy requirements](#reverse-proxy-requirements)[Attachment and sharing considerations](#attachment-and-sharing-considerations)[Backup and recovery](#backup-and-recovery)