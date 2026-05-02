From JSON Files to etcd: A Tailscale Database Migration Story
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 13, 2021
# An unlikely database migration
#### Brad joins a startup
When I first joined [Tailscale](/) almost a year ago, one of the first things I asked [Crawshaw](https://github.com/crawshaw) was, “So, what database do you use? MySQL, PostgreSQL, SQLite maybe?”, knowing that he loved SQLite.
“A text file," he replied.
“Huh?”
“Yeah, we write out one big JSON object to a text file.”
“How? When? *What?*”
“Yeah, whenever something changes, we grab a lock in our single process and rewrite out the file!” he chuckled with glee.
It sounded insane. It *was* insane. Sure, it was easily testable, but it didn’t scale. We both knew that. But it worked.
Until it didn’t.
Even with fast NVMe drives and splitting the database into two halves (important data vs. ephemeral data that we could lose on a tmpfs), things got slower and slower. We knew the day would come. The file reached a peak size of 150MB and we were writing it as quickly as the disk I/O would let us. Ain’t that just peachy?
So, migrate to MySQL or PostgreSQL, right? Maybe SQLite?
Nope, Crawshaw had other ideas.
#### A bit of backstory from David
Tailscale’s coordination server, our “control plane”, has become known as [CONTROL](https://getsmart.fandom.com/wiki/CONTROL). It’s currently a single Go process on a single VM. The very earliest prototypes for CONTROL used SQLite. Our original designs were very different from what we ended up with, involving configuration databases synchronized onto client machines and all sorts of other concepts we ended up not needing. Through this process we would do major reorganizations of our SQL data model every week, which required an astonishing amount of typing. SQL is widely used, durable, effective, and requires an annoying amount of glue to bring into just about any programming language. (Attempts to avoid this with ORMs usually replace an annoying amount of typing with an annoying amount of magic and loss of efficiency.)
One day, fed up with the refactorings, I threw it all out and built an in-memory data model for experimentation. That made iterating much faster. A couple of weeks later, a customer wanted to try it out. I wasn’t ready to commit to the data model yet and do it properly in SQL, so I took a shortcut: the object holding all the data was wrapped in a `sync.Mutex`, all accesses went through it, and on edit the whole structure was passed to `json.Marshal` and written to disk. This gave us data model persistence in \~20 lines of Go.
The plan was always to migrate to something else but, uh, we got busy with other stuff and kinda forgot.
#### What comes after JSONMutexDB?
The obvious next step to take was to move to SQL. My favorite is still SQLite, but I couldn’t bring myself to make an argument for migrating a rapidly growing service to it. It certainly could work, especially as the design of our control plane doesn’t require the high availability of typical web services: the result of a short outage is that new nodes can’t log in; working networks continue to work.
MySQL (or PostgreSQL) would come next. I’m not particularly familiar with anything MySQL post 1998, but I’m sure it would work. The HA story for open source databases is somewhat surprising, though: you can either have traditional lagging replicas, or commit to no-primary-replica clusters that have very surprising transaction semantics. I wasn’t excited about trying to design a stable API or good network graph calculations on top of those semantics. [CockroachDB](https://github.com/cockroachdb/cockroach#what-is-cockroachdb) looked very promising, and indeed still does! But it’s relatively new for a database and I was a little concerned about getting attached to features in a fresh DBMS that would be hard to migrate away from if we needed to.
Making our control server depend on MySQL or PostgreSQL also means our control server’s testing story gets slow & ugly. Brad had fought that battle with [Perkeep](https://perkeep.org) and previously written [perkeep.org/pkg/test/dockertest](https://godoc.org/perkeep.org/pkg/test/dockertest) which works but isn’t something we wanted to subject future employees to. It requires Docker on your machine and it’s not particularly fast.
Then one day we saw a [Jepsen report on etcd](https://jepsen.io/analyses/etcd-3.4.3). Unlike the usual less-than-satisfying Jepsen reports to which we’d become accustomed, this one said *good things* about [etcd](https://etcd.io/). Combined with some positive experiences [Dave Anderson](https://github.com/danderson) had with it, we started thinking about whether we could just use etcd directly. Being written in Go, we could just link it into our tests and use it directly. No Docker, no mocks, testing what we’d actually use in production.
It turned out that the core data model we were writing to disk closely followed the pattern:
```
`type AllTheData struct {
BigLock sync.Mutex
Somethings map[string]Something
Widgets map[string]Widget
Gadgets map[string]Gadget
}
`
```
This maps surprisingly well onto a KV-store. So this led us to etcd as a “minimally-viable database”. It does the critical things we needed now, which was 1) breaking the BigLock into something more akin to a `sync.RWMutex`, and 2) reducing our I/O to only write the changed data, not the whole world on any write.
(We are careful not to use any etcd features that would be hard to map onto CockroachDB.)
The downside of this is that etcd, while popular in Kubernetes, has relatively few users for a database system. As a company, Tailscale is spending an [innovation token](https://mcfunley.com/choose-boring-technology) on it. But the database is conceptually small enough that we don’t have to treat it as a black box. When we ran into a surprisingly slow key pagination edge case in etcd 3.4, I was able to read my way through its sources and write a fix for it in an hour. (I then discovered an [equivalent fix](https://github.com/etcd-io/etcd/commit/26c930f27d46776da5fedae69267ba0b69c31185) had already been applied to the next version of etcd, so we backported that instead.)
#### tailetc: our etcd client wrapper
The client we use for etcd is open source at [github.com/tailscale/tailetc](https://github.com/tailscale/tailetc). It is built around two concepts: 1) the total data in the DB is small enough to fit into the server’s memory and 2) reads are far more common than writes. Given that, we want to make reads cheap.
The way we do that is by registering a watch against etcd. Every change is sent to the client, which maintains an enormous cache `map[string]interface{}` behind a `sync.RWMutex`. When you create a Tx and do a Get, the value is read out of this cache (which may be behind etcd, but is kept transactionally consistent by tracking the modrev: a global incrementing ID that etcd uses to define revisions of key-value pairs.). To avoid aliasing bugs with the cache, we copy the object out, but avoid JSON decoding on each Get by implementing a more efficient Clone call on objects in the cache.
The result is that fetching a value from etcd does not require any network traffic.
This is one of those few times writing Go that I felt the limitations of its type system as I was designing a package. If I were working in a language with all the bells and whistles, there would be some kind of const qualifier I could place on objects leaving the cache and avoid cloning the memory. That said, running profiles on our server show the copying is not a performance issue, so perhaps this is an example of where I feel the pull towards a more complex type system without actually having a real need for them. As is so often the case, assumptions are dangerous, profiling is enlightening.
#### One snag: indexes
The biggest problem with choosing a minimal viable “nosql” is the lack of the wonderful index system every standard SQL DBMS supplies. We are stuck with either storing indexes inside etcd, or managing them in memory in our client.
With JSONMutexDB we generated them in memory, because it’s much easier to make data model changes. The easy option with etcd would have been writing them to the database, but that would have really complicated data models. Unfortunately, if we want to move to running more than one CONTROL process simultaneously for high-availability and better release management, that means we no longer have exactly one process managing the data, so our indexes need to be transaction (and rollback) aware. So we invested what probably amounts to two or three weeks of engineering time into designing in-memory indexes that are transactionally consistent. This gets a bit tricky to describe, so we’ll save that for a future blog post (and hopefully we can clean up the code enough to open source it some day).
#### The migration
The migration wasn’t very notable, which is always a good thing. We ran both systems in parallel for a while and at some point stopped using the old one. The most exciting thing was that our commit latency dropped a bunch when we turned off the JSON writes. This was most noticeable when editing networks in the admin console. We’d include pretty Grafana graphs here but the cut-over predates us changing our Prometheus config to keep more history. In any case, writes went from nearly a second (sometimes worse!) to milliseconds. When we’d started, writes weren’t a second of course. Never underestimate how long your “temporary” hack will stay in production!
#### Future
The most exciting thing about this work, besides ensuring the Tailscale control plane can scale out for the foreseeable future, is improving our release process. A consistent database we can easily attach multiple control plane instances to means we can move to [blue-green deployment](https://en.wikipedia.org/wiki/Blue-green_deployment). This will let Tailscale engineers experiment with deploying features with the confidence that the worst-case outcome of a change is limited. The goal is to keep development speed as close to the early days of JSONMutexDB, when you could recompile and run locally in a fraction of a second and deploy ten times a day.
Share
Authors
Brad Fitzpatrick
David Crawshaw
Authors
Brad Fitzpatrick
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