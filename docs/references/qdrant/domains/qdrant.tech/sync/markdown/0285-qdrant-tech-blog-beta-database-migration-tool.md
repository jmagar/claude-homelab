Vector Data Migration Tool - Qdrant
0
# Vector Data Migration Tool
Qdrant
&#183;
June 16, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* Vector Data Migration Tool
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/beta-database-migration-tool/&amp;text=Vector Data Migration Tool>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/beta-database-migration-tool/)
## Migrating your data just got easier
We’ve launched the **beta** of our Qdrant **Vector Data Migration Tool**, designed to simplify moving data between different instances, whether you&rsquo;re migrating between Qdrant deployments or switching from other vector database providers.
This powerful tool streams all vectors from a source collection to a target Qdrant instance in live batches. It supports migrations from one Qdrant deployment to another, including from open source to Qdrant Cloud or between cloud regions. But that&rsquo;s not all. You can also migrate your data from other vector databases directly into Qdrant. All with a single command.
Unlike Qdrant’s included [snapshot migration method](https://qdrant.tech/documentation/snapshots/), which requires consistent node-specific snapshots, our migration tool enables you to easily migrate data between different Qdrant database clusters in streaming batches. The only requirement is that the vector size and distance function must match.
This is especially useful if you want to change the collection configuration on the target, for example by choosing a different replication factor or quantization method.
The easiest way to run the qdrant migration tool is as a container. You can run it on any machine where you have connectivity to both the source and the target Qdrant databases. Direct connectivity between both databases is not required. For optimal performance, you should run the tool on a machine with a fast network connection and minimum latency to both databases.
## Resources
Access the [Qdrant Migration Tool](https://github.com/qdrant/migration)
[Check out a tutorial](https://qdrant.tech/documentation/database-tutorials/migration/)
Watch this video to learn how to use it for moving data between Qdrant instances:
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!