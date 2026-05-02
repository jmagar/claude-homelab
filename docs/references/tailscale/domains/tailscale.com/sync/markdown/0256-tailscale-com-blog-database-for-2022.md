Switching from etcd to SQLite: A Database Migration Story
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 01, 2022
# A database for 2022
Hi, it’s us again, the ones who used to
[store our database in a single JSON file](https://tailscale.com/blog/an-unlikely-database-migration)
on disk, and then moved to etcd.
Time for another change!
We’re going to put everything in a single file on disk again.
As you might expect from our previous choice (and as many on the
internet already predicted), we ran into some limits with etcd.
Database size, write transaction frequency, of particular note:
generating indexes.
All of these were surmountable limits, but we were quickly running
into the biggest limit: me.
Until now, I have been allowed to choose just about anything
for a database as long as I do all the work.
But at a certain point, that doesn’t scale.
The way to solve the issues with etcd was bespoke code.
Every time someone else had to touch it, I had to explain it.
Especially the indexing code. (Sorry.)
What we need is something easier to dive into and get back out of
quickly, a database similar enough to common development systems that
other engineers, working hard to solve other problems, don’t have to
get distracted by database internals to solve their problem.
Reaching this team engineering scaling limit was entirely predictable,
though it happened faster than we thought it would.
So we needed something different, something more conservative than our
previous choices.
The obvious candidates were MySQL (or one of its renamed variants
given who bought it) or PostgreSQL, but several of us on the team have
operational experience running these databases and didn’t enjoy the
prospect of wrestling with the ops overhead of making live replication
work and behave well.
Other databases like CockroachDB looked very tempting, but we had zero
experience with it.
And we didn’t want to lock ourselves into a cloud provider with a
managed product like Spanner.
We have several requirements in our previous blog
post that still apply, such as being able to run our entire test
suite locally and hermetically quickly and easily, ideally without
VMs or containers.
## Enter Litestream
There is one very fun database out there: SQLite.
But live replication typically involves layers on top of SQLite, which
introduces a lot of the operational overhead risks of other databases,
only with systems that are less widely deployed and so not as well known.
However, something new has appeared on the SQLite front that makes
live-replication feasible, without interpositing itself between your
application and SQLite: [litestream](https://litestream.io/).
Litesteam is neat, because it’s conceptually so simple.
In WAL-mode (the mode you very much want on a server, as it means
writers do not block readers), SQLite appends to a WAL file and then
periodically folds its contents back into the main database file as
part of a checkpoint.
Litestream interposes itself in this process: it grabs a lock so that
no other process can checkpoint.
It then watches the WAL file and streams the appended blocks up to S3,
periodically checkpointing the database for you when it has the
necessary segments uploaded.
This gives you near real time backups (or with a couple deft modifications, lets your app block at critical sections until the backup is done) and lets you replay your database from S3 trivially, using SQLite’s standard WAL reading code. No modifications to SQLite necessary. It’s a great hack, and a small enough program that I could read my way through it entirely before committing to it.
## Migration, step 0
First off, we took this opportunity to move some low-value ephemeral data that had too many writes/sec for etcd to be happy into SQLite. We ended up creating a separate SQLite DB for it, because we didn’t want to stream every update of this low-value database to S3. This took longer than expected because I took the opportunity to make a set of schema changes to the data.
This wasn’t necessary at all to migrate etcd, but was one of the criteria we used to judge a database replacement: could it do more than etcd? SQLite did a good job of this. Two databases adds some complexity, but SQLite has good semantics for ATTACH that make it straightforward to use.
Earlier I said we migrated to one file on disk but I guess that’s not quite accurate; we have two files on disk now: our “main” SQLite database for high-value data and our “noise” SQLite database for ephemeral data. Or four files if you count the WALs.
## Migration, step 1
The core of the migration could be done quickly. We defined an SQLite table to hold the key-value pairs from etcd:
```
`CREATE TABLE IF NOT EXISTS main.DBX (
Key TEXT PRIMARY KEY, -- the etcd key
Value TEXT -- JSON-encoded types from etcd
);
`
```
Then we did a three-stage deploy:
We modified our etcd client wrapper to start writing all KV-pairs into both etcd and SQLite.
We then changed our etcd wrapper to read from sqlite as the source of truth.
Then we turned off writing to etcd.
By the end of it we were left with an etcd cluster we could turn off.
## Migration, step 2
The second step is slowly moving data out of that DBX table into custom tables per type. This is going slowly. We’ve done several tables. Each one requires extensive changes to our service code to do well, so each requires a lot of thought. SQLite doesn’t seem to be getting in the way of this process though.
I did end up writing quite a lot of “schema migration” code for doing rollouts. I feel like more of this should have been available for SQL versioning off the shelf.
## Experience Report
How did it go? Good question. SQLite works as it says on the tin. It requires some tuning for working under load, we have another post coming about that. The migration from etcd to one-big-table in SQLite was easy.
The process of changing the schema, pulling data out of the generic
table, is somewhat painful.
It’s slow because I doesn’t have many hours for programming
any more, and slow because changes have to be carefully rolled out.
We don’t think SQLite is the limiting factor here though, it’s the
way our code uses the database.
In retrospect I could have designed more layers into the
original control service to make this easy.
(You can say similar things about a lot of the code we wrote in the
early days.)
We are slowly getting the DB code to a place where I do not
feel bad inflicting it on co-workers, which was the primary objective
of this migration.
We won’t be truly happy until all the old etcd indexing code and
caching layer is gone, but we’re moving in the right direction.
It should be easy to work on our service.
Most of the negative experiences are in our old retrofitted etcd caching layer, and we can’t blame SQLite for that. No databases have precisely the same semantics.
One interesting SQLite gotcha we ran into: our two databases are
`ATTACH`ed.
When a default write transaction starts with `BEGIN DEFERRED`, each
database has to be locked.
The order they are locked in is determined by which one is
`UPDATE`d or `INSERT`ed into first, which can cause a deadlock with
the single SQLite writer when two different transactions lock in a
different order.
We resolved this by always using `BEGIN IMMEDIATE` on write transactions.
We’re also looking forward to read-only litestream replicas, which we
intend to set up in the future.
Footnote: co-workers point out it’s April Fool’s today and request that
I clarify this isn’t a joke. Joke’s on them: every day’s April Fool’s
in the Tailscale Database Engineering department.
Share
Author
David Crawshaw
Author
David Crawshaw
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)