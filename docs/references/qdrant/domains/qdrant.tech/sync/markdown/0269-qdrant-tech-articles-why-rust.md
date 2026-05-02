Why Rust? - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Why Rust?
[
Back to
Qdrant Articles](https://qdrant.tech/articles/)# Why Rust?
Andre Bogus
&#183;
May 11, 2023
# Building Qdrant in Rust
Looking at the [github repository](https://github.com/qdrant/qdrant), you can see that Qdrant is built in [Rust](https://rust-lang.org). Other offerings may be written in C++, Go, Java or even Python. So why does Qdrant chose Rust? Our founder Andrey had built the first prototype in C++, but didn’t trust his command of the language to scale to a production system (to be frank, he likened it to cutting his leg off). He was well versed in Java and Scala and also knew some Python. However, he considered neither a good fit:
**Java** is also more than 30 years old now. With a throughput-optimized VM it can often at least play in the same ball park as native services, and the tooling is phenomenal. Also portability is surprisingly good, although the GC is not suited for low-memory applications and will generally take good amount of RAM to deliver good performance. That said, the focus on throughput led to the dreaded GC pauses that cause latency spikes. Also the fat runtime incurs high start-up delays, which need to be worked around.
**Scala** also builds on the JVM, although there is a native compiler, there was the question of compatibility. So Scala shared the limitations of Java, and although it has some nice high-level amenities (of which Java only recently copied a subset), it still doesn’t offer the same level of control over memory layout as, say, C++, so it is similarly disqualified.
**Python**, being just a bit younger than Java, is ubiquitous in ML projects, mostly owing to its tooling (notably jupyter notebooks), being easy to learn and integration in most ML stacks. It doesn’t have a traditional garbage collector, opting for ubiquitous reference counting instead, which somewhat helps memory consumption. With that said, unless you only use it as glue code over high-perf modules, you may find yourself waiting for results. Also getting complex python services to perform stably under load is a serious technical challenge.
## Into the Unknown
So Andrey looked around at what younger languages would fit the challenge. After some searching, two contenders emerged: Go and Rust. Knowing neither, Andrey consulted the docs, and found hinself intrigued by Rust with its promise of Systems Programming without pervasive memory unsafety.
This early decision has been validated time and again. When first learning Rust, the compiler’s error messages are very helpful (and have only improved in the meantime). It’s easy to keep memory profile low when one doesn’t have to wrestle a garbage collector and has complete control over stack and heap. Apart from the much advertised memory safety, many footguns one can run into when writing C++ have been meticulously designed out. And it’s much easier to parallelize a task if one doesn’t have to fear data races.
With Qdrant written in Rust, we can offer cloud services that don’t keep us awake at night, thanks to Rust’s famed robustness. A current qdrant docker container comes in at just a bit over 50MB — try that for size. As for performance… have some [benchmarks](https://qdrant.tech/benchmarks/).
And we don’t have to compromise on ergonomics either, not for us nor for our users. Of course, there are downsides: Rust compile times are usually similar to C++’s, and though the learning curve has been considerably softened in the last years, it’s still no match for easy-entry languages like Python or Go. But learning it is a one-time cost. Contrast this with Go, where you may find [the apparent simplicity is only skin-deep](https://fasterthanli.me/articles/i-want-off-mr-golangs-wild-ride).
## Smooth is Fast
The complexity of the type system pays large dividends in bugs that didn’t even make it to a commit. The ecosystem for web services is also already quite advanced, perhaps not at the same point as Java, but certainly matching or outcompeting Go.
Some people may think that the strict nature of Rust will slow down development, which is true only insofar as it won’t let you cut any corners. However, experience has conclusively shown that this is a net win. In fact, Rust lets us [ride the wall](https://the-race.com/nascar/bizarre-wall-riding-move-puts-chastain-into-nascar-folklore/), which makes us faster, not slower.
The job market for Rust programmers is certainly not as big as that for Java or Python programmers, but the language has finally reached the mainstream, and we don’t have any problems getting and retaining top talent. And being an open source project, when we get contributions, we don’t have to check for a wide variety of errors that Rust already rules out.
## In Rust We Trust
Finally, the Rust community is a very friendly bunch, and we are delighted to be part of that. And we don’t seem to be alone. Most large IT companies (notably Amazon, Google, Huawei, Meta and Microsoft) have already started investing in Rust. It’s in the Windows font system already and in the process of coming to the Linux kernel (build support has already been included). In machine learning applications, Rust has been tried and proven by the likes of Aleph Alpha and Huggingface, among many others.
To sum up, choosing Rust was a lucky guess that has brought huge benefits to Qdrant. Rust continues to be our not-so-secret weapon.
### Key Takeaways:
* **Rust&rsquo;s Advantages for Qdrant:** Rust provides memory safety and control without a garbage collector, which is crucial for Qdrant&rsquo;s high-performance cloud services.
* **Low Overhead:** Qdrant&rsquo;s Rust-based system offers efficiency, with small Docker container sizes and robust performance benchmarks.
* **Complexity vs. Simplicity:** Rust&rsquo;s strict type system reduces bugs early in development, making it faster in the long run despite initial learning curves.
* **Adoption by Major Players:** Large tech companies like Amazon, Google, and Microsoft are embracing Rust, further validating Qdrant&rsquo;s choice.
* **Community and Talent:** The supportive Rust community and increasing availability of Rust developers make it easier for Qdrant to grow and innovate.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/why-rust.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/why-rust/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/why-rust.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)