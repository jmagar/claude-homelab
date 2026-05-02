Living in the future, by the numbers
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJanuary 08, 2025
# Living in the future, by the numbers
Avery Pennarun is the CEO and co-founder of Tailscale.
It’s a new year, and I’ve had a few days of vacation, so I’ve been thinking about the future. Instead of making the traditional New Year predictions, let’s talk instead about the beautiful technological future we live in: the one that exists right now but we don’t always notice.
### [Computation is 200,000x faster than 20 years ago](#computation-is-200000x-faster-than-20-years-ago)
In 2004, a typical CPU could do maybe 3–5 Gflops/sec. Today, multicore server CPUs can supposedly do up to 4 Tflops/sec (yay SIMD), roughly 1000x faster.
In 2004, servers rarely had GPUs, so that 3–5 Gflops was all you got. Nowadays, you could add an RTX 4090 and get an extra 80 Tflops or so (16,000x faster).
But if you really need to multiply some numbers (with, uh, low fidelity), we have TPUs now. Google TPUv4 claims 1.1 Pflops/sec, so 14x faster again. So numerical computations on one machine are roughly 230,000x faster than on one machine back in 2004.
### [Web servers are at least 100x faster](#web-servers-are-at-least-100x-faster)
Does that multiplying-numbers performance matter in everyday life? Maybe not, unless you’re doing AI stuff (which is why the hardware industry so urgently needs you to care about AI stuff).
Being able to multiply floating-point numbers on a GPU or TPU isn’t exactly going to speed up your web server or (most kinds of) SQL queries. But even plain CPUs do more per clock cycle now, and fancy workstation CPUs (like AMD EPYC) are getting to 128 cores and beyond. That’s a lot of cores, even if each core runs a little slower than a fewer-core processor.
And remember, back in 2004, we were making our servers with Perl, PHP, and Python. (Ruby on Rails hadn’t caught on yet.) Even JavaScript JIT didn’t happen until Chrome released V8 in 2008. Now, you can much more easily write your server side in a decent compiled language like Go or Rust—or at least JIT-compiled Node.js.
In a rare break with [software tradition](https://en.wikipedia.org/wiki/Wirth's_law), on servers you’re now seeing a 50x–100x speedup just from software improvements, regardless of hardware. (Not joking: my rule of thumb is Python is about 50x slower [per line of code](https://apenwarr.ca/diary/2011-10-pycodeconf-apenwarr.pdf) than a compiled language.)
With hardware and software improvements together, I’m going to say at least 100x for typical server use cases—maybe much more.
### [RAM is 16x to 750x bigger](#ram-is-16x-to-750x-bigger)
Computation speed is one factor, but what about space?
A typical laptop in 2004 had a max of 2GB of RAM. Today, a typical max is about 32GB (16x bigger).
On the high end, servers apparently maxed out around 16GB back then. Today, the biggest server I found has 12TB of RAM (750x bigger).
Interestingly, the price per byte has only improved by maybe 6–10x in 20 years—much slower than most things in computing. So that 12TB server will cost a lot of money. But if you want to do all your computation in one computer, you can have it, where before you couldn’t, at any price.
And putting everything in one computer can save a ton of distributed systems overhead, giving another performance (and debuggability) benefit.
### [Hard disks are about 100x bigger](#hard-disks-are-about-100x-bigger)
How about persistent storage?
Ignoring SSDs for the moment, in 2004, you could buy a typical 160GB consumer hard disk for about $95, according to some random website I found—$1684/TB. Today, [disks are apparently about $14/TB](https://diskprices.com/?locale=us&amp;condition=new&amp;disk_types=external_hdd,external_hdd25,internal_hdd,internal_hdd25,internal_sshd,internal_sas,external_ssd,internal_ssd,m2_ssd,m2_nvme,u2), so 100x cheaper per byte.
To put that in perspective, I found one person who estimated [Netflix’s entire catalog in 2016 was about 100TB](https://www.reddit.com/r/NoStupidQuestions/comments/6mfzuj/how_much_data_is_contained_in_the_netflix_library/?rdt=41856). Today, that would cost you about $1400 in disks—about half the price of a pretty good laptop. And you can buy at least 14TB disks now, so that whole catalog is only about seven disks’ worth. Pop them on a chain of USB hubs on your Raspberry Pi.
(Let’s ignore how [AWS S3 still charges you $23/TB/month](https://aws.amazon.com/s3/pricing/)—1.6x the price of buying the physical disk outright every month—and then charges you egress fees on top for every byte you actually download. But this is an article about the state of the art in computing, not the state of the art in setting money on fire.)
### [SSDs can do 10,000x more transactions per second](#ssds-can-do-10000x-more-transactions-per-second)
In 2004, we used spinning disks for everything. Because of their seek time, a simple consumer-grade spinning disk could do about 50 transactions per second. (On servers, you could buy a high-RPM disk and maybe get to 100. Or, various expensive hardware was introduced to try to cut down transaction latency, including giant disk arrays and battery-backed-up RAM.)
Modern NVMe disks can do 500,000 transactions per second or more. That’s a 10,000x speedup.
How fast is that? Well, according to CapitalOne, t[here are about 23,000 credit card transactions per second, worldwide](<https://capitaloneshopping.com/research/number-of-credit-card-transactions/#:~:text=Total global credit card transactions,per minute, 22,950 per second.>). So I guess you could do 20x the world’s credit card transaction processing on one gamer PC.
### [SSDs (mostly) don’t die](#ssds-mostly-dont-die)
Now, Visa probably doesn’t actually run their entire service on just one computer, because reliability. …right?
It’s hard to remember the bad old days of 2004, but back then, we used spinning disks almost exclusively, and spinning disks just… kinda stop working eventually. Moving parts are a huge reliability problem in every industry. (Plus, remember when you used to put your computer in a bag with some strong magnets and when you arrived at school it didn’t work anymore, plus your credit card had been wiped? …Maybe that was just me.)
Opinions differ about reliability of SSDs, but in general, it’s agreed that they last longer under normal use, and when they die, it’s usually not complete data loss (unless there’s a manufacturing defect in the controller and they die early, oops). [Backblaze has an SSD report including reliability stats](https://www.backblaze.com/blog/ssd-edition-2023-mid-year-drive-stats-review/): some of the models show zero failures in four years or more of operation.
Disk failure is frustrating when it happens, and even a low probability of failure is pretty unacceptable. That’s why AWS S3 jumps through hoops to make their storage [supposedly “eleven nines” of durability](https://medium.com/@ayogun/how-much-durable-aws-s3-is-a3b2ce789c29). That means, even though your storage might go temporarily offline sometimes (availability), when it comes back, your data will still be there (durability).
Still though. Back in the day, if you owned a computer you were going to lose your data, that was just how it was. If you were an average consumer, welp, you probably experienced at least one major data loss in your life. If you were a professional, you dealt with that by making offsite backups and futzing with RAIDs and replacing your disks periodically before they died (and you probably still experienced at least one major data loss in your life).
Nowadays, most normal people don’t even think about disk failure anymore. How many people do you know whose laptop storage just quit on them in the last decade? I don’t think I personally know any at all. What a difference.
### [The “c10k” problem is now the “c10000k” problem](#the-c10k-problem-is-now-the-c10000k-problem)
Back in 2004 in my circles, we talked a lot about the [c10k problem](https://en.wikipedia.org/wiki/C10k_problem): connecting 10 thousand clients to a single server simultaneously.
Nowadays, we’ve blown past that, and we’re up to (at least) a [c10000k problem](https://highscalability.com/the-secret-to-10-million-concurrent-connections-the-kernel-i/): 10 million connections at once. Over in Tailscale prod, we have at least one server that passed a million simultaneously connected nodes this year. Now, we probably should not have done that; I feel another [April 1st blog post](https://tailscale.com/blog/database-for-2022) in our future. But here we are anyway. And we definitely should not try to hit 2 million this year. Probably.
The point is, those orders of magnitude improvements are real. We can count on them. We can design things totally differently than we used to, because we know one computer can do the work of what used to be 1000 computers.
### [Welcome to the future](#welcome-to-the-future)
For almost everyone, our tools are growing much faster than our problems. A lot of the distributed, hyperscale architecture we use today originated at Google in 1998 and the early 2000s… before all of the above speedups. Today we use the same designs out of habit, not need.
When we named Tailscale, it was a multi-layered nerd joke. One of the layers is that it’s the opposite of [The Tail at Scale paper](https://research.google/pubs/the-tail-at-scale/) by Jeff Dean and Luiz André Barroso. Their paper was about all the trouble you have to deal with when you scale to a million computers. I love that paper, it's really neat. But Tailscale is about all the trouble you don’t have to deal with when you, well, do more with less.
Welcome to the future. Make the most of it. It’s going to be fun.
Share
Author
Avery Pennarun
Author
Avery Pennarun
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