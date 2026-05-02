Data Synchronization - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* Data Synchronization# Keeping Your Data in Sync with Qdrant
After migrating to Qdrant, maintaining consistency between Qdrant and your other data stores can be an ongoing operational concern. As records are created, updated, or deleted in your other sources, those changes often need to be reflected in Qdrant to keep search results accurate and fresh.
The guides in this section cover database-specific synchronization patterns for keeping Qdrant aligned with your existing infrastructure.
## Synchronization Strategies
How you sync depends on your source system and write volume:
* **Event-driven sync** — listen for change events (CDC, triggers, or message queues) and upsert or delete points in Qdrant in real time.
* **Batch sync** — periodically re-index records that have changed since the last run, using a timestamp or version field to identify updates.
* **Dual-write** — write to both systems simultaneously in application code, with a background reconciliation job to catch divergence.
Each approach involves trade-offs between latency, complexity, and consistency guarantees. The guides below cover patterns for specific databases.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-synchronization/_index.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/data-synchronization/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-synchronization/_index.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)