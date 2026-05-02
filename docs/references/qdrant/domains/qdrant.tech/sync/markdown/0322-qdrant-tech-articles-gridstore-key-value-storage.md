Introducing Gridstore: Qdrant's Custom Key-Value Store
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Introducing Gridstore: Qdrant's Custom Key-Value Store
[
Back to
Qdrant Internals](https://qdrant.tech/articles/qdrant-internals/)# Introducing Gridstore: Qdrant's Custom Key-Value Store
Luis Cossio, Arnaud Gourlay & David Myriel
&#183;
February 05, 2025
## Why We Built Our Own Storage Engine
Databases need a place to store and retrieve data. That’s what Qdrant&rsquo;s [**key-value storage**](https://en.wikipedia.org/wiki/Key–value_database) does—it links keys to values.
When we started building Qdrant, we needed to pick something ready for the task. So we chose [**RocksDB**](https://rocksdb.org) as our embedded key-value store.
It is mature, reliable, and well-documented.
Over time, we ran into issues. Its architecture required compaction (uses [LSMT](https://en.wikipedia.org/wiki/Log-structured_merge-tree)), which caused random latency spikes. It handles generic keys, while we only use it for sequential IDs. Having lots of configuration options makes it versatile, but accurately tuning it was a headache. Finally, interoperating with C++ slowed us down (although we will still support it for quite some time 😭).
While there are already some good options written in Rust that we could leverage, we needed something custom. Nothing out there fit our needs in the way we wanted. We didn’t require generic keys. We wanted full control over when and which data was written and flushed. Our system already has crash recovery mechanisms built-in. Online compaction isn’t a priority, we already have optimizers for that. Debugging misconfigurations was not a great use of our time.
So we built our own storage. As of [**Qdrant Version 1.13**](https://qdrant.tech/blog/qdrant-1.13.x/), we are using Gridstore for **payload and sparse vector storages**.
Simple, efficient, and designed just for Qdrant.
#### In this article, you’ll learn about:
* **How Gridstore works** – a deep dive into its architecture and mechanics.
* **Why we built it this way** – the key design decisions that shaped it.
* **Rigorous testing** – how we ensured the new storage is production-ready.
* **Performance benchmarks** – official metrics that demonstrate its efficiency.
**Our first challenge?** Figuring out the best way to handle sequential keys and variable-sized data.
## Gridstore Architecture: Three Main Components
Gridstore’s architecture is built around three key components that enable fast lookups and efficient space management:
|Component|Description|
|The Data Layer|Stores values in fixed-sized blocks and retrieves them using a pointer-based lookup system.|
|The Mask Layer|Uses a bitmask to track which blocks are in use and which are available.|
|The Gaps Layer|Manages block availability at a higher level, allowing for quick space allocation.|
### 1. The Data Layer for Fast Retrieval
At the core of Gridstore is **The Data Layer**, which is designed to store and retrieve values quickly based on their keys. This layer allows us to do efficient reads and lets us store variable-sized data. The main two components of this layer are **The Tracker** and **The Data Grid**.
Since internal IDs are always sequential integers (0, 1, 2, 3, 4, &mldr;), the tracker is an array of pointers, where each pointer tells the system exactly where a value starts and how long it is.
The Data Layer uses an array of pointers to quickly retrieve data.
This makes lookups incredibly fast. For example, finding key 3 is just a matter of jumping to the third position in the tracker, and following the pointer to find the value in the data grid.
However, because values are of variable size, the data itself is stored separately in a grid of fixed-sized blocks, which are grouped into larger page files. The fixed size of each block is usually 128 bytes. When inserting a value, Gridstore allocates one or more consecutive blocks to store it, ensuring that each block only holds data from a single value.
### 2. The Mask Layer Reuses Space
**The Mask Layer** helps Gridstore handle updates and deletions without the need for expensive data compaction. Instead of maintaining complex metadata for each block, Gridstore tracks usage with a bitmask, where each bit represents a block, with 1 for used, 0 for free.
The bitmask efficiently tracks block usage.
This makes it easy to determine where new values can be written. When a value is removed, it gets soft-deleted at its pointer, and the corresponding blocks in the bitmask are marked as available. Similarly, when updating a value, the new version is written elsewhere, and the old blocks are freed at the bitmask.
This approach ensures that Gridstore doesn’t waste space. As the storage grows, however, scanning for available blocks in the entire bitmask can become computationally expensive.
### 3. The Gaps Layer for Effective Updates
To further optimize update handling, Gridstore introduces **The Gaps Layer**, which provides a higher-level view of block availability.
Instead of scanning the entire bitmask, Gridstore splits the bitmask into regions and keeps track of the largest contiguous free space within each region, known as **The Region Gap**. By also storing the leading and trailing gaps of each region, the system can efficiently combine multiple regions when needed for storing large values.
The complete architecture of Gridstore
This layered approach allows Gridstore to locate available space quickly, scaling down the work required for scans while keeping memory overhead minimal. With this system, finding storage space for new values requires scanning only a tiny fraction of the total metadata, making updates and insertions highly efficient, even in large segments.
Given the default configuration, the gaps layer is scoped out in a millionth fraction of the actual storage size. This means that for each 1GB of data, the gaps layer only requires scanning 6KB of metadata. With this mechanism, the other operations can be executed in virtually constant-time complexity.
## Gridstore in Production: Maintaining Data Integrity
Gridstore’s architecture introduces multiple interdependent structures that must remain in sync to ensure data integrity:
* **The Data Layer** holds the data and associates each key with its location in storage, including page ID, block offset, and the size of its value.
* **The Mask Layer** keeps track of which blocks are occupied and which are free.
* **The Gaps Layer** provides an indexed view of free blocks for efficient space allocation.
Every time a new value is inserted or an existing value is updated, all these components need to be modified in a coordinated way.
### When Things Break in Real Life
Real-world systems don’t operate in a vacuum. Failures happen: software bugs cause unexpected crashes, memory exhaustion forces processes to terminate, disks fail to persist data reliably, and power losses can interrupt operations at any moment.
*The critical question is: what happens if a failure occurs while updating these structures?*
If one component is updated but another isn’t, the entire system could become inconsistent. Worse, if an operation is only partially written to disk, it could lead to orphaned data, unusable space, or even data corruption.
### Stability Through Idempotency: Recovering With WAL
To guard against these risks, Qdrant relies on a [**Write-Ahead Log (WAL)**](https://qdrant.tech/documentation/manage-data/storage/). Before committing an operation, Qdrant ensures that it is at least recorded in the WAL. If a crash happens before all updates are flushed, the system can safely replay operations from the log.
This recovery mechanism introduces another essential property: [**idempotence**](https://en.wikipedia.org/wiki/Idempotence).
The storage system must be designed so that reapplying the same operation after a failure leads to the same final state as if the operation had been applied just once.
### The Grand Solution: Lazy Updates
To achieve this, **Gridstore completes updates lazily**, prioritizing the most critical part of the write: the data itself.
||
|👉 Instead of immediately updating all metadata structures, it writes the new value first while keeping lightweight pending changes in a buffer.|
|👉 The system only finalizes these updates when explicitly requested, ensuring that a crash never results in marking data as deleted before the update has been safely persisted.|
|👉 In the worst-case scenario, Gridstore may need to write the same data twice, leading to a minor space overhead, but it will never corrupt the storage by overwriting valid data.|
## How We Tested the Final Product
### First&mldr; Model Testing
Gridstore can be tested efficiently using model testing, which compares its behavior to a simple in-memory hash map. Since Gridstore should function like a persisted hash map, this method quickly detects inconsistencies.
The process is straightforward:
1. Initialize a Gridstore instance and an empty hash map.
2. Run random operations (put, delete, update) on both.
3. Verify that results match after each operation.
4. Compare all keys and values to ensure consistency.
This approach provides high test coverage, exposing issues like incorrect persistence or faulty deletions. Running large-scale model tests ensures Gridstore remains reliable in real-world use.
Here is a naive way to generate operations in Rust.
```
`
enum Operation {
Put(PointOffset, Payload),
Delete(PointOffset),
Update(PointOffset, Payload),
}
impl Operation {
fn random(rng: &mut impl Rng, max\_point\_offset: u32) -\> Self {
let point\_offset = rng.random\_range(0..=max\_point\_offset);
let operation = rng.gen\_range(0..3);
match operation {
0 =\> {
let size\_factor = rng.random\_range(1..10);
let payload = random\_payload(rng, size\_factor);
Operation::Put(point\_offset, payload)
}
1 =\> Operation::Delete(point\_offset),
2 =\> {
let size\_factor = rng.random\_range(1..10);
let payload = random\_payload(rng, size\_factor);
Operation::Update(point\_offset, payload)
}
\_ =\> unreachable!(),
}
}
}
`
```
Model testing is a high-value way to catch bugs, especially when your system mimics a well-defined component like a hash map. If your component behaves the same as another one, using model testing brings a lot of value for a bit of effort.
We could have tested against RocksDB, but simplicity matters more. A simple hash map lets us run massive test sequences quickly, exposing issues faster.
For even sharper debugging, Property-Based Testing adds automated test generation and shrinking. It pinpoints failures with minimalized test cases, making bug hunting faster and more effective.
### Crash Testing: Can Gridstore Handle the Pressure?
Designing for crash resilience is one thing, and proving it works under stress is another. To push Qdrant’s data integrity to the limit, we built [**Crasher**](https://github.com/qdrant/crasher), a test bench that brutally kills and restarts Qdrant while it handles a heavy update workload.
Crasher runs a loop that continuously writes data, then randomly crashes Qdrant. On each restart, Qdrant replays its [**Write-Ahead Log (WAL)**](https://qdrant.tech/documentation/manage-data/storage/), and we verify if data integrity holds. Possible anomalies include:
* Missing data (points, vectors, or payloads)
* Corrupt payload values
This aggressive yet simple approach has uncovered real-world issues when run for extended periods. While we also use chaos testing for distributed setups, Crasher excels at fast, repeatable failure testing in a local environment.
## Testing Gridstore Performance: Benchmarks
To measure the impact of our new storage engine, we used [**Bustle, a key-value storage benchmarking framework**](https://github.com/jonhoo/bustle), to compare Gridstore against RocksDB. We tested three workloads:
|Workload Type|Operation Distribution|
|Read-heavy|95% reads|
|Insert-heavy|80% inserts|
|Update-heavy|50% updates|
#### The results speak for themselves:
Average latency for all kinds of workloads is lower across the board, particularly for inserts.
This shows a clear boost in performance. As we can see, the investment in Gridstore is paying off.
### End-to-End Benchmarking
Now, let’s test the impact on a real Qdrant instance. So far, we’ve only integrated Gridstore for [**payloads**](https://qdrant.tech/documentation/manage-data/payload/) and [**sparse vectors**](https://qdrant.tech/documentation/manage-data/vectors/#sparse-vectors), but even this partial switch should show noticeable improvements.
For benchmarking, we used our in-house [**bfb tool**](https://github.com/qdrant/bfb) to generate a workload. Our configuration:
```
`bfb -n 2000000 --max-id 1000000 \\
--sparse-vectors 0.02 \\
--set-payload \\
--on-disk-payload \\
--dim 1 \\
--sparse-dim 5000 \\
--bool-payloads \\
--keywords 100 \\
--float-payloads true \\
--int-payloads 100000 \\
--text-payloads \\
--text-payload-length 512 \\
--skip-field-indices \\
--jsonl-updates ./rps.jsonl
`
```
This benchmark upserts 1 million points twice. Each point has:
* A medium to large payload
* A tiny dense vector (dense vectors use a different storage type)
* A sparse vector
#### Additional configuration:
1. The test we conducted updated payload data separately in another request.
2. There were no payload indices, which ensured we measured pure ingestion speed.
3. Finally, we gathered request latency metrics for analysis.
We ran this against Qdrant 1.12.6, toggling between the old and new storage backends.
### Final Result
Data ingestion is **twice as fast and with a smoother throughput** — a massive win! 😍
We optimized for speed, and it paid off—but what about storage size?
* Gridstore: 2333MB
* RocksDB: 2319MB
Strictly speaking, RocksDB is slightly smaller, but the difference is negligible compared to the 2x faster ingestion and more stable throughput. A small trade-off for a big performance gain!
## Trying Out Gridstore
Gridstore represents a significant advancement in how Qdrant manages its **key-value storage** needs. It offers great performance and streamlined updates tailored specifically for our use case. We have managed to achieve faster, more reliable data ingestion while maintaining data integrity, even under heavy workloads and unexpected failures. It is already used as a storage backend for on-disk payloads and sparse vectors.
👉 It’s important to note that Gridstore remains tightly integrated with Qdrant and, as such, has not been released as a standalone crate.
Its API is still evolving, and we are focused on refining it within our ecosystem to ensure maximum stability and performance. That said, we recognize the value this innovation could bring to the wider Rust community. In the future, once the API stabilizes and we decouple it enough from Qdrant, we will consider publishing it as a contribution to the community ❤️.
For now, Gridstore continues to drive improvements in Qdrant, demonstrating the benefits of a custom-tailored storage engine designed with modern demands in mind. Stay tuned for further updates and potential community releases as we keep pushing the boundaries of performance and reliability.
Simple, efficient, and designed just for Qdrant.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/gridstore-key-value-storage.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/gridstore-key-value-storage/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/gridstore-key-value-storage.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)