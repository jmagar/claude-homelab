Surpassing 10Gb/s with Tailscale: Performance Gains on Linux
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 13, 2023
# Surpassing 10Gb/s over Tailscale
Hi, it’s us again. You might remember us from [when we made](https://tailscale.com/blog/throughput-improvements/) significant performance-related changes to [wireguard-go](https://git.zx2c4.com/wireguard-go/about/), the userspace [WireGuard](https://www.wireguard.com/)® implementation that Tailscale uses. We’re releasing a set of changes that further improves client throughput on Linux. We [intend to upstream](https://github.com/WireGuard/wireguard-go/pull/75) these changes to WireGuard as we did with the previous set of changes, which have [since landed upstream](https://github.com/WireGuard/wireguard-go/compare/2163620...f26efb6).
**With this new set of changes, Tailscale joins the 10Gb/s club on bare metal Linux, and wireguard-go pushes past (for now) the in-kernel WireGuard implementation on that hardware.** How did we do it? Through UDP segmentation offload and checksum optimizations. You can experience these improvements in the current unstable Tailscale client release, and also in Tailscale v1.40, available in the coming days. Continue reading to learn more, or jump down to the [Results](https://tailscale.com/blog/more-throughput#results) section if you just want numbers.
## [Background](#background)
The data plane in Tailscale is built atop [wireguard-go](https://git.zx2c4.com/wireguard-go/about/), a userspace WireGuard implementation written in Go. wireguard-go acts as a pipeline, receiving packets from the operating system via a [TUN](https://en.wikipedia.org/wiki/TUN/TAP) interface. It encrypts them, assuming a valid peer exists for their addressed destination, and sends them to a remote peer via a UDP socket. The flow in the opposite direction is similar. Packets from valid peers are decrypted after being read from a UDP socket, then are written back to the kernel’s TUN interface driver.
The changes we made in v1.36 modified this pipeline, enabling packet vectors to flow end-to-end, rather than single packets. The techniques applied on both ends of the pipeline reduced the number of system calls per packet, and on the TUN side they reduced the cost of moving a packet through the kernel networking stack.
[This greatly improved throughput](https://tailscale.com/blog/throughput-improvements/#results), and we have continued to build upon it with the changes we describe in this post.
## [Baseline](#baseline)
**Disclaimer about benchmarks**: This post contains benchmarks! These benchmarks are reproducible at the time of writing, and we provide details about the environments we ran them in. But benchmark results tend to vary across environments, and they also tend to go stale as time progresses. Your mileage may vary.
Before getting into the details of what we changed, we need to record some baselines for later comparison. These benchmarks are conducted using [iperf3](https://github.com/esnet/iperf), as single stream TCP tests, with cubic congestion control. All hosts are running Ubuntu 22.04 with the latest available Linux kernel for that distribution.
We baselined throughput for [wireguard-go@052af4a](https://git.zx2c4.com/wireguard-go/tree/?id=052af4a8072bbbd3bfe7edf46fe3c1b350f71f08) and in-kernel WireGuard. These tests were conducted between two pairs of hosts:
* 2 x AWS c6i.8xlarge instance types
* 2 x “bare metal” servers powered by [i5-12400](https://ark.intel.com/content/www/us/en/ark/products/134586/intel-core-i512400-processor-18m-cache-up-to-4-40-ghz.html) CPUs & Mellanox MCX512A-ACAT NICs
For consistency, the c6i.8xlarge instance type is the same we used in the [precursory blog post](https://tailscale.com/blog/throughput-improvements/). The instances are in the same region and availability zone:
```
`ubuntu@c6i-8xlarge-1:\~$ ec2metadata | grep -E 'instance-type:|availability-zone:'
availability-zone: us-east-2b
instance-type: c6i.8xlarge
ubuntu@c6i-8xlarge-2:\~$ ec2metadata | grep -E 'instance-type:|availability-zone:'
availability-zone: us-east-2b
instance-type: c6i.8xlarge
ubuntu@c6i-8xlarge-1:\~$ ping 172.31.23.111 -c 5 -q
PING 172.31.23.111 (172.31.23.111) 56(84) bytes of data.
--- 172.31.23.111 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4094ms
rtt min/avg/max/mdev = 0.109/0.126/0.168/0.022 ms
`
```
We’ve added the i5-12400 systems for a bare metal comparison with interfaces operating above 10Gb/s. The i5-12400 CPU is a modern (released Q1 2022) desktop-class chip, available for $183 USD at the time of writing. The Mellanox NICs are connected at 25Gb/s via a direct attach copper (DAC) cable:
```
`jwhited@i5-12400-1:\~$ lscpu | grep Model.name && cpupower frequency-info -d && cpupower frequency-info -p
Model name: 12th Gen Intel(R) Core(TM) i5-12400
analyzing CPU 0:
driver: intel\_pstate
analyzing CPU 0:
current policy: frequency should be within 800 MHz and 5.60 GHz.
The governor "performance" may decide which speed to use
within this range.
jwhited@i5-12400-1:\~$ sudo ethtool enp1s0f0np0 | grep Speed && sudo ethtool -i enp1s0f0np0 | egrep 'driver|^version'
Speed: 25000Mb/s
driver: mlx5\_core
version: 5.15.0-69-generic
jwhited@i5-12400-2:\~$ lscpu | grep Model.name && cpupower frequency-info -d && cpupower frequency-info -p
Model name: 12th Gen Intel(R) Core(TM) i5-12400
analyzing CPU 0:
driver: intel\_pstate
analyzing CPU 0:
current policy: frequency should be within 800 MHz and 5.60 GHz.
The governor "performance" may decide which speed to use
within this range.
jwhited@i5-12400-2:\~$ sudo ethtool enp1s0f0np0 | grep Speed && sudo ethtool -i enp1s0f0np0 | egrep 'driver|^version'
Speed: 25000Mb/s
driver: mlx5\_core
version: 5.15.0-69-generic
jwhited@i5-12400-1:\~$ ping 10.0.0.20 -c 5 -q
PING 10.0.0.20 (10.0.0.20) 56(84) bytes of data.
--- 10.0.0.20 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4078ms
rtt min/avg/max/mdev = 0.008/0.035/0.142/0.053 ms
`
```
Now for the iperf3 baseline tests.
c6i.8xlarge over in-kernel WireGuard:
```
`ubuntu@c6i-8xlarge-1:\~$ iperf3 -i 0 -c c6i-8xlarge-2-wg -t 10 -C cubic -V
iperf 3.9
Linux c6i-8xlarge-1 5.19.0-1022-aws #23\~22.04.1-Ubuntu SMP Fri Mar 17 15:38:24 UTC 2023 x86\_64
Control connection MSS 1368
Time: Wed, 12 Apr 2023 23:56:53 GMT
Connecting to host c6i-8xlarge-2-wg, port 5201
Cookie: 3jzl3sa34hkbpwbmg4dbfh6aovbknnw7x5hn
TCP MSS: 1368 (default)
[ 5] local 10.9.9.1 port 51194 connected to 10.9.9.2 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 3.11 GBytes 2.67 Gbits/sec 51 1.00 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 3.11 GBytes 2.67 Gbits/sec 51 sender
[ 5] 0.00-10.05 sec 3.11 GBytes 2.66 Gbits/sec receiver
CPU Utilization: local/sender 5.1% (0.3%u/4.8%s), remote/receiver 11.2% (0.2%u/11.0%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
c6i.8xlarge over [wireguard-go@052af4a](https://git.zx2c4.com/wireguard-go/tree/?id=052af4a8072bbbd3bfe7edf46fe3c1b350f71f08):
```
`ubuntu@c6i-8xlarge-1:\~$ iperf3 -i 0 -c c6i-8xlarge-2-wg -t 10 -C cubic -V
iperf 3.9
Linux c6i-8xlarge-1 5.19.0-1022-aws #23\~22.04.1-Ubuntu SMP Fri Mar 17 15:38:24 UTC 2023 x86\_64
Control connection MSS 1368
Time: Wed, 12 Apr 2023 23:55:42 GMT
Connecting to host c6i-8xlarge-2-wg, port 5201
Cookie: zlcrq3xqyr6cfmrtysrm42xcg3bbjzir3qob
TCP MSS: 1368 (default)
[ 5] local 10.9.9.1 port 54410 connected to 10.9.9.2 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 6.21 GBytes 5.34 Gbits/sec 0 3.15 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 6.21 GBytes 5.34 Gbits/sec 0 sender
[ 5] 0.00-10.04 sec 6.21 GBytes 5.31 Gbits/sec receiver
CPU Utilization: local/sender 8.6% (0.2%u/8.4%s), remote/receiver 11.8% (0.6%u/11.2%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
i5-12400 over in-kernel WireGuard:
```
`jwhited@i5-12400-1:\~$ iperf3 -i 0 -c i5-12400-2-wg -t 10 -C cubic -V
iperf 3.9
Linux i5-12400-1 5.15.0-69-generic #76-Ubuntu SMP Fri Mar 17 17:19:29 UTC 2023 x86\_64
Control connection MSS 1368
Time: Wed, 12 Apr 2023 23:41:44 GMT
Connecting to host i5-12400-2-wg, port 5201
Cookie: hqkn7s3scipxku5rzpcgqt4rakutkpwybtvx
TCP MSS: 1368 (default)
[ 5] local 10.9.9.1 port 48564 connected to 10.9.9.2 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 13.7 GBytes 11.8 Gbits/sec 8725 753 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 13.7 GBytes 11.8 Gbits/sec 8725 sender
[ 5] 0.00-10.04 sec 13.7 GBytes 11.7 Gbits/sec receiver
CPU Utilization: local/sender 26.3% (0.1%u/26.2%s), remote/receiver 17.4% (0.5%u/16.9%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
i5-12400 over [wireguard-go@052af4a](https://git.zx2c4.com/wireguard-go/tree/?id=052af4a8072bbbd3bfe7edf46fe3c1b350f71f08):
```
`jwhited@i5-12400-1:\~$ iperf3 -i 0 -c i5-12400-2-wg -t 10 -C cubic -V
iperf 3.9
Linux i5-12400-1 5.15.0-69-generic #76-Ubuntu SMP Fri Mar 17 17:19:29 UTC 2023 x86\_64
Control connection MSS 1368
Time: Wed, 12 Apr 2023 23:39:22 GMT
Connecting to host i5-12400-2-wg, port 5201
Cookie: ohzzlzkcvnk45ya32vm75ezir6njydqwipkl
TCP MSS: 1368 (default)
[ 5] local 10.9.9.1 port 52486 connected to 10.9.9.2 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 9.74 GBytes 8.36 Gbits/sec 507 3.01 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 9.74 GBytes 8.36 Gbits/sec 507 sender
[ 5] 0.00-10.05 sec 9.74 GBytes 8.32 Gbits/sec receiver
CPU Utilization: local/sender 11.7% (0.1%u/11.6%s), remote/receiver 6.5% (0.2%u/6.3%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
With the baselines captured, let’s look at some profiling data to understand where we may be bottlenecked.
## [Linux perf and flame graphs](#linux-perf-and-flame-graphs)
The [flame graphs](https://www.brendangregg.com/flamegraphs.html) below were rendered from [perf data](https://perf.wiki.kernel.org/index.php/Main_Page). They represent the amount of CPU time spent for a given function/stack. The wider the function, the more expensive it (and/or its children) are. These are interactive; you can click to zoom and hover to see percentages.
This first graph is from the iperf3 sender:
Notably, more time is being spent sending UDP packets than encrypting their payloads. Let’s take a look at the receiver:
The receiver looks fairly similar, with UDP reception being nearly equal in time spent relative to decryption.
We are using the `{send,recv}mmsg()` (two m’s) system calls, which help to amortize the cost of making a syscall. However, on the kernel side of the system call, we see `{send,recv}mmsg()` calls into `{send,recv}msg()` (single m). This means that we still pay the cost of traversing the kernel networking stack for every single packet, because the kernel side simply iterates through the batch.
On the TUN side of wireguard-go, we make use of [TCP segmentation offload (TSO)](https://tailscale.com/blog/throughput-improvements/#tcp-segmentation-offload-tso) and generic receive offload (GRO), which enable multiple TCP segments to pass through the kernel stack as a single segment:
What we need is something similar, but for UDP. Enter UDP generic segmentation offload.
## [UDP generic segmentation offload (GSO)](#udp-generic-segmentation-offload-gso)
UDP GSO enables the kernel to delay segmentation of a batch of UDP datagrams in a similar fashion to the TCP variant, reducing the CPU cycles per byte cost of traversing the networking stack. Linux support was authored by Willem de Bruijn and [introduced into the kernel in v4.18](https://github.com/torvalds/linux/commit/cb586c63e3fc5b227c51fd8c4cb40b34d3750645). UDP GSO was [propelled by the adoption of QUIC in the datacenter](https://www.youtube.com/watch?v=ccUeG1dAhbw), but its benefits are not limited to QUIC. It is best described by part of its summary commit message:
> Segmentation offload reduces cycles/byte for large packets by amortizing the cost of protocol stack traversal.
> This patchset implements GSO for UDP. A process can concatenate and submit multiple datagrams to the same destination in one send call by setting socket option SOL_UDP/UDP_SEGMENT with the segment size, or passing an analogous cmsg at send time.
> The stack will send the entire large (up to network layer max size) datagram through the protocol layer. At the GSO layer, it is broken up in individual segments. All receive the same network layer header and UDP src and dst port. All but the last segment have the same UDP header, but the last may differ in length and checksum.”
After implementing UDP GSO on the UDP socket side of wireguard-go, the transmit direction now looks like this:
But what about the receive path? It would be ideal to optimize both directions. Paolo Abeni authored UDP generic receive offload (GRO) support, and it was [introduced into the Linux kernel in v5.0](https://github.com/torvalds/linux/commit/cab6949bf70a68ee5aada5f1973c0bb906d354cf). With UDP GRO the receive direction now looks like this:
[Updates to the UDP man page](https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/man7/udp.7?id=806eabd74910447f21005160e90957bde4db0183) for these new features eventually arrived, in which an important requirement for UDP GSO is described:
> Segmentation offload depends on checksum offload, as datagram checksums are computed after segmentation.
Checksum offload is widely supported across ethernet devices today. It also reduces the cost of the kernel networking stack, as ethernet devices tend to have specialized hardware that is very efficient at computing [RFC1071 checksums](https://www.rfc-editor.org/rfc/rfc1071.html). It’s often paired with segmentation offload, which as the man page describes, may need to be performed by the layer performing segmentation.
In fact, we already have to offload checksumming inside of the TCP segmentation offload implementation in wireguard-go. The kernel hands us a “monster segment,” which we are responsible for segmenting. This includes calculating checksums for the individual segments.
## [TUN checksum offload](#tun-checksum-offload)
If we look back at the flame graphs we’ll find the function responsible for computing the internet checksum as part of the existing TCP segmentation offloading (`tun.checksum()`, inlined with `tun.checksumNoFold()`). It contributes to a modest percentage of perf samples (6.6% on the sender) before making any changes. After reducing the cost of the kernel’s UDP stack, the relative cost of TUN checksum offload increases with throughput, and it becomes our next candidate to optimize.
The existing `tun.checksumNoFold()` function was this:
```
`// TODO: Explore SIMD and/or other assembly optimizations.
func checksumNoFold(b []byte, initial uint64) uint64 {
ac := initial
i := 0
n := len(b)
for n \>= 4 {
ac += uint64(binary.BigEndian.Uint32(b[i : i+4]))
n -= 4
i += 4
}
for n \>= 2 {
ac += uint64(binary.BigEndian.Uint16(b[i : i+2]))
n -= 2
i += 2
}
if n == 1 {
ac += uint64(b[i]) \<\< 8
}
return ac
}`
```
It is responsible for summing the bytes in `b` with `initial`, and returning the sum as a uint64. Internet checksums are uint16 values, which the return from this function gets folded into. But why are we returning a uint64 to begin with? Because there is already one existing optimization present here. We sum 4 bytes at a time, instead of 2. This can cut checksum cost in half. RFC 1071 describes the mathematical properties that enable this optimization along with the concept of folding:
> On machines that have word-sizes that are multiples of 16 bits, it is possible to develop even more efficient implementations. Because addition is associative, we do not have to sum the integers in the order they appear in the message. Instead we can add them in “parallel” by exploiting the larger word size.
> To compute the checksum in parallel, simply do a 1’s complement addition of the message using the native word size of the machine. For example, on a 32-bit machine we can add 4 bytes at a time: [A,B,C,D]+’… When the sum has been computed, we “fold” the long sum into 16 bits by adding the 16-bit segments. Each 16-bit addition may produce new end-around carries that must be added.
There is one more low-hanging optimization available to us — unwinding the loops! Checking the length of `b` after every summation is expensive overhead, especially for larger packets. RFC 1071 also describes this optimization:
> To reduce the loop overhead, it is often useful to “unwind” the inner sum loop, replicating a series of addition commands within one loop traversal. This technique often provides significant savings, although it may complicate the logic of the program considerably.
After applying some unwinding we end up with this function, which has some repetitive bits omitted for the sake of brevity:
```
`// TODO: Explore SIMD and/or other assembly optimizations.
// TODO: Test native endian loads. See RFC 1071 section 2 part B.
func checksumNoFold(b []byte, initial uint64) uint64 {
ac := initial
for len(b) \>= 128 {
ac += uint64(binary.BigEndian.Uint32(b[:4]))
ac += uint64(binary.BigEndian.Uint32(b[4:8]))
// (omitted) continues to 128
b = b[128:]
}
if len(b) \>= 64 {
ac += uint64(binary.BigEndian.Uint32(b[:4]))
ac += uint64(binary.BigEndian.Uint32(b[4:8]))
// (omitted) continues to 64
b = b[64:]
}
if len(b) \>= 32 {
ac += uint64(binary.BigEndian.Uint32(b[:4]))
ac += uint64(binary.BigEndian.Uint32(b[4:8]))
// (omitted) continues to 32
b = b[32:]
}
if len(b) \>= 16 {
ac += uint64(binary.BigEndian.Uint32(b[:4]))
ac += uint64(binary.BigEndian.Uint32(b[4:8]))
ac += uint64(binary.BigEndian.Uint32(b[8:12]))
ac += uint64(binary.BigEndian.Uint32(b[12:16]))
b = b[16:]
}
if len(b) \>= 8 {
ac += uint64(binary.BigEndian.Uint32(b[:4]))
ac += uint64(binary.BigEndian.Uint32(b[4:8]))
b = b[8:]
}
if len(b) \>= 4 {
ac += uint64(binary.BigEndian.Uint32(b))
b = b[4:]
}
if len(b) \>= 2 {
ac += uint64(binary.BigEndian.Uint16(b))
b = b[2:]
}
if len(b) == 1 {
ac += uint64(b[0]) \<\< 8
}
return ac
}`
```
This optimization reduced the run time of the function by \~57%, as evidenced by the output of [benchstat](https://pkg.go.dev/golang.org/x/perf/cmd/benchstat):
```
`$ benchstat old.txt new.txt
goos: linux
goarch: amd64
pkg: golang.zx2c4.com/wireguard/tun
cpu: 12th Gen Intel(R) Core(TM) i5-12400
│ old.txt │ new.txt │
│ sec/op │ sec/op vs base │
Checksum/64-12 10.670n ± 2% 4.769n ± 0% -55.30% (p=0.000 n=10)
Checksum/128-12 19.665n ± 2% 8.032n ± 0% -59.16% (p=0.000 n=10)
Checksum/256-12 37.68n ± 1% 16.06n ± 0% -57.37% (p=0.000 n=10)
Checksum/512-12 76.61n ± 3% 32.13n ± 0% -58.06% (p=0.000 n=10)
Checksum/1024-12 160.55n ± 4% 64.25n ± 0% -59.98% (p=0.000 n=10)
Checksum/1500-12 231.05n ± 7% 94.12n ± 0% -59.26% (p=0.000 n=10)
Checksum/2048-12 309.5n ± 3% 128.5n ± 0% -58.48% (p=0.000 n=10)
Checksum/4096-12 603.8n ± 4% 257.2n ± 0% -57.41% (p=0.000 n=10)
Checksum/8192-12 1185.0n ± 3% 515.5n ± 0% -56.50% (p=0.000 n=10)
Checksum/9000-12 1328.5n ± 5% 564.8n ± 0% -57.49% (p=0.000 n=10)
Checksum/9001-12 1340.5n ± 3% 564.8n ± 0% -57.87% (p=0.000 n=10)
geomean 185.3n 77.99n -57.92%
`
```
This optimization also translated to a 10% throughput improvement for some of the environments we tested. Now, on to the overall results.
## [Results](#results)
Applying UDP segmentation offload, UDP receive coalescing, and checksum unwinding resulted in significant throughput improvements for wireguard-go, and so also in the Tailscale client.
wireguard-go (c6i.8xlarge) with UDP GSO, GRO, and checksum unwinding:
```
`ubuntu@c6i-8xlarge-1:\~$ iperf3 -i 0 -c c6i-8xlarge-2-wg -t 10 -C cubic -V
iperf 3.9
Linux c6i-8xlarge-1 5.19.0-1022-aws #23\~22.04.1-Ubuntu SMP Fri Mar 17 15:38:24 UTC 2023 x86\_64
Control connection MSS 1368
Time: Wed, 12 Apr 2023 23:58:19 GMT
Connecting to host c6i-8xlarge-2-wg, port 5201
Cookie: efpxfeszrxxsjdo643josagi2akj3f2lcmdh
TCP MSS: 1368 (default)
[ 5] local 10.9.9.1 port 35218 connected to 10.9.9.2 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 8.53 GBytes 7.32 Gbits/sec 0 3.14 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 8.53 GBytes 7.32 Gbits/sec 0 sender
[ 5] 0.00-10.05 sec 8.53 GBytes 7.29 Gbits/sec receiver
CPU Utilization: local/sender 10.4% (0.2%u/10.2%s), remote/receiver 20.8% (0.8%u/20.0%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
wireguard-go (i5-12400) with UDP GSO, GRO, and checksum unwinding:
```
`jwhited@i5-12400-1:\~$ iperf3 -i 0 -c i5-12400-2-wg -t 10 -C cubic -V
iperf 3.9
Linux i5-12400-1 5.15.0-69-generic #76-Ubuntu SMP Fri Mar 17 17:19:29 UTC 2023 x86\_64
Control connection MSS 1368
Time: Wed, 12 Apr 2023 23:42:52 GMT
Connecting to host i5-12400-2-wg, port 5201
Cookie: q6hm54yvcbxdrsnh2foexkunzdsdudwy5wfj
TCP MSS: 1368 (default)
[ 5] local 10.9.9.1 port 43006 connected to 10.9.9.2 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 15.2 GBytes 13.0 Gbits/sec 1212 3.01 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 15.2 GBytes 13.0 Gbits/sec 1212 sender
[ 5] 0.00-10.04 sec 15.2 GBytes 13.0 Gbits/sec receiver
CPU Utilization: local/sender 18.9% (0.3%u/18.6%s), remote/receiver 4.0% (0.2%u/3.8%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
**With these performance improvements, Tailscale joins the 10Gb/s club on bare metal Linux, and wireguard-go pushes past (for now) the in-kernel WireGuard implementation on that hardware.** The AWS c6i.8xlarge instances hit a wall at 7.3Gb/s that appears to be an artificial limit of the underlay network. We were unable to exceed a similar bitrate for UDP packets with no WireGuard involved.
## [Note about UDP GSO in-hardware](#note-about-udp-gso-in-hardware)
Just like TSO is the “in-hardware” cousin of GSO, UDP GSO has a similar variant, listed as `tx-udp-segmentation` by ethtool:
```
`jwhited@i5-12400-1:\~$ ethtool -k enp1s0f0np0 | grep udp-seg
tx-udp-segmentation: on`
```
It extends the delayed segmentation of datagrams through to the device, and our transmit direction flow now looks like this:
This hardware support exists in the 25G NICs we used on the i5-12400 systems. It did improve throughput slightly (5%) for that hardware, but it really shined for some of the older generation CPUs. For one example, here’s an [E3-1230-V2](https://www.intel.com/content/www/us/en/products/sku/65732/intel-xeon-processor-e31230-v2-8m-cache-3-30-ghz/specifications.html) (released Q2 2012) system with the same NIC.
E3-1230-V2 over [wireguard-go@052af4a](https://git.zx2c4.com/wireguard-go/tree/?id=052af4a8072bbbd3bfe7edf46fe3c1b350f71f08):
```
`jwhited@e3-1230-v2:\~$ iperf3 -i 0 -c i5-12400-1-wg -t 10 -C cubic -V
iperf 3.9
Linux e3-1230-v2 5.15.0-67-generic #74-Ubuntu SMP Wed Feb 22 14:14:39 UTC 2023 x86\_64
Control connection MSS 1368
Time: Thu, 13 Apr 2023 02:27:23 GMT
Connecting to host i5-12400-1-wg, port 5201
Cookie: pcfb7wqlh653l3r6r4oxxjenfxh4hdlqowho
TCP MSS: 1368 (default)
[ 5] local 10.9.9.3 port 35310 connected to 10.9.9.1 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 3.91 GBytes 3.36 Gbits/sec 0 3.09 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 3.91 GBytes 3.36 Gbits/sec 0 sender
[ 5] 0.00-10.05 sec 3.91 GBytes 3.34 Gbits/sec receiver
CPU Utilization: local/sender 10.6% (0.4%u/10.2%s), remote/receiver 2.0% (0.0%u/2.0%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
E3-1230-V2 over wireguard-go with UDP GSO, GRO, checksum unwinding, and tx-udp-segmentation off:
```
`jwhited@e3-1230-v2:\~$ sudo ethtool -K enp1s0f0np0 tx-udp-segmentation off
jwhited@e3-1230-v2:\~$ iperf3 -i 0 -c i5-12400-1-wg -t 10 -C cubic -V
iperf 3.9
Linux e3-1230-v2 5.15.0-67-generic #74-Ubuntu SMP Wed Feb 22 14:14:39 UTC 2023 x86\_64
Control connection MSS 1368
Time: Thu, 13 Apr 2023 02:28:12 GMT
Connecting to host i5-12400-1-wg, port 5201
Cookie: 6rtbzadj2on7igc7bt2hfhphdg2ebfgwxzim
TCP MSS: 1368 (default)
[ 5] local 10.9.9.3 port 58036 connected to 10.9.9.1 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 5.65 GBytes 4.86 Gbits/sec 0 3.14 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 5.65 GBytes 4.86 Gbits/sec 0 sender
[ 5] 0.00-10.04 sec 5.65 GBytes 4.84 Gbits/sec receiver
CPU Utilization: local/sender 19.1% (0.6%u/18.5%s), remote/receiver 1.9% (0.1%u/1.8%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
E3-1230-V2 over wireguard-go with UDP GSO, GRO, checksum unwinding, and tx-udp-segmentation on:
```
`jwhited@e3-1230-v2:\~$ sudo ethtool -K enp1s0f0np0 tx-udp-segmentation on
jwhited@e3-1230-v2:\~$ iperf3 -i 0 -c i5-12400-1-wg -t 10 -C cubic -V
iperf 3.9
Linux e3-1230-v2 5.15.0-67-generic #74-Ubuntu SMP Wed Feb 22 14:14:39 UTC 2023 x86\_64
Control connection MSS 1368
Time: Thu, 13 Apr 2023 02:28:58 GMT
Connecting to host i5-12400-1-wg, port 5201
Cookie: lod6fulhls3wvtqy7uoakmldifdtcc3nbvfv
TCP MSS: 1368 (default)
[ 5] local 10.9.9.3 port 46724 connected to 10.9.9.1 port 5201
Starting Test: protocol: TCP, 1 streams, 131072 byte blocks, omitting 0 seconds, 10 second test, tos 0
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-10.00 sec 7.68 GBytes 6.59 Gbits/sec 2 3.12 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
Test Complete. Summary Results:
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 7.68 GBytes 6.59 Gbits/sec 2 sender
[ 5] 0.00-10.05 sec 7.68 GBytes 6.56 Gbits/sec receiver
CPU Utilization: local/sender 25.6% (1.0%u/24.6%s), remote/receiver 8.0% (0.3%u/7.7%s)
snd\_tcp\_congestion cubic
rcv\_tcp\_congestion cubic`
```
**That’s a 35% increase in throughput with hardware UDP segmentation offload enabled, and nearly a 2x increase over the baseline.**
## [Conclusions](#conclusions)
Continuing on our journey to improve packet processing overhead led us to discover and use relatively young Linux kernel features. We made use of UDP generic segmentation offload, UDP generic receive offload, and checksum loop unwinding, enabling us to reach a new milestone — surpassing 10Gb/s over Tailscale.
Thanks to [Adrian Dewhurst](https://github.com/sailorfrag) for his detailed review and feedback, to [Jason A. Donenfeld](https://www.zx2c4.com/) for his ongoing review of our patches, and to our designer [Danny Pagano](https://dannypagano.com/) for the illustrations.
Share
Author
Jordan Whited
Author
Jordan Whited
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