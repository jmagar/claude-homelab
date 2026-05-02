Storage Backends - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/v2/getting-started/welcome)
* [
Installation
](/v2/getting-started/installation)
* [
Quickstart
](/v2/getting-started/quickstart)
* [
Updates
NEW
](/v2/updates)
##### Servers
* [
Overview
](/v2/servers/server)
*
Core Components
*
Advanced Features
* [
Composition
](/v2/servers/composition)
* [
Context
](/v2/servers/context)
* [
Elicitation
NEW
](/v2/servers/elicitation)
* [
Icons
NEW
](/v2/servers/icons)
* [
Logging
](/v2/servers/logging)
* [
Middleware
NEW
](/v2/servers/middleware)
* [
Progress
](/v2/servers/progress)
* [
Proxy Servers
](/v2/servers/proxy)
* [
Sampling
NEW
](/v2/servers/sampling)
* [
Storage Backends
NEW
](/v2/servers/storage-backends)
* [
Background Tasks
NEW
](/v2/servers/tasks)
*
Authentication
*
Deployment
##### Clients
*
Essentials
*
Core Operations
*
Advanced Features
*
Authentication
##### Integrations
*
Authentication
*
Authorization
*
AI Assistants
*
AI SDKs
*
API Integration
##### Patterns
* [
Tool Transformation
](/v2/patterns/tool-transformation)
* [
Decorating Methods
](/v2/patterns/decorating-methods)
* [
CLI
](/v2/patterns/cli)
* [
Contrib Modules
](/v2/patterns/contrib)
* [
Testing
](/v2/patterns/testing)
##### Development
* [
Contributing
](/v2/development/contributing)
* [
Tests
](/v2/development/tests)
* [
Releases
](/v2/development/releases)
* [
Upgrade Guide
NEW
](/v2/development/upgrade-guide)
* [
Changelog
](/v2/changelog)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
New in version `2.13.0`
FastMCP uses pluggable storage backends for caching responses and managing OAuth state. By default, all storage is in-memory, which is perfect for development but doesn’t persist across restarts. FastMCP includes support for multiple storage backends, and you can easily extend it with custom implementations.
The storage layer is powered by **[py-key-value-aio](https://github.com/strawgate/py-key-value)**, an async key-value library maintained by a core FastMCP maintainer. This library provides a unified interface for multiple backends, making it easy to swap implementations based on your deployment needs.
##
[​
](#available-backends)
Available Backends
###
[​
](#in-memory-storage)
In-Memory Storage
**Best for:** Development, testing, single-process deployments
In-memory storage is the default for all FastMCP storage needs. It’s fast, requires no setup, and is perfect for getting started.
```
`from key\_value.aio.stores.memory import MemoryStore
# Used by default - no configuration needed
# But you can also be explicit:
cache\_store = MemoryStore()
`
```
**Characteristics:**
* ✅ No setup required
* ✅ Very fast
* ❌ Data lost on restart
* ❌ Not suitable for multi-process deployments
###
[​
](#disk-storage)
Disk Storage
**Best for:** Single-server production deployments, persistent caching
Disk storage persists data to the filesystem, allowing it to survive server restarts.
```
`from key\_value.aio.stores.disk import DiskStore
from fastmcp.server.middleware.caching import ResponseCachingMiddleware
# Persistent response cache
middleware = ResponseCachingMiddleware(
cache\_storage=DiskStore(directory="/var/cache/fastmcp")
)
`
```
Or with OAuth token storage:
```
`from fastmcp.server.auth.providers.github import GitHubProvider
from key\_value.aio.stores.disk import DiskStore
auth = GitHubProvider(
client\_id="your-id",
client\_secret="your-secret",
base\_url="https://your-server.com",
client\_storage=DiskStore(directory="/var/lib/fastmcp/oauth")
)
`
```
**Characteristics:**
* ✅ Data persists across restarts
* ✅ Good performance for moderate load
* ❌ Not suitable for distributed deployments
* ❌ Filesystem access required
###
[​
](#redis)
Redis
**Best for:** Distributed production deployments, shared caching across multiple servers
Redis support requires an optional dependency: `pip install 'py-key-value-aio[redis]'`
Redis provides distributed caching and state management, ideal for production deployments with multiple server instances.
```
`from key\_value.aio.stores.redis import RedisStore
from fastmcp.server.middleware.caching import ResponseCachingMiddleware
# Distributed response cache
middleware = ResponseCachingMiddleware(
cache\_storage=RedisStore(host="redis.example.com", port=6379)
)
`
```
With authentication:
```
`from key\_value.aio.stores.redis import RedisStore
cache\_store = RedisStore(
host="redis.example.com",
port=6379,
password="your-redis-password"
)
`
```
For OAuth token storage:
```
`import os
from fastmcp.server.auth.providers.github import GitHubProvider
from key\_value.aio.stores.redis import RedisStore
auth = GitHubProvider(
client\_id=os.environ["GITHUB\_CLIENT\_ID"],
client\_secret=os.environ["GITHUB\_CLIENT\_SECRET"],
base\_url="https://your-server.com",
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
client\_storage=RedisStore(host="redis.example.com", port=6379)
)
`
```
**Characteristics:**
* ✅ Distributed and highly available
* ✅ Fast in-memory performance
* ✅ Works across multiple server instances
* ✅ Built-in TTL support
* ❌ Requires Redis infrastructure
* ❌ Network latency vs local storage
###
[​
](#other-backends-from-py-key-value-aio)
Other Backends from py-key-value-aio
The py-key-value-aio library includes additional implementations for various storage systems:
* **DynamoDB** - AWS distributed database
* **MongoDB** - NoSQL document store
* **Elasticsearch** - Distributed search and analytics
* **Memcached** - Distributed memory caching
* **RocksDB** - Embedded high-performance key-value store
* **Valkey** - Redis-compatible server
For configuration details on these backends, consult the [py-key-value-aio documentation](https://github.com/strawgate/py-key-value).
Before using these backends in production, review the [py-key-value documentation](https://github.com/strawgate/py-key-value) to understand the maturity level and limitations of your chosen backend. Some backends may be in preview or have specific constraints that make them unsuitable for production use.
##
[​
](#use-cases-in-fastmcp)
Use Cases in FastMCP
###
[​
](#server-side-oauth-token-storage)
Server-Side OAuth Token Storage
The [OAuth Proxy](/v2/servers/auth/oauth-proxy) and OAuth auth providers use storage for persisting OAuth client registrations and upstream tokens. **By default, storage is automatically encrypted using `FernetEncryptionWrapper`.** When providing custom storage, wrap it in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest.
**Development (default behavior):**
By default, FastMCP automatically manages keys and storage based on your platform:
* **Mac/Windows**: Keys are auto-managed via system keyring, storage defaults to disk. Suitable **only** for development and local testing.
* **Linux**: Keys are ephemeral, storage defaults to memory.
No configuration needed:
```
`from fastmcp.server.auth.providers.github import GitHubProvider
auth = GitHubProvider(
client\_id="your-id",
client\_secret="your-secret",
base\_url="https://your-server.com"
)
`
```
**Production:**
For production deployments, configure explicit keys and persistent network-accessible storage with encryption:
```
`import os
from fastmcp.server.auth.providers.github import GitHubProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
auth = GitHubProvider(
client\_id=os.environ["GITHUB\_CLIENT\_ID"],
client\_secret=os.environ["GITHUB\_CLIENT\_SECRET"],
base\_url="https://your-server.com",
# Explicit JWT signing key (required for production)
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
# Encrypted persistent storage (required for production)
client\_storage=FernetEncryptionWrapper(
key\_value=RedisStore(host="redis.example.com", port=6379),
fernet=Fernet(os.environ["STORAGE\_ENCRYPTION\_KEY"])
)
)
`
```
Both parameters are required for production. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. See [OAuth Token Security](/v2/deployment/http#oauth-token-security) and [Key and Storage Management](/v2/servers/auth/oauth-proxy#key-and-storage-management) for complete setup details.
###
[​
](#response-caching-middleware)
Response Caching Middleware
The [Response Caching Middleware](/v2/servers/middleware#caching-middleware) caches tool calls, resource reads, and prompt requests. Storage configuration is passed via the `cache\_storage` parameter:
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.caching import ResponseCachingMiddleware
from key\_value.aio.stores.disk import DiskStore
mcp = FastMCP("My Server")
# Cache to disk instead of memory
mcp.add\_middleware(ResponseCachingMiddleware(
cache\_storage=DiskStore(directory="cache")
))
`
```
For multi-server deployments sharing a Redis instance:
```
`from fastmcp.server.middleware.caching import ResponseCachingMiddleware
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.prefix\_collections import PrefixCollectionsWrapper
base\_store = RedisStore(host="redis.example.com")
namespaced\_store = PrefixCollectionsWrapper(
key\_value=base\_store,
prefix="my-server"
)
middleware = ResponseCachingMiddleware(cache\_storage=namespaced\_store)
`
```
###
[​
](#client-side-oauth-token-storage)
Client-Side OAuth Token Storage
The [FastMCP Client](/v2/clients/client) uses storage for persisting OAuth tokens locally. By default, tokens are stored in memory:
```
`from fastmcp.client.auth import OAuthClientProvider
from key\_value.aio.stores.disk import DiskStore
# Store tokens on disk for persistence across restarts
token\_storage = DiskStore(directory="\~/.local/share/fastmcp/tokens")
oauth\_provider = OAuthClientProvider(
mcp\_url="https://your-mcp-server.com/mcp/sse",
token\_storage=token\_storage
)
`
```
This allows clients to reconnect without re-authenticating after restarts.
##
[​
](#choosing-a-backend)
Choosing a Backend
|Backend|Development|Single Server|Multi-Server|Cloud Native|
|Memory|✅ Best|⚠️ Limited|❌|❌|
|Disk|✅ Good|✅ Recommended|❌|⚠️|
|Redis|⚠️ Overkill|✅ Good|✅ Best|✅ Best|
|DynamoDB|❌|⚠️|✅|✅ Best (AWS)|
|MongoDB|❌|⚠️|✅|✅ Good|
**Decision tree:**
1. **Just starting?** Use **Memory** (default) - no configuration needed
2. **Single server, needs persistence?** Use **Disk**
3. **Multiple servers or cloud deployment?** Use **Redis** or **DynamoDB**
4. **Existing infrastructure?** Look for a matching py-key-value-aio backend
##
[​
](#more-resources)
More Resources
* [py-key-value-aio GitHub](https://github.com/strawgate/py-key-value) - Full library documentation
* [Response Caching Middleware](/v2/servers/middleware#caching-middleware) - Using storage for caching
* [OAuth Token Security](/v2/deployment/http#oauth-token-security) - Production OAuth configuration
* [HTTP Deployment](/v2/deployment/http) - Complete deployment guide