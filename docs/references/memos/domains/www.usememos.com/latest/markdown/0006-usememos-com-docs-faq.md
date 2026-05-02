FAQ - Memos
[Memos](/)
Search
⌘K
Documentation
[Documentation](/docs)
Getting Started
Deploy
Configuration
Usage
Operations
Development
Integrations
Admin
Troubleshooting
[FAQ](/docs/faq)
[](https://github.com/usememos/memos)
# FAQ
Common questions about running and using Memos.
## [Is Memos open source?](#is-memos-open-source)
Yes. Memos is released under the MIT License.
## [Where is my data stored?](#where-is-my-data-stored)
Data is stored in your own database. Attachments can live in the database, on the local filesystem, or in S3-compatible storage.
## [Does Memos have an API?](#does-memos-have-an-api)
Yes. Memos provides REST and gRPC APIs. See the [API reference](/docs/api).
## [Is there a demo?](#is-there-a-demo)
Yes. You can try the live demo at [https://demo.usememos.com](https://demo.usememos.com).
## [What is the easiest way to run it?](#what-is-the-easiest-way-to-run-it)
For most users, Docker with a mounted data directory is the fastest and simplest starting point.
## [Should I use SQLite or MySQL/PostgreSQL?](#should-i-use-sqlite-or-mysqlpostgresql)
SQLite is a strong default for a single-instance deployment. Use MySQL or PostgreSQL when you want an external managed database or more operational flexibility.
## [Can I disable public memos?](#can-i-disable-public-memos)
Yes. If your instance is private, disabling public visibility is a sensible default.
[
Common Issues
Common startup, storage, database, and proxy problems.
](/docs/troubleshooting/common-issues)
### On this page
[Is Memos open source?](#is-memos-open-source)[Where is my data stored?](#where-is-my-data-stored)[Does Memos have an API?](#does-memos-have-an-api)[Is there a demo?](#is-there-a-demo)[What is the easiest way to run it?](#what-is-the-easiest-way-to-run-it)[Should I use SQLite or MySQL/PostgreSQL?](#should-i-use-sqlite-or-mysqlpostgresql)[Can I disable public memos?](#can-i-disable-public-memos)