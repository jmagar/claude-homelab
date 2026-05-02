Configuration - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Configuration](https://qdrant.tech/documentation/ops-configuration/)
*
* Configuration# Configuration
Qdrant ships with sensible defaults for collection and network settings that are suitable for most use cases. You can view these defaults in the [Qdrant source](https://github.com/qdrant/qdrant/blob/master/config/config.yaml). If you need to customize the settings, you can do so using configuration files and environment variables.
Qdrant Cloud does not allow modifying the Qdrant configuration.## Configuration Files
To customize Qdrant, you can mount your configuration file in any of the following locations. This guide uses `.yaml` files, but Qdrant also supports other formats such as `.toml`, `.json`, and `.ini`.
1. **Main Configuration: `qdrant/config/config.yaml`**
Mount your custom `config.yaml` file to override default settings:
```
`docker run -p 6333:6333 \\
-v $(pwd)/config.yaml:/qdrant/config/config.yaml \\
qdrant/qdrant
`
```
2. **Environment-Specific Configuration: `config/{RUN\_MODE}.yaml`**
Qdrant looks for an environment-specific configuration file based on the `RUN\_MODE` variable. By default, the [official Docker image](https://hub.docker.com/r/qdrant/qdrant) uses `RUN\_MODE=production`, meaning it will look for `config/production.yaml`.
You can override this by setting `RUN\_MODE` to another value (e.g., `dev`), and providing the corresponding file:
```
`docker run -p 6333:6333 \\
-v $(pwd)/dev.yaml:/qdrant/config/dev.yaml \\
-e RUN\_MODE=dev \\
qdrant/qdrant
`
```
3. **Local Configuration: `config/local.yaml`**
The `local.yaml` file is typically used for machine-specific settings that are not tracked in version control:
```
`docker run -p 6333:6333 \\
-v $(pwd)/local.yaml:/qdrant/config/local.yaml \\
qdrant/qdrant
`
```
4. **Custom Configuration via `--config-path`**
You can specify a custom configuration file path using the `--config-path` argument. This will override other configuration files:
```
`docker run -p 6333:6333 \\
-v $(pwd)/config.yaml:/path/to/config.yaml \\
qdrant/qdrant \\
./qdrant --config-path /path/to/config.yaml
`
```
For details on how these configurations are loaded and merged, see the [loading order and priority](#loading-order-and-priority). The full list of available configuration options can be found [below](#configuration-options).
## Environment Variables
You can also configure Qdrant using environment variables, which always take the highest priority and override any file-based settings.
Environment variables follow this format: they should be prefixed with `QDRANT\_\_`, and nested properties should be separated by double underscores (`\_\_`). For example:
```
`docker run -p 6333:6333 \\
-e QDRANT\_\_LOG\_LEVEL=INFO \\
-e QDRANT\_\_SERVICE\_\_API\_KEY=\<MY\_SECRET\_KEY\> \\
-e QDRANT\_\_SERVICE\_\_ENABLE\_TLS=1 \\
-e QDRANT\_\_TLS\_\_CERT=./tls/cert.pem \\
qdrant/qdrant
`
```
This results in the following configuration:
```
`log\_level: INFO
service:
enable\_tls: true
api\_key: \<MY\_SECRET\_KEY\>
tls:
cert: ./tls/cert.pem
`
```
## Loading Order and Priority
During startup, Qdrant merges multiple configuration sources into a single effective configuration. The loading order is as follows (from least to most significant):
1. Embedded default configuration
2. `config/config.yaml`
3. `config/{RUN\_MODE}.yaml`
4. `config/local.yaml`
5. Custom configuration file
6. Environment variables### Overriding Behavior
Settings from later sources in the list override those from earlier sources:
* Settings in `config/{RUN\_MODE}.yaml` (3) will override those in `config/config.yaml` (2).
* A custom configuration file provided via `--config-path` (5) will override all other file-based settings.
* Environment variables (6) have the highest priority and will override any settings from files.## Configuration Validation
Qdrant validates the configuration during startup. If any issues are found, the server will terminate immediately, providing information about the error. For example:
```
`Error: invalid type: 64-bit integer `-1`, expected an unsigned 64-bit or smaller integer for key `storage.hnsw\_index.max\_indexing\_threads` in config/production.yaml
`
```
This ensures that misconfigurations are caught early, preventing Qdrant from running with invalid settings.
## Configuration Options
The following YAML example describes the available configuration options.
```
`log\_level: INFO
# Logging configuration
# Qdrant logs to stdout. You may configure to also write logs to a file on disk.
# Be aware that this file may grow indefinitely.
# logger:
# # Logging format, supports `text` and `json`
# format: text
# on\_disk:
# enabled: true
# log\_file: path/to/log/file.log
# log\_level: INFO
# # Logging format, supports `text` and `json`
# format: text
# buffer\_size\_bytes: 1024
storage:
# Where to store all the data
storage\_path: ./storage
# Where to store snapshots
snapshots\_path: ./snapshots
snapshots\_config:
# "local" or "s3" - where to store snapshots
snapshots\_storage: local
# s3\_config:
# bucket: ""
# region: ""
# access\_key: ""
# secret\_key: ""
# Where to store temporary files
# If null, temporary snapshots are stored in: storage/snapshots\_temp/
temp\_path: null
# If true - point payloads will not be stored in memory.
# It will be read from the disk every time it is requested.
# This setting saves RAM by (slightly) increasing the response time.
# Note: those payload values that are involved in filtering and are indexed - remain in RAM.
#
# Default: true
on\_disk\_payload: true
# Maximum number of concurrent updates to shard replicas
# If `null` - maximum concurrency is used.
update\_concurrency: null
# Write-ahead-log related configuration
wal:
# Size of a single WAL segment
wal\_capacity\_mb: 32
# Number of WAL segments to create ahead of actual data requirement
wal\_segments\_ahead: 0
# Normal node - receives all updates and answers all queries
node\_type: "Normal"
# Listener node - receives all updates, but does not answer search/read queries
# Useful for setting up a dedicated backup node
# node\_type: "Listener"
performance:
# Number of parallel threads used for search operations. If 0 - auto selection.
max\_search\_threads: 0
# CPU budget, how many CPUs (threads) to allocate for an optimization job.
# If 0 - auto selection, keep 1 or more CPUs unallocated depending on CPU size
# If negative - subtract this number of CPUs from the available CPUs.
# If positive - use this exact number of CPUs.
optimizer\_cpu\_budget: 0
# Prevent DDoS of too many concurrent updates in distributed mode.
# One external update usually triggers multiple internal updates, which breaks internal
# timings. For example, the health check timing and consensus timing.
# If null - auto selection.
update\_rate\_limit: null
# Limit for number of incoming automatic shard transfers per collection on this node, does not affect user-requested transfers.
# The same value should be used on all nodes in a cluster.
# Default is to allow 1 transfer.
# If null - allow unlimited transfers.
#incoming\_shard\_transfers\_limit: 1
# Limit for number of outgoing automatic shard transfers per collection on this node, does not affect user-requested transfers.
# The same value should be used on all nodes in a cluster.
# Default is to allow 1 transfer.
# If null - allow unlimited transfers.
#outgoing\_shard\_transfers\_limit: 1
# Enable async scorer which uses io\_uring when rescoring.
# Only supported on Linux, must be enabled in your kernel.
# See: \<https://qdrant.tech/articles/io\_uring/#and-what-about-qdrant\>
#async\_scorer: false
# Maximum number of collections to load concurrently.
#max\_concurrent\_collection\_loads: 1
# Maximum number of local shards to load concurrently when loading a collection.
#max\_concurrent\_shard\_loads: 1
# Maximum number of segments to load concurrently when loading a local shard.
#max\_concurrent\_segment\_loads: 8
optimizers:
# The minimal fraction of deleted vectors in a segment, required to perform segment optimization
deleted\_threshold: 0.2
# The minimal number of vectors in a segment, required to perform segment optimization
vacuum\_min\_vector\_number: 1000
# Target amount of segments optimizer will try to keep.
# Real amount of segments may vary depending on multiple parameters:
# - Amount of stored points
# - Current write RPS
#
# It is recommended to select default number of segments as a factor of the number of search threads,
# so that each segment would be handled evenly by one of the threads.
# If `default\_segment\_number = 0`, will be automatically selected by the number of available CPUs
default\_segment\_number: 0
# Do not create segments larger this size (in KiloBytes).
# Large segments might require disproportionately long indexation times,
# therefore it makes sense to limit the size of segments.
#
# If indexation speed have more priority for your - make this parameter lower.
# If search speed is more important - make this parameter higher.
# Note: 1Kb = 1 vector of size 256
# If not set, will be automatically selected considering the number of available CPUs.
max\_segment\_size\_kb: null
# Maximum size (in KiloBytes) of vectors allowed for plain index.
# Default value based on experiments and observations.
# Note: 1Kb = 1 vector of size 256
# To explicitly disable vector indexing, set to `0`.
# If not set, the default value will be used.
indexing\_threshold\_kb: 10000
# Interval between forced flushes.
flush\_interval\_sec: 5
# Max number of threads (jobs) for running optimizations per shard.
# Note: each optimization job will also use `max\_indexing\_threads` threads by itself for index building.
# If null - have no limit and choose dynamically to saturate CPU.
# If 0 - no optimization threads, optimizations will be disabled.
max\_optimization\_threads: null
# This section has the same options as 'optimizers' above. All values specified here will overwrite the collections
# optimizers configs regardless of the config above and the options specified at collection creation.
#optimizers\_overwrite:
# deleted\_threshold: 0.2
# vacuum\_min\_vector\_number: 1000
# default\_segment\_number: 0
# max\_segment\_size\_kb: null
# indexing\_threshold\_kb: 10000
# flush\_interval\_sec: 5
# max\_optimization\_threads: null
# Default parameters of HNSW Index. Could be overridden for each collection or named vector individually
hnsw\_index:
# Number of edges per node in the index graph. Larger the value - more accurate the search, more space required.
m: 16
# Number of neighbours to consider during the index building. Larger the value - more accurate the search, more time required to build index.
ef\_construct: 100
# Minimal size threshold (in KiloBytes) below which full-scan is preferred over HNSW search.
# This measures the total size of vectors being queried against.
# When the maximum estimated amount of points that a condition satisfies is smaller than
# `full\_scan\_threshold\_kb`, the query planner will use full-scan search instead of HNSW index
# traversal for better performance.
# Note: 1Kb = 1 vector of size 256
full\_scan\_threshold\_kb: 10000
# Number of parallel threads used for background index building.
# If 0 - automatically select.
# Best to keep between 8 and 16 to prevent likelihood of building broken/inefficient HNSW graphs.
# On small CPUs, less threads are used.
max\_indexing\_threads: 0
# Store HNSW index on disk. If set to false, index will be stored in RAM. Default: false
on\_disk: false
# Custom M param for hnsw graph built for payload index. If not set, default M will be used.
payload\_m: null
# Default shard transfer method to use if none is defined.
# If null - don't have a shard transfer preference, choose automatically.
# If stream\_records, snapshot or wal\_delta - prefer this specific method.
# More info: https://qdrant.tech/documentation/distributed\_deployment/#shard-transfer-method
shard\_transfer\_method: null
# Default parameters for collections
collection:
# Number of replicas of each shard that network tries to maintain
replication\_factor: 1
# How many replicas should apply the operation for us to consider it successful
write\_consistency\_factor: 1
# Default parameters for vectors.
vectors:
# Whether vectors should be stored in memory or on disk.
on\_disk: null
# shard\_number\_per\_node: 1
# Default quantization configuration.
# More info: https://qdrant.tech/documentation/manage-data/quantization
quantization: null
# Default strict mode parameters for newly created collections.
#strict\_mode:
# Whether strict mode is enabled for a collection or not.
#enabled: false
# Max allowed `limit` parameter for all APIs that don't have their own max limit.
#max\_query\_limit: null
# Max allowed `timeout` parameter.
#max\_timeout: null
# Allow usage of unindexed fields in retrieval based (eg. search) filters.
#unindexed\_filtering\_retrieve: null
# Allow usage of unindexed fields in filtered updates (eg. delete by payload).
#unindexed\_filtering\_update: null
# Max HNSW value allowed in search parameters.
#search\_max\_hnsw\_ef: null
# Whether exact search is allowed or not.
#search\_allow\_exact: null
# Max oversampling value allowed in search.
#search\_max\_oversampling: null
# Maximum number of collections allowed to be created
# If null - no limit.
max\_collections: null
service:
# Maximum size of POST data in a single request in megabytes
max\_request\_size\_mb: 32
# Number of parallel workers used for serving the api. If 0 - equal to the number of available cores.
# If missing - Same as storage.max\_search\_threads
max\_workers: 0
# Host to bind the service on
host: 0.0.0.0
# HTTP(S) port to bind the service on
http\_port: 6333
# gRPC port to bind the service on.
# If `null` - gRPC is disabled. Default: null
# Comment to disable gRPC:
grpc\_port: 6334
# Enable CORS headers in REST API.
# If enabled, browsers would be allowed to query REST endpoints regardless of query origin.
# More info: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
# Default: true
enable\_cors: true
# Enable HTTPS for the REST and gRPC API
enable\_tls: false
# Check user HTTPS client certificate against CA file specified in tls config
verify\_https\_client\_certificate: false
# Set an api-key.
# If set, all requests must include a header with the api-key.
# example header: `api-key: \<API-KEY\>`
#
# If you enable this you should also enable TLS.
# (Either above or via an external service like nginx.)
# Sending an api-key over an unencrypted channel is insecure.
#
# Uncomment to enable.
# api\_key: your\_secret\_api\_key\_here
# Set an api-key for read-only operations.
# If set, all requests must include a header with the api-key.
# example header: `api-key: \<API-KEY\>`
#
# If you enable this you should also enable TLS.
# (Either above or via an external service like nginx.)
# Sending an api-key over an unencrypted channel is insecure.
#
# Uncomment to enable.
# read\_only\_api\_key: your\_secret\_read\_only\_api\_key\_here
# Uncomment to enable JWT Role Based Access Control (RBAC).
# If enabled, you can generate JWT tokens with fine-grained rules for access control.
# Use generated token instead of API key.
#
# jwt\_rbac: true
# Hardware reporting adds information to the API responses with a
# hint on how many resources were used to execute the request.
#
# Warning: experimental, this feature is still under development and is not supported yet.
#
# Uncomment to enable.
# hardware\_reporting: true
#
# Uncomment to enable.
# Prefix for the names of metrics in the /metrics API.
# metrics\_prefix: qdrant\_
cluster:
# Use `enabled: true` to run Qdrant in distributed deployment mode
enabled: false
# Configuration of the inter-cluster communication
p2p:
# Port for internal communication between peers
port: 6335
# Use TLS for communication between peers
enable\_tls: false
# Configuration related to distributed consensus algorithm
consensus:
# How frequently peers should ping each other.
# Setting this parameter to lower value will allow consensus
# to detect disconnected nodes earlier, but too frequent
# tick period may create significant network and CPU overhead.
# We encourage you NOT to change this parameter unless you know what you are doing.
tick\_period\_ms: 100
# Compact consensus operations once we have this amount of applied
# operations. Allows peers to join quickly with a consensus snapshot without
# replaying a huge amount of operations.
# If 0 - disable compaction
compact\_wal\_entries: 128
# Set to true to prevent service from sending usage statistics to the developers.
# Read more: https://qdrant.tech/documentation/ops-configuration/usage-statistics
telemetry\_disabled: false
# TLS configuration.
# Required if either service.enable\_tls or cluster.p2p.enable\_tls is true.
tls:
# Server certificate chain file
cert: ./tls/cert.pem
# Server private key file
key: ./tls/key.pem
# Certificate authority certificate file.
# This certificate will be used to validate the certificates
# presented by other nodes during inter-cluster communication.
#
# If verify\_https\_client\_certificate is true, it will verify
# HTTPS client certificate
#
# Required if cluster.p2p.enable\_tls is true.
ca\_cert: ./tls/cacert.pem
# TTL in seconds to reload certificate from disk, useful for certificate rotations.
# Only works for HTTPS endpoints. Does not support gRPC (and intra-cluster communication).
# If `null` - TTL is disabled.
cert\_ttl: 3600
# Audit logging configuration.
# When enabled, Qdrant writes structured JSON audit log entries for every
# access-checked API request.
#
# audit:
# enabled: false
# dir: ./storage/audit
# rotation: daily
# max\_log\_files: 7
# # If true, use X-Forwarded-For header to determine client IP in audit logs.
# # Only enable this when running behind a trusted reverse proxy or load balancer.
# # WARNING: Enabling this without a trusted proxy allows clients to spoof their IP.
# # Default: false
# trust\_forwarded\_headers: false
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/ops-configuration/configuration.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/ops-configuration/configuration/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/ops-configuration/configuration.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)