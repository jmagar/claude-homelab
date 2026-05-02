Enhance UDP Throughput for QUIC and HTTP/3 on Linux
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 16, 2023
# Increasing QUIC and UDP throughput
Hi, we’re back to talk about performance. You might remember us from our previous work ([post #1](/blog/throughput-improvements/) & [post #2](/blog/more-throughput/)), which increased TCP throughput over [wireguard-go](https://git.zx2c4.com/wireguard-go/about/), the userspace [WireGuard](https://www.wireguard.com/)® implementation that Tailscale uses. We’re releasing a set of changes that builds on this foundation, significantly improving UDP throughput on Linux. As with the previous work, we [intend to upstream](https://github.com/WireGuard/wireguard-go/pull/97) these changes to WireGuard.
The [User Datagram Protocol (UDP)](https://en.wikipedia.org/wiki/User_Datagram_Protocol) is a connectionless transport protocol, and unlike the [Transmission Control Protocol (TCP)](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) provides no delivery or ordering guarantees on its own. These properties make UDP appropriate for real-time applications, e.g. gaming and video conferencing, where dropping a packet is preferred over a delayed retransmission. In recent years, the usage of UDP has dramatically increased with the emergence of [HTTP/3](https://en.wikipedia.org/wiki/HTTP/3) and the [QUIC protocol](https://en.wikipedia.org/wiki/QUIC).
**Our changes improve throughput for HTTP/3, QUIC, and other UDP-based applications through the use of **[**segmentation offloads**](https://www.kernel.org/doc/html/latest/networking/segmentation-offloads.html)**. UDP throughput over Tailscale increases 4x on bare metal Linux, and pushes past (for now) the in-kernel WireGuard implementation on that hardware.** You can experience these improvements in Tailscale v1.54. Continue reading to learn more, or jump down to the [Results](#results) section if you just want numbers.
## Background
wireguard-go is the foundation of the dataplane in Tailscale. It receives packets from the operating system via a [TUN](https://en.wikipedia.org/wiki/TUN/TAP) interface, encrypts them, and sends them to a remote peer via a UDP socket. Packets flowing in the opposite direction are read from the UDP socket, decrypted, and written back to the kernel’s TUN interface driver.
The changes we made in Tailscale v1.36 and v1.40 updated this packet pipeline to [greatly increase TCP throughput over wireguard-go](/blog/more-throughput/#results). In both cases we focused on increasing the number of packets shuffled end-to-end per I/O operation. On the TUN driver side this involved TCP segmentation offload (TSO) and generic receive offload (GRO). On the UDP socket side we leveraged UDP generic segmentation offload (UDP GSO) and UDP generic receive offload (UDP GRO). Both segmentation and receive offloads enable multiple packets to pass through the stack as a single element. Segmentation offloads involve segmenting the single “monster” packet closest to the transmit boundary where natural-sized packets are to be written. Receive offloads involve coalescing multiple packets together to form a “monster” packet closest to the receive boundary where natural-sized packets are expected to be read.
Where these offloads were leveraged for UDP, UDP was acting as the underlay protocol. The offloads we implemented on the TUN side were specific to TCP, and did not apply for UDP overlay traffic. This resulted in little benefit for UDP flows **over wireguard-go**. TCP has long been the transport protocol of choice for high throughput applications, so initially focusing on TCP throughput made sense. However, with the emergence of HTTP/3 and QUIC, this is starting to shift.
## HTTP/3 and QUIC
HTTP/3 is the successor to HTTP/2, and it uses QUIC, a relatively new multiplexed transport protocol built on UDP.
QUIC has a number of benefits over TCP, including but not limited to:
* Tight integration with TLS, making it less susceptible to middleboxes messing with or depending upon transport layer metadata
* A faster connection handshake (assuming HTTP/2 over TCP isn’t required to bootstrap)
* Being less susceptible to head-of-line blocking; stream-awareness stretches from transport protocol to HTTP/3
* Enablement of rapid congestion control evolution, as it exists in user space
Depending on who you ask, [HTTP/3 is already supported by \~27% of web servers and networks worldwide.](https://pulse.internetsociety.org/blog/why-http-3-is-eating-the-world) So, HTTP/3 and QUIC adoption is on the rise, and it’s time we extended our performance work to benefit it.
## Baseline
**Disclaimer about benchmarks**: This post contains benchmarks! These benchmarks are reproducible at the time of writing, and we provide details about the environments we ran them in. But benchmark results tend to vary across environments, and they also tend to go stale as time progresses. Your mileage may vary.
We need to set a UDP throughput baseline for later comparison. In our previous posts we conducted TCP benchmarks with [iperf3](https://github.com/esnet/iperf), but at the time of writing iperf3 does not support UDP GSO/GRO. Without this support it won’t reflect real-world performance in comparison to widely-used QUIC implementations. So, we will be using [secnetperf](https://github.com/microsoft/msquic/tree/main/src/perf#secured-network-performance-testing), a utility of [msquic](https://github.com/microsoft/msquic), instead. To quote the msquic README:
>
> MsQuic is a Microsoft implementation of the
[> IETF QUIC
](https://datatracker.ietf.org/wg/quic/about/)> protocol. It is cross-platform, written in C and designed to be a general purpose QUIC library. MsQuic also has C++ API wrapper classes and exposes interop layers for both Rust and C#.
>
One of msquic’s maintainers, Nick Banks, has worked inside the IETF and proposed a [QUIC performance protocol](https://datatracker.ietf.org/doc/html/draft-banks-quic-performance-00) for testing the performance characteristics of a QUIC implementation. secnetperf implements this protocol.
Using secnetperf we baselined QUIC throughput for [wireguard-go@2e0774f](https://git.zx2c4.com/wireguard-go/commit/?id=2e0774f246fb4fc1bd5cb44584d033038c89174e) and in-kernel WireGuard between two pairs of hosts, both running Ubuntu 22.04 with the [LTS Hardware Enablement kernel](https://ubuntu.com/kernel/lifecycle) available at time of writing:
* 2 x AWS c6i.8xlarge instance types
* 2 x “bare metal” servers powered by [i5-12400](https://ark.intel.com/content/www/us/en/ark/products/134586/intel-core-i512400-processor-18m-cache-up-to-4-40-ghz.html) CPUs & Mellanox MCX512A-ACAT NICs
The AWS instances are in the same region and availability zone:
```
`ubuntu@c6i-8xlarge-1:\~$ ec2metadata | grep -E 'instance-type:|availability-zone:'
availability-zone: us-east-2b
instance-type: c6i.8xlarge
ubuntu@c6i-8xlarge-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ cat /sys/module/intel\_idle/parameters/max\_cstate
1
ubuntu@c6i-8xlarge-2:\~$ ec2metadata | grep -E 'instance-type:|availability-zone:'
availability-zone: us-east-2b
instance-type: c6i.8xlarge
ubuntu@c6i-8xlarge-2:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ cat /sys/module/intel\_idle/parameters/max\_cstate
1
ubuntu@c6i-8xlarge-1:\~$ ping 172.31.23.111 -c 5 -q
PING 172.31.23.111 (172.31.23.111) 56(84) bytes of data.
--- 172.31.23.111 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4094ms
rtt min/avg/max/mdev = 0.109/0.126/0.168/0.022 ms
`
```
The i5-12400 CPU is a modern (released Q1 2022) desktop-class chip, available for $150 USD at the time of writing. The Mellanox NICs are connected at 25Gb/s via a direct attach copper (DAC) cable:
```
`jwhited@i5-12400-1:\~$ lscpu | grep Model.name && cpupower frequency-info -d && cpupower frequency-info -p
Model name: 12th Gen Intel(R) Core(TM) i5-12400
analyzing CPU 5:
driver: intel\_pstate
analyzing CPU 11:
current policy: frequency should be within 800 MHz and 4.40 GHz.
The governor "performance" may decide which speed to use
within this range.
jwhited@i5-12400-1:\~$ sudo ethtool enp1s0f0np0 | grep Speed && sudo ethtool -i enp1s0f0np0 | egrep 'driver|^version'
Speed: 25000Mb/s
driver: mlx5\_core
version: 6.2.0-35-generic
jwhited@i5-12400-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ cat /sys/module/intel\_idle/parameters/max\_cstate
1
jwhited@i5-12400-2:\~$ lscpu | grep Model.name && cpupower frequency-info -d && cpupower frequency-info -p
Model name: 12th Gen Intel(R) Core(TM) i5-12400
analyzing CPU 1:
driver: intel\_pstate
analyzing CPU 10:
current policy: frequency should be within 800 MHz and 4.40 GHz.
The governor "performance" may decide which speed to use
within this range.
jwhited@i5-12400-2:\~$ sudo ethtool enp1s0f0np0 | grep Speed && sudo ethtool -i enp1s0f0np0 | egrep 'driver|^version'
Speed: 25000Mb/s
driver: mlx5\_core
version: 6.2.0-35-generic
jwhited@i5-12400-2:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ cat /sys/module/intel\_idle/parameters/max\_cstate
1
jwhited@i5-12400-1:\~$ ping 10.0.0.20 -c 5 -q
PING 10.0.0.20 (10.0.0.20) 56(84) bytes of data.
--- 10.0.0.20 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4100ms
rtt min/avg/max/mdev = 0.211/0.229/0.299/0.034 ms
`
```
c6i.8xlarge over in-kernel WireGuard:
```
`ubuntu@c6i-8xlarge-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ ./secnetperf -stats:1 -test:tput -exec:maxtput -target:c6i-8xlarge-2-wg -download:10000 -timed:1 -encrypt:0
Started!
[conn][0x55da01e608b0] STATS: EcnCapable=0 RTT=2978 us SendTotalPackets=40942 SendSuspectedLostPackets=3 SendSpuriousLostPackets=0 SendCongestionCount=0 SendEcnCongestionCount=0 RecvTotalPackets=2603832 RecvReorderedPackets=0 RecvDroppedPackets=0 RecvDuplicatePackets=0 RecvDecryptionFailures=0
Result: 3425635581 bytes @ 2739682 kbps (10003.016 ms).
App Main returning status 0
`
```
c6i.8xlarge over [wireguard-go@2e0774f](https://git.zx2c4.com/wireguard-go/commit/?id=2e0774f246fb4fc1bd5cb44584d033038c89174e):
```
`ubuntu@c6i-8xlarge-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ ./secnetperf -stats:1 -test:tput -exec:maxtput -target:c6i-8xlarge-2-wg -download:10000 -timed:1 -encrypt:0
Started!
[conn][0x55b6b6d718b0] STATS: EcnCapable=0 RTT=2439 us SendTotalPackets=41663 SendSuspectedLostPackets=43 SendSpuriousLostPackets=40 SendCongestionCount=8 SendEcnCongestionCount=0 RecvTotalPackets=2095421 RecvReorderedPackets=0 RecvDroppedPackets=0 RecvDuplicatePackets=0 RecvDecryptionFailures=0
Result: 2756939372 bytes @ 2204985 kbps (10002.565 ms).
App Main returning status 0
`
```
i5-12400 over in-kernel WireGuard:
```
`jwhited@i5-12400-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ ./secnetperf -stats:1 -exec:maxtput -test:tput -target:i5-12400-2-wg -download:10000 -timed:1 -encrypt:0
Started!
[conn][0x562e0ffe4990] STATS: EcnCapable=0 RTT=254 us SendTotalPackets=89475 SendSuspectedLostPackets=268 SendSpuriousLostPackets=201 SendCongestionCount=259 SendEcnCongestionCount=0 RecvTotalPackets=5152896 RecvReorderedPackets=0 RecvDroppedPackets=0 RecvDuplicatePackets=0 RecvDecryptionFailures=0
Result: 6777820234 bytes @ 5422105 kbps (10000.278 ms).
App Main returning status 0
`
```
i5-12400 over [wireguard-go@2e0774f](https://git.zx2c4.com/wireguard-go/commit/?id=2e0774f246fb4fc1bd5cb44584d033038c89174e):
```
`jwhited@i5-12400-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ ./secnetperf -stats:1 -exec:maxtput -test:tput -target:i5-12400-2-wg -download:10000 -timed:1 -encrypt:0
Started!
[conn][0x5653ff74f980] STATS: EcnCapable=0 RTT=4407 us SendTotalPackets=54768 SendSuspectedLostPackets=74 SendSpuriousLostPackets=69 SendCongestionCount=26 SendEcnCongestionCount=0 RecvTotalPackets=2792345 RecvReorderedPackets=0 RecvDroppedPackets=0 RecvDuplicatePackets=0 RecvDecryptionFailures=0
Result: 3672645654 bytes @ 2936870 kbps (10004.241 ms).
App Main returning status 0
`
```
In our previous posts we analyzed flame graphs ([post #1](/blog/throughput-improvements/#linux-perf-and-flame-graphs) & [post #2](/blog/more-throughput/#linux-perf-and-flame-graphs)) which highlighted where CPU cycle/byte efficiency could improve through the kernel networking stack and wireguard-go. The results of this analysis lead us to implement transport layer offloads at both ends of wireguard-go, which improved throughput for TCP traffic on the overlay. Now, we need to build on this work to benefit UDP traffic over wireguard-go just the same. Enter tx-udp-segmentation.
## tx-udp-segmentation
tx-udp-segmentation is the ethtool short name for UDP segmentation offload as a network device feature:
```
`ubuntu@c6i-8xlarge-1:\~$ ethtool --show-features wg0 | grep tx-udp-segme
tx-udp-segmentation: on
`
```
NETIF\_F\_GSO\_UDP\_L4 is the Linux kernel symbol used to define it in code. To quote [kernel documentation](https://github.com/torvalds/linux/blob/v6.2/Documentation/networking/netdev-features.rst?plain=1#L119):
>
> NETIF_F_GSO_UDP_L4 accepts a single UDP header with a payload that exceeds gso_size. On segmentation, it segments the payload on gso_size boundaries and replicates the network and UDP headers (fixing up the last one if less than gso_size).
>
This netdev feature was [added in Linux v4.18](https://github.com/torvalds/linux/commit/83aa025f535f76733e334e3d2a4d8577c8441a7e), and more recently [added as a feature that can be toggled in the TUN driver in Linux v6.2](https://github.com/torvalds/linux/commit/399e0827642f6a8bcae24277fe08e80e7e4bb891). The TUN driver support in v6.2 was the missing piece needed to improve UDP throughput **over wireguard-go**. With it toggled on, wireguard-go can receive “monster” UDP datagrams from the kernel:
The opposite direction works similarly. It does not require an explicit netdev feature to support UDP GRO, and simply piggybacks on the [same virtio network infrastructure](https://github.com/torvalds/linux/blob/v6.2/include/uapi/linux/virtio_net.h#L136) for coalescing support.
Now, on to the overall results.
## Results
Applying TUN UDP GSO/GRO resulted in significant throughput improvements for wireguard-go, and so also in the Tailscale client.
wireguard-go (c6i.8xlarge) with TUN UDP GSO/GRO:
```
`ubuntu@c6i-8xlarge-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ ./secnetperf -stats:1 -test:tput -exec:maxtput -target:c6i-8xlarge-2-wg -download:10000 -timed:1 -encrypt:0
Started!
[conn][0x556b755e68b0] STATS: EcnCapable=0 RTT=3654 us SendTotalPackets=91459 SendSuspectedLostPackets=3 SendSpuriousLostPackets=0 SendCongestionCount=0 SendEcnCongestionCount=0 RecvTotalPackets=6856927 RecvReorderedPackets=0 RecvDroppedPackets=0 RecvDuplicatePackets=0 RecvDecryptionFailures=0
Result: 9015481229 bytes @ 7209669 kbps (10003.767 ms).
App Main returning status 0
`
```
wireguard-go (i5-12400) with TUN UDP GSO/GRO:
```
`jwhited@i5-12400-1:\~/msquic/artifacts/bin/linux/x64\_Release\_openssl3$ ./secnetperf -stats:1 -exec:maxtput -test:tput -target:i5-12400-2-wg -download:10000 -timed:1 -encrypt:0
Started!
[conn][0x56493dfd09a0] STATS: EcnCapable=0 RTT=1216 us SendTotalPackets=165033 SendSuspectedLostPackets=64 SendSpuriousLostPackets=61 SendCongestionCount=53 SendEcnCongestionCount=0 RecvTotalPackets=11845268 RecvReorderedPackets=25267 RecvDroppedPackets=0 RecvDuplicatePackets=0 RecvDecryptionFailures=0
Result: 15574671184 bytes @ 12458214 kbps (10001.222 ms).
App Main returning status 0
`
```
**With this new set of changes, UDP throughput over Tailscale increases 4x on bare metal Linux, and pushes past (for now) the in-kernel WireGuard implementation on that hardware.** The AWS c6i.8xlarge instances hit a wall at \~7Gb/s that appears to be an artificial limit of the underlay network.
## rx-udp-gro-forwarding and rx-gro-list
It’s important to cover two network device features in the Linux kernel that relate to UDP throughput in forwarding topologies, i.e. a packet comes in one interface and leaves another.
The first is rx-udp-gro-forwarding, which to quote its [comment from the Linux kernel](https://github.com/torvalds/linux/blob/v6.2/include/linux/netdev_features.h#L87):
>
> /* Allow UDP GRO for forwarding */
>
Without rx-udp-gro-forwarding enabled on the receiving interface, UDP packets that are forwarded, i.e. not destined to a local socket, will not be candidates for coalescing. This limits the effects of GRO through the rest of the stack, reducing throughput. Initially UDP GRO for forwarded packets was enabled by default, prior to this feature’s existence. This was unintentional as mentioned by the [kernel commit introducing the feature](https://github.com/torvalds/linux/commit/36707061d6bafc254b3dfc23a8bb95451812b233):
>
> Commit
[> 9fd1ff5
](https://github.com/torvalds/linux/commit/9fd1ff5d2ac7181844735806b0a703c942365291)> (“udp: Support UDP fraglist GRO/GSO.”) actually not only added a support for fraglisted UDP GRO, but also tweaked some logics the way that non-fraglisted UDP GRO started to work for forwarding too.
>
It worked as expected, but the intent was to leave the previous default behavior as-is:
>
> Tests showed that currently forwarding and NATing of plain UDP GRO packets are performed fully correctly, regardless if the target netdevice has a support for hardware/driver GSO UDP L4 or not.
>
We recommend [enabling rx-udp-gro-forwarding on your default route interface](/s/ethtool-config-udp-gro) if you are running Tailscale version 1.54 or later as a subnet router or exit node with a Linux 6.2 or later kernel. Initially this will be a soft recommendation via the CLI, and we are considering alternatives to make this easier to surface and enable in the future.
This same commit also makes mention of rx-gro-list / NETIF\_F\_GRO\_FRAGLIST:
>
> If both NETIF_F_GRO_FRAGLIST and NETIF_F_GRO_UDP_FWD are set, fraglisted GRO takes precedence. This keeps the current behaviour and is generally more optimal for now, as the number of NICs with hardware USO offload is relatively small.
>
We just implemented “hardware USO” (tx-udp-segmentation), so “generally more optimal” does not apply. We recommend leaving rx-gro-list disabled. With rx-gro-list taking precedence over rx-udp-gro-forwarding, the effects of UDP GRO will be limited, reducing UDP throughput. rx-gro-list is a compelling, performance-enhancing feature, but the Linux kernel does not currently support a method to carry its benefits through the TUN driver. Instead, packets are segmented **before** being transmitted out a TUN device.
## C-States
Looking back at the Baseline section you may have noticed we recorded the output of `cat /sys/module/intel\_idle/parameters/max\_cstate`. Why? What is a C-State? Why do we want to limit it?
C-States represent CPU core sleep level. The states are numbered and start at 0. A core in C-State 0 (C0) is awake and ready to accept instructions. As the C-State gets deeper you save more power (C1, C2, …), but you also incur an increasingly larger latency penalty when transitioning back to an awake state (Cn =\> C0). This latency penalty can reduce network throughput.
When testing a forwarding topology with the bare metal machines, we observed cores on the forwarding node entering a deeper sleep with TUN UDP GSO/GRO, than without. This correlated with lower throughput with TUN UDP GSO/GRO, than without.
To measure and observe what was happening we used [turbostat](https://manpages.ubuntu.com/manpages/jammy/man8/turbostat.8.html), which reports processor topology, frequency, and idle power-state statistics (C-States), among other things. We’ll compare turbostat output from 2 secnetperf runs. The first is [wireguard-go@2e0774f](https://git.zx2c4.com/wireguard-go/commit/?id=2e0774f246fb4fc1bd5cb44584d033038c89174e), max\_cstate = 9.
```
`Result: 3825021302 bytes @ 3059741 kbps (10000.900 ms).
jwhited@i5-12400-2:\~$ sudo turbostat --show Core,CPU,Avg\_MHZ,Busy%,Bzy\_MHz,POLL%,C1E%,C6%,C8%,C10% --quiet sleep 5
5.001241 sec
Core CPU Busy% Bzy\_MHz POLL% C1E% C6% C8% C10%
- - 12.76 3905 0.39 28.25 2.08 6.67 50.58
0 0 15.48 3850 0.03 25.31 1.79 5.82 51.90
0 1 7.75 3876 0.02 10.50 1.37 4.18 76.35
1 2 12.15 3864 1.23 54.73 2.36 8.07 23.08
1 3 6.95 3789 0.78 28.31 1.44 4.11 59.52
2 4 17.08 3993 0.21 30.32 2.66 7.64 42.77
2 5 18.68 4037 0.40 35.10 3.28 9.42 33.82
3 6 14.48 3819 0.73 47.79 1.98 7.06 29.09
3 7 3.88 3711 0.29 10.44 0.91 1.82 83.14
4 8 18.91 3946 0.41 28.76 3.07 10.74 39.07
4 9 16.77 4009 0.35 34.73 2.12 8.68 38.04
5 10 12.72 3849 0.16 21.80 2.30 7.30 56.22
5 11 8.22 3743 0.09 11.24 1.66 5.19 73.92
`
```
The second is wireguard-go with TUN UDP GSO/GRO, max\_cstate = 9.
```
`Result: 1729858286 bytes @ 1383646 kbps (10001.732 ms).
jwhited@i5-12400-2:\~$ sudo turbostat --show Core,CPU,Avg\_MHZ,Busy%,Bzy\_MHz,POLL%,C1E%,C6%,C8%,C10% --quiet sleep 5
5.001498 sec
Core CPU Busy% Bzy\_MHz POLL% C1E% C6% C8% C10%
- - 6.68 3269 0.04 13.62 0.99 4.96 74.00
0 0 6.53 3498 0.02 10.12 0.78 3.79 78.94
0 1 0.72 3727 0.00 1.67 0.10 0.49 97.05
1 2 5.99 3406 0.04 11.60 1.34 5.87 75.42
1 3 7.70 3159 0.01 5.75 1.39 7.52 77.90
2 4 11.79 2788 0.04 12.89 1.68 3.11 70.92
2 5 6.79 3442 0.08 10.00 0.94 3.72 78.83
3 6 7.41 3534 0.07 14.21 1.37 9.46 67.75
3 7 4.24 3007 0.07 46.16 0.12 0.72 49.03
4 8 9.07 3150 0.05 26.89 1.45 7.92 54.99
4 9 3.42 3506 0.02 3.97 0.39 2.76 89.60
5 10 8.39 3435 0.05 9.85 1.08 7.23 73.74
5 11 8.04 3357 0.04 10.27 1.28 6.87 73.80
`
```
The TUN UDP GSO/GRO run is significantly lower throughput (1.3Gb/s vs 3Gb/s). The CPU cores are not in C0 as often (Busy% - 6.68% vs 12.76%), and the kernel requests they enter the deepest C-State a higher percentage of the time (74.00% vs 50.58%), where the transition to C0 latency penalty is at its highest. The increased CPU cycle/byte efficiency combined with a largely inactive forwarding node load-wise resulted in the CPU idle governor driving C-States in a nonideal fashion.
Performing the same forwarding test again, but with max\_cstate = 1, we get very different results.
[wireguard-go@2e0774f](https://git.zx2c4.com/wireguard-go/commit/?id=2e0774f246fb4fc1bd5cb44584d033038c89174e), max\_cstate = 1:
```
`Result: 3571056796 bytes @ 2856624 kbps (10000.775 ms).
jwhited@i5-12400-2:\~$ sudo turbostat --show Core,CPU,Avg\_MHZ,Busy%,Bzy\_MHz,POLL%,C1E%,C6%,C8%,C10% --quiet sleep 5
5.000964 sec
Core CPU Busy% Bzy\_MHz POLL%
- - 99.77 3997 91.13
0 0 99.77 3999 91.61
0 1 99.77 3999 92.94
1 2 99.77 3992 82.17
1 3 99.77 3992 83.64
2 4 99.77 3995 95.74
2 5 99.77 3995 93.49
3 6 99.77 3998 84.26
3 7 99.77 3998 97.31
4 8 99.77 3999 87.36
4 9 99.77 3999 99.04
5 10 99.77 3996 93.47
5 11 99.77 3996 92.45
`
```
wireguard-go with TUN UDP GSO/GRO, max\_cstate = 1:
```
`Result: 13430811102 bytes @ 10740198 kbps (10004.144 ms).
jwhited@i5-12400-2:\~$ sudo turbostat --show Core,CPU,Avg\_MHZ,Busy%,Bzy\_MHz,POLL%,C1E%,C6%,C8%,C10% --quiet sleep 5
5.001024 sec
Core CPU Busy% Bzy\_MHz POLL%
- - 99.77 3994 80.79
0 0 99.77 3995 77.53
0 1 99.77 3995 82.51
1 2 99.77 3996 81.34
1 3 99.77 3996 78.01
2 4 99.77 3996 73.59
2 5 99.77 3996 89.27
3 6 99.77 3990 69.13
3 7 99.77 3990 96.57
4 8 99.77 3995 76.34
4 9 99.77 3995 84.18
5 10 99.77 3994 75.50
5 11 99.77 3994 85.47
`
```
[wireguard-go@2e0774f](https://git.zx2c4.com/wireguard-go/commit/?id=2e0774f246fb4fc1bd5cb44584d033038c89174e) throughput is roughly the same, but the run with TUN UDP GSO/GRO is dramatically different with throughput jumping from 1.3Gb/s to 10.7Gb/s. There’s no longer a whole lot to compare across turbostat outputs, and the cores are almost always in C0 (Busy% 99.77).
Of note, forwarding throughput increased dramatically with UDP GSO/GRO & max\_cstate = 9 when increasing load on the forwarding node, e.g. introducing a second secnetperf flow or running tcpdump. This was the hint we needed to look closer at CPU idle power management.
Practically speaking it’s unlikely for a forwarding node to only be servicing a single flow with almost nothing else going on load-wise. Additionally, the c6i.8xlarge instance types were immune in this context, as the deepest they go is C1, before any max\_cstate limit. Limiting C-State to a shallow level will always come with trade-offs in power savings and thermal headroom, which will vary by workload, and should be evaluated as such.
## Conclusion
With the emergence of HTTP/3 and QUIC, UDP is now expected to perform similarly, if not better than TCP in networked applications. We have built upon our previous work to support UDP generic segmentation offload and UDP generic receive offload at the TUN layer, multiplying UDP throughput over Tailscale by a factor of 4.
Thanks to [Jason A. Donenfeld](https://www.zx2c4.com/) for his ongoing review of our patches, and to our designer [Danny Pagano](https://dannypagano.com/) for the illustrations.
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