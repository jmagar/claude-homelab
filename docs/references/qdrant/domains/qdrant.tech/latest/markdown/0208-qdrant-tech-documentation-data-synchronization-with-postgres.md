With Postgres - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Data Synchronization](https://qdrant.tech/documentation/data-synchronization/)
*
* With Postgres# Keeping Postgres and Qdrant in Sync
If you&rsquo;ve migrated your vectors to Qdrant but still use Postgres as your source of truth, the next challenge is keeping both systems in sync as data changes.
This guide covers three progressively robust sync architectures — from simple application-level dual-writes to production-grade Change Data Capture — with working code, failure mode analysis, and clear guidance on when to use each.
Not sure if you need a dedicated vector store alongside Postgres? Read our [pgvector tradeoffs blog post](https://qdrant.tech/blog/pgvector-tradeoffs/) to understand the six conditions under which pgvector is sufficient — and when you&rsquo;ll outgrow it.
## Three Tiers of Sync
|Tier|Pattern|Best For|Sync Lag|
|[Tier 1: Dual-Write](#tier-1-application-level-dual-write)|Write to both in request handler|Prototypes, \< 10K records|None (synchronous)|
|[Tier 2: Transactional Outbox](#tier-2-transactional-outbox-pattern)|Outbox table + background worker|Most production apps|Seconds|
|[Tier 3: Change Data Capture](#tier-3-change-data-capture-with-debezium--redpanda)|Debezium + Redpanda/Kafka|High-throughput, multi-consumer|Seconds|
## Choosing Your Tier
These tiers aren&rsquo;t permanent decisions. Start with Tier 1. When you hit its limits — Qdrant outages generating too much drift, write latency becoming noticeable — move to Tier 2. Only when Tier 2 becomes a bottleneck or you need replay capability should you invest in Tier 3.
# Tier 1: Application-Level Dual-Write
> &ldquo;Just do it in your app code&rdquo;
## Architecture
Every CRUD endpoint writes to Postgres first, then to Qdrant, in the same request handler. If the Qdrant write fails, the error is logged but the request succeeds — Postgres is the source of truth, and a reconciliation job can fix drift later.
## The Code
The route handler is exactly what you&rsquo;d expect: one write after the other, with error handling around the Qdrant call:
```
`@router.post("/products", response\_model=ProductResponse, status\_code=201)
async def create\_product(product: ProductCreate):
# 1. Write to Postgres first — it is the source of truth
row = await insert\_product(product.model\_dump())
# 2. Write to Qdrant — non-blocking on failure; reconcile catches drift
try:
await upsert\_product(row)
except Exception as exc:
logger.error("Qdrant upsert failed for %s: %s", product.article\_id, exc)
return row
`
```
The same pattern applies to every mutating operation: Postgres first, Qdrant second, exceptions caught and logged but not re-raised.
## Failure Modes
|Failure|Consequence|Mitigation|
|Qdrant is down|Postgres write succeeds; Qdrant write silently skipped|Logged; `reconcile` fixes drift|
|Qdrant is slow|Request latency spikes (blocks on Qdrant call)|Client has configurable timeout|
|Postgres fails after Qdrant write|Orphaned point in Qdrant|Write Postgres first; `reconcile --fix` cleans up|
|Network partition|Partial writes|Reconciliation script|
## What This Approach Gets Right
The strongest argument for dual-write isn&rsquo;t correctness — it&rsquo;s cognitive simplicity. A new engineer can read this code and immediately understand the entire sync story. There are no background workers, no queues, no separate processes. The request handler is the sync mechanism.
This simplicity has real value for prototypes, internal tools, and early-stage products where iteration speed matters more than operational rigor.
## Where It Falls Apart
The write path is coupled to Qdrant availability. If Qdrant has a hiccup — even a brief one — you&rsquo;re generating drift that has to be cleaned up later. There&rsquo;s no guarantee that every write will reach Qdrant; you&rsquo;re relying on reconciliation to eventually make things right.
More subtly: the request latency includes the Qdrant round-trip. For write-heavy workloads, this becomes a bottleneck.
## When to Use This
* Prototypes and MVPs
* Internal tools where occasional inconsistency is tolerable
* Low write throughput (\< 10K products, \< a few hundred writes/day)
* Teams that want to ship fast and revisit operational concerns later
# Tier 2: Transactional Outbox Pattern
> &ldquo;Never lose a sync event&rdquo;
## Architecture
Instead of writing to Qdrant directly from the request handler, we write an *event* into a `sync\_outbox` table in the **same Postgres transaction** as the product write. A background worker picks up these events and syncs them to Qdrant asynchronously.
The outbox event exists if and only if the product write succeeded. There&rsquo;s no window between the two — they commit atomically.
## The Outbox Table
```
`CREATE TABLE sync\_outbox (
id BIGSERIAL PRIMARY KEY,
entity\_id VARCHAR(20) NOT NULL, -- article\_id
operation VARCHAR(10) NOT NULL, -- 'upsert' | 'delete'
payload JSONB, -- product snapshot at write time
status VARCHAR(20) DEFAULT 'pending',
attempts INT DEFAULT 0,
max\_attempts INT DEFAULT 5,
last\_error TEXT,
created\_at TIMESTAMPTZ DEFAULT NOW(),
processed\_at TIMESTAMPTZ
);
`
```
Note the `payload` column: it stores the full product data at write time. The worker doesn&rsquo;t re-query the products table — by the time it processes an event, the product may have been updated again. The payload is the snapshot that was valid when the event was created.
## The Write Path
Every CRUD endpoint opens a single Postgres transaction that writes both the product and the outbox event:
```
`@router.post("/products", response\_model=ProductResponse, status\_code=201)
async def create\_product(product: ProductCreate):
pool = await get\_pool()
async with pool.acquire() as conn:
async with conn.transaction():
row = await conn.fetchrow(INSERT\_SQL, \*product\_values())
await enqueue\_upsert(conn, product.article\_id, dict(row))
return dict(row)
`
```
`enqueue\_upsert` inserts a row into `sync\_outbox` on the same connection, within the same transaction. If anything fails, both writes roll back together.
The request returns as soon as the Postgres transaction commits. Qdrant isn&rsquo;t touched during request handling.
## The Worker
A background async task processes outbox events in batches. The critical concurrency primitive is `FOR UPDATE SKIP LOCKED` — it lets multiple workers claim events safely without stepping on each other:
```
`async def process\_batch() -\> int:
pool = await get\_pool()
async with pool.acquire() as conn:
rows = await conn.fetch(
"""
UPDATE sync\_outbox
SET status = 'processing', attempts = attempts + 1
WHERE id IN (
SELECT id FROM sync\_outbox
WHERE status IN ('pending', 'failed')
AND attempts \< max\_attempts
ORDER BY created\_at ASC
LIMIT $1
FOR UPDATE SKIP LOCKED
)
RETURNING \*
""",
BATCH\_SIZE,
)
for row in rows:
await \_process\_event(dict(row))
return len(rows)
`
```
Events that fail get their `attempts` counter incremented and their `status` set back to `'pending'` (or `'failed'` if they&rsquo;ve exceeded `max\_attempts`). Qdrant upserts are naturally idempotent by point ID, so duplicate processing is harmless.
## Two Worker Modes
The implementation supports two delivery strategies:
**Polling** (default): the worker wakes up every N seconds, checks for pending events, and processes them. Simple, robust, and doesn&rsquo;t require a persistent database connection.
**LISTEN/NOTIFY**: a Postgres trigger fires `NOTIFY sync\_outbox\_insert` when a new row is inserted. The worker wakes up immediately, giving near-real-time sync without busy-polling:
```
`async def run\_listen\_worker() -\> None:
conn = await asyncpg.connect(dsn)
await conn.execute("LISTEN sync\_outbox\_insert")
while True:
try:
await asyncio.wait\_for(conn.wait\_for\_notify(), timeout=30.0)
except asyncio.TimeoutError:
pass # fall back to sweep anyway
await process\_batch()
`
```
The 30-second sweep fallback is important: if a notification is missed (e.g., the worker was down briefly), the polling fallback ensures nothing stays stuck indefinitely.
## Failure Modes
|Failure|Consequence|Mitigation|
|Qdrant is down|Events queue in `sync\_outbox`|Worker retries with backoff on recovery|
|Worker crashes|Events remain `pending`|Worker picks up on restart; `SKIP LOCKED` prevents double-processing|
|Duplicate processing|Same event processed twice|Qdrant upserts are idempotent by point ID|
|Outbox table grows large|Storage/performance impact|Prune `completed` events older than N days|
## What This Approach Gets Right
The write path is completely decoupled from Qdrant. If Qdrant is down for an hour, writes succeed normally and events queue up. When Qdrant comes back, the worker drains the queue. The application never blocks on Qdrant.
The delivery semantics are clear and enforceable: at-least-once, durable in Postgres, retried until success or `max\_attempts`. Failed events are visible in the database and inspectable with SQL.
You also get a natural sync status endpoint:
```
`@router.get("/sync/status")
async def sync\_status():
return await get\_sync\_status()
# → {"pending": 0, "failed": 0, "avg\_lag\_seconds": 1.2}
`
```
## The Trade-off
You have eventual consistency. There&rsquo;s a window — typically milliseconds to seconds — between when a product is written to Postgres and when it appears in Qdrant search results. For most applications this is perfectly acceptable. For applications where writes must be immediately searchable, this requires a different approach.
You also have a new table to manage: the outbox table grows over time and needs periodic cleanup of completed events.
## When to Use This
* **Most production applications** with moderate write throughput
* When Qdrant availability shouldn&rsquo;t impact your write path
* When you can tolerate seconds of sync lag
* **The recommended default for the majority of production Postgres + Qdrant deployments**
# Tier 3: Change Data Capture with Debezium + Redpanda
> &ldquo;Let Postgres tell Qdrant what changed&rdquo;
## Architecture
CDC is architecturally different from the previous two approaches in a fundamental way: **the application code has no awareness of Qdrant**. The FastAPI routes are pure Postgres CRUD — they don&rsquo;t import the Qdrant client, they don&rsquo;t write to an outbox. Sync is handled entirely in the infrastructure layer.
## How It Works
Postgres&rsquo;s Write-Ahead Log (WAL) is a sequential log of every change to the database — it exists for crash recovery and replication. With `wal\_level = logical`, external consumers can read this log in a structured format.
Debezium connects to Postgres via a logical replication slot and captures every INSERT, UPDATE, and DELETE on the `products` table as a JSON event. These events are published to a Redpanda topic. A Python consumer service reads from that topic and calls Qdrant.
## Postgres Setup
```
`-- Enable in postgresql.conf (or docker-compose command args):
-- wal\_level = logical
-- Create a publication for the products table
CREATE PUBLICATION products\_publication FOR TABLE products;
`
```
## Debezium Connector Config
```
`{
"name": "products-connector",
"config": {
"connector.class": "io.debezium.connector.postgresql.PostgresConnector",
"database.hostname": "postgres",
"database.port": "5432",
"database.user": "debezium",
"database.dbname": "fashiondb",
"database.server.name": "pgserver",
"table.include.list": "public.products",
"plugin.name": "pgoutput",
"publication.name": "products\_publication",
"slot.name": "qdrant\_sync",
"topic.prefix": "pgserver",
"transforms": "unwrap",
"transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
"transforms.unwrap.delete.handling.mode": "rewrite"
}
}
`
```
The `ExtractNewRecordState` transform unwraps Debezium&rsquo;s envelope format into a flat payload, and adds an `\_\_op` field (`c` = create, `u` = update, `d` = delete) so the consumer doesn&rsquo;t have to parse the raw Debezium schema.
## The Consumer Service
```
`from confluent\_kafka import Consumer
def consume\_and\_sync():
consumer = Consumer({
"bootstrap.servers": "redpanda:9092",
"group.id": "qdrant-sync",
"auto.offset.reset": "earliest",
"enable.auto.commit": "false", # manual commit after successful processing
})
consumer.subscribe(["pgserver.public.products"])
while True:
msg = consumer.poll(1.0)
if msg is None:
continue
event = json.loads(msg.value())
op = event.get("\_\_op") # 'c', 'u', or 'd'
if op in ("c", "u"):
upsert\_to\_qdrant(event)
elif op == "d":
delete\_from\_qdrant(event["article\_id"])
consumer.commit() # commit only after successful processing
`
```
Manual offset commits (committing only after successfully processing each message) give you at-least-once semantics: if the consumer crashes mid-message, it reprocesses from the last committed offset on restart.
## Redpanda vs. Kafka
The example uses Redpanda as the event bus. Redpanda is Kafka-wire-protocol-compatible but ships as a single binary with no ZooKeeper dependency — simpler to run. The consumer code is identical whether you point it at Redpanda or Apache Kafka; just change `bootstrap.servers`.
## The Killer Feature: Replaying History
CDC&rsquo;s most underappreciated advantage is replayability. If Qdrant needs to be rebuilt from scratch — new index configuration, migration to a new cluster, disaster recovery — you can do it by replaying the Redpanda topic from the beginning. Every change that ever happened to the products table is recorded in the event stream.
With dual-write (Tier 1) or the outbox (Tier 2), a full rebuild requires running a bulk export from Postgres. With CDC, the event stream *is* the rebuild mechanism.
## Failure Modes
|Failure|Consequence|Mitigation|
|Qdrant is down|Consumer pauses; Redpanda retains events|Consumer retries; resumes from offset on recovery|
|Redpanda is down|Debezium buffers; WAL grows|Monitor WAL size; Redpanda HA with replication in production|
|Debezium crashes|WAL retains changes since last checkpoint|Debezium resumes from replication slot on restart|
|Schema change in Postgres|Connector may need restart|Monitor connector status; test schema migrations in staging|
## The WAL Disk Bloat Problem
One operational hazard specific to CDC: Postgres holds WAL segments until the replication slot consumer acknowledges them. If your consumer is down for a long time, Postgres can accumulate significant disk usage. Monitor replication slot lag:
```
`SELECT
slot\_name,
pg\_size\_pretty(
pg\_wal\_lsn\_diff(pg\_current\_wal\_lsn(), confirmed\_flush\_lsn)
) AS lag
FROM pg\_replication\_slots;
`
```
Set up alerting if this exceeds a few GB. In extreme cases (consumer permanently down), you may need to drop the replication slot — which means re-seeding Qdrant from Postgres rather than from the event stream.
## When to Use This
* High write throughput systems where the outbox table would become a bottleneck
* When multiple downstream consumers need to react to changes (not just Qdrant)
* When application code must be fully decoupled from sync concerns
* Teams with existing Redpanda/Kafka infrastructure
* When replay-from-scratch capability is a requirement
Tier 3 is genuinely powerful, but it comes with real operational costs: Redpanda and Debezium to deploy, configure, monitor, and upgrade. If you&rsquo;re not already running streaming infrastructure, think hard before adding it for a single sync use case. Tier 2 handles most production scenarios with far less complexity.
# The Universal Safety Net: Reconciliation
Every sync architecture drifts eventually. The reconciliation script is what catches the residue:
```
`async def reconcile(fix: bool = False) -\> ReconcileResult:
pg\_ids = set(await get\_all\_article\_ids\_from\_postgres())
qdrant\_ids = set(await get\_all\_point\_ids\_from\_qdrant())
missing\_in\_qdrant = pg\_ids - qdrant\_ids # need to sync
orphaned\_in\_qdrant = qdrant\_ids - pg\_ids # need to delete
if fix:
for article\_id in missing\_in\_qdrant:
product = await get\_product(article\_id)
await upsert\_product(product)
if orphaned\_in\_qdrant:
await qdrant\_client.delete(
collection\_name="products",
points\_selector=orphaned\_in\_qdrant,
)
return ReconcileResult(
postgres\_count=len(pg\_ids),
qdrant\_count=len(qdrant\_ids),
missing\_in\_qdrant=len(missing\_in\_qdrant),
orphaned\_in\_qdrant=len(orphaned\_in\_qdrant),
in\_sync=len(missing\_in\_qdrant) == 0 and len(orphaned\_in\_qdrant) == 0,
)
`
```
Postgres is the source of truth; Qdrant is a derived read store. When they diverge, Postgres wins. Run this on a schedule — nightly is usually sufficient — and on-demand when you suspect drift.
# Comparison Matrix
|Dimension|Tier 1: Dual-Write|Tier 2: Outbox|Tier 3: CDC|
|**Sync complexity**|Low|Medium|High|
|**Extra infrastructure**|None|Outbox table + worker|Redpanda + Debezium + consumer|
|**Consistency model**|Best-effort|At-least-once, eventual|At-least-once, eventual|
|**Write latency impact**|Adds Qdrant round-trip|None (async)|None (async)|
|**Qdrant downtime impact**|Generates drift|Events queue in Postgres|Events queue in Redpanda|
|**Captures direct SQL**|No|No|Yes (all WAL changes)|
|**Replay capability**|No|Limited (outbox retention)|Yes (Redpanda retention)|
|**Operational overhead**|Minimal|Low-Medium|High|
|**Best for**|Prototypes, internal tools|Most production apps|High-throughput, multi-consumer|
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-synchronization/with-postgres.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/data-synchronization/with-postgres/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-synchronization/with-postgres.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)