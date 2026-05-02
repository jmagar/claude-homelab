netaddr.IP: a new IP address type for Go
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 09, 2021
# netaddr.IP: a new IP address type for Go
#### Tailscale needed a better IP address type
[Tailscale](https://tailscale.com/) is a networking application so naturally we need to work with
and manipulate IP addresses and sets of IP addresses often.
Being written almost entirely in [Go](https://golang.org/), the obvious choice would be for
Tailscale to use the Go standard library’s
[`net.IP`](https://golang.org/pkg/net/#IP) address type for individual
IPs and [`net.IPNet`](https://golang.org/pkg/net/#IPNet) type for
networks. Unfortunately, the standard library’s types have a number of
problems, so we wrote a new package,
**[`inet.af/netaddr`](https://pkg.go.dev/inet.af/netaddr)** ([github](https://github.com/inetaf/netaddr)) containing
[a new IP type](https://pkg.go.dev/inet.af/netaddr#IP) and [more](#fun).
#### What’s wrong with Go’s net.IP type?
When I was working on Go full time, I filed Go issue
[#18804](https://github.com/golang/go/issues/18804) to track some
things that aren’t great about Go’s IP address:
* It’s mutable. The *[underlying
type](https://golang.org/ref/spec#Types)* of a `net.IP` is just a
`[]byte`, which means anything you pass it to might mutate
it. Immutable data structures are safer, easier to reason about, and
don’t require defensive copies.
* It’s not
*[comparable](https://golang.org/ref/spec#Comparison_operators)*
because a slice in Go is not comparable, which means it doesn’t
support Go’s `==` operator and can’t be used as a map key.
* There are two IP address types in the standard library: `net.IP` for just
a basic IPv4 or IPv6 address, and then also
`net.IPAddr` if you need to support
[IPv6 zone scopes](https://en.wikipedia.org/wiki/IPv6_address#Scoped_literal_IPv6_addresses_(with_zone_index)).
Having two types in the standard library means you
need to decide which type to accept or return from your code, or
have two+ variants, which gets annoying (e.g. Go’s [`Resolver.LookupIP`](https://golang.org/pkg/net/#Resolver.LookupIP)
vs [`Resolver.LookupIPAddr`](https://golang.org/pkg/net/#Resolver.LookupIPAddr))
* It’s large. A Go slice is 3 words (so 24 bytes total on 64-bit
machines) just for the slice header, without counting the underlying
array that the slice points to ([background](https://research.swtch.com/godata)).
So an IP address with Go’s `net.IP` is
two parts: the 24 byte slice header, and then also the 4 or 16 bytes
of IP address. If you want an IPv6 zone, you have to use `net.IPAddr` with
a 16 byte string header also.
* It allocates, [#43451](https://github.com/golang/go/issues/43451). Go’s net package is full of allocations everywhere,
putting more work on the GC and thus the CPU. If you call
`net.ParseIP` or receive a UDP packet, it needs to allocate the
underlying array where it records the IP address, to put that
pointer in the returned slice header of the `net.IP`.
* When parsing an IP from its string form, Go’s IP type [can’t
distinguish](https://play.golang.org/p/hmdnDK0Uy7y) between
[IPv4-mapped IPv6
addresses](https://en.wikipedia.org/wiki/IPv6#IPv4-mapped_IPv6_addresses)
and IPv4 addresses. The Go IP type doesn’t record the original address family.
This is tracked in Go issue [#37921](https://github.com/golang/go/issues/37921).
* It’s a transparent type. The definition of `net.IP` is: `type IP []byte`,
which means its *[underlying type](https://golang.org/ref/spec#Types)* is a byte slice,
which is part of its public API and unchangeable. By contrast, Go’s
[`time.Time`](https://golang.org/pkg/time/#Time) type is defined like `type Time struct { /\* unexported \*/ }`
so it’s free to change without breaking API promises. In fact, Go’s `Time` did change
its representation recently in Go 1.9 when it gained
[transparent monotonic time support](https://golang.org/doc/go1.9#monotonic-time).
That would not have been possible if the type weren’t opaque.
As some trivia: the Go `Time` [used to be transparent prior to Go 1](https://github.com/golang/go/commit/efe3d35fc590bf8b439f56070aa1f070125c6e8e).
Unfortunately we weren’t wise enough at the time to do the same
for the IP address type.
Some of this was by design at the time, before Go 1 locked in the
[compatibility promise](https://golang.org/doc/go1compat) in 2012, but
much of it was just never considered well or predated enough
experience with Go to learn what patterns worked well and which
didn’t. In any case, the Go standard library can’t change much now.
### What do we want?
In summary, this is what we want, and how Go’s `net.IP` fares:
|Feature|Go's `net.IP`|
|Immutable|❌, slice|
|Comparable|❌, slice|
|Small|❌, 28-56 bytes|
|Allocation free|❌, slice's underlying array|
|Supports IPv4 & IPv6|✅|
|Can distinguish IPv4/IPv6|❌, [#37921](https://github.com/golang/go/issues/37921)|
|Supports IPv6 zones|❌, has separate net.IPAddr type|
|Opaque type|❌, defined as `[]byte`|
|Interops with standard library|✅|
So, let’s do better.
This story has several parts:
* [Take 1: wgcfg.IP](#wgcfg)
* [Take 2: netaddr.IP, opaque comparable interfaces](#ifacecmp)
* [Take 3: allocation-free 24 byte representation](#take3)
* [Take 4: uint64s for speed](#uint64s)
* [Take 5: a uint128 type](#uint128)
* [Other inet.af/netaddr fun](#fun)
* [FAQ](#faq)
* [Thanks](#thanks)
### Take 1: `wgcfg.IP`
The story begins in April 2019 with
[`89476f8cb5`](https://github.com/tailscale/wireguard-go/commit/89476f8cb53b7b6e3e67041d204a972b69902565#diff-d6e6f254849cb9119d9aaa21a41ee7f26f499251ce073522bdd89361a316814bR13) in which [David Crawshaw](https://github.com/crawshaw), aware of all these problems,
created an IP type like:
```
`// Internally the address is always represented in its IPv6 form.
// IPv4 addresses use the IPv4-in-IPv6 syntax.
type IP struct {
Addr [16]byte
}
`
```
That’s a bit better:
|Feature|`net.IP`|`wgcfg.IP`|
|Immutable|❌, slice|✅|
|Comparable|❌, slice|✅|
|Small|❌, 28-56B|✅, 16B|
|Allocation free|❌|✅|
|Supports IPv4 & IPv6|✅|✅|
|Can distinguish IPv4/IPv6|❌|❌|
|Supports IPv6 zones|❌|❌|
|Opaque type|❌|❌|
|Interops with standard library|✅|❌, with adapters|
We used that for quite a bit in some places but it wasn’t quite good enough to
start using more widely.
Making it opaque would be easy enough (unexporting the `Addr` field, renaming it to `addr`), but
that still would leave us with the lost address family bit and lack
of IPv6 zones.
### Take 2: netaddr.IP, opaque comparable interfaces
One bit about the Go language specification that many people don’t know is
is that interfaces are [comparable](https://golang.org/ref/spec#Comparison_operators) (support `==` & being map keys),
but they panic at runtime if the
underlying value in the interface is not comparable.
Taking advantage of that to be *comparable*, the [first
version](https://github.com/inetaf/netaddr/commit/7f2e8c8409b7c27c5b44192839c8a94fca95aa21#diff-5aea5a23fd374194efa71dd12c8ddf8ede924f1043045520a8283d2490f40f12R27)
of `netaddr.IP` was represented like this:
```
`type IP struct {
ipImpl
}
type ipImpl interface {
is4() bool
is6() bool
String() string
}
type v4Addr [4]byte
type v6Addr [16]byte
type v6AddrZone struct {
v6Addr
zone string
}
`
```
Notably, the `IP` type there is an opaque struct embedding an
interface. An interface, [being 2 words
wide](https://research.swtch.com/interfaces), is 16 bytes on 64-bit
machines, so the `IP` type here is 16 bytes. That’s better than the
standard library’s 24 byte (3 word) slice header used for `net.IP`.
But both still need to a pointer to the actual bytes of the IP
address. At least with this representation, the interface’s type word
encodes whether the address is IPv4, IPv6, or IPv6 with a zone scope.
It was good in some ways, but not perfect:
|Feature|`net.IP`|`wgcfg.IP`|`"Take 2"`|
|Immutable|❌, slice|✅|✅|
|Comparable|❌, slice|✅|✅|
|Small|❌, 28-56B|✅, 16B|🤷, 20-32B|
|Allocation free|❌|✅|❌|
|Supports IPv4 & IPv6|✅|✅|✅|
|Can distinguish IPv4/IPv6|❌|❌|✅|
|Supports IPv6 zones|❌|❌|✅|
|Opaque type|❌|❌|✅|
|Interops with standard library|✅|❌, with adapters|❌, with adapters|
I got the impression that Crawshaw in particular was very “meh” on
this representation needing to allocate compared to our existing
`wgcfg.IP` type.
Let’s do better.
### Take 3: allocation-free 24 byte representation
At some point I realized that the maximum tolerable size of our IP
address type was 24 bytes: that’s the same size as Go’s `net.IP` slice
header, and Go slices are very common. A `time.Time` is also a 24
byte value type, so surely the compiler deals with 24 byte value types
just fine. But mostly I didn’t want our new IP type to be worse in
any dimension compared to the standard library’s `net.IP`, which is
(in part) 24 bytes. So I somewhat arbitrarily decreed that 24 bytes
was our limit.
Since an IPv6 address is already 16 bytes, that leaves us 8 bytes
remaining in which to encode the following things:
* the address family (v4, v6, or neither, such as the `IP` zero value). There’s
at least two bits.
* the IPv6 zone
Also, we need to be comparable.
Using an interface is out: that’s two words (16 bytes), so that’s too
big. Likewise, a string is also two words (a pointer and length), so
that’s out.
We could play bit-packing games like:
```
`type IP struct {
addr [16]byte
zoneAndFamily uint64
}
`
```
… and try to encode the address family and zone into the 64 `zoneAndFamily` bits, but how?
If we have 1 or 2 bits for the address family, we have 62 or 63 bits
left. Various options included:
* shove the 7-bit ASCII string into the remaining 62 bits. But that
limits us to 8 characters. Even our default `"tailscale0"` interface
name wouldn’t fit.
* encode a zone index into the 62 or 63 bits instead. But then we can’t parse
and represent an interface that the local machine doesn’t have.
* use a zone mapping table, mapping between zone index integers and zone name strings.
That’s what the Go standard library [does internally](https://github.com/golang/go/blob/a38a917aee626a9b9d5ce2b93964f586bf759ea0/src/net/interface.go#L172). But then we’re left susceptible to an attack where an adversary forces
us to parse a bunch of IP addresses with scopes and we forever bloat a mapping
table that we don’t have a good opportunity to ever shrink. The Go standard
library doesn’t need to deal with this, as it only ever maps interfaces that
exist on the machine and doesn’t expose the integers to users in representations;
its [`net.IPAddr.Zone`](https://golang.org/pkg/net/#IPAddr) field is a string.
So, I didn’t like any of those options.
But then I thought of something gross. Or awesome.
We could use a pointer!
```
`type IP struct {
addr [16]byte
zoneAndFamily \*T
}
`
```
Ignoring the zone and actual definition of `T` for now, the address
family is easy: we make three sentinel pointer values to represent the
family, and whether the IP address is the zero value (as opposed to,
say, actually `"0.0.0.0"`).
```
`var (
z0 \*T // nil for the zero value
z4 = new(T) // sentinel value to mean IPv4
z6 = new(T) // sentinel value to mean IPv6 with no zone
)
`
```
But how do we represent the zone string such that it’s comparable so
Go’s `==` works and IP values can be map keys?
Remember, our goal is that this prints `true`:
```
` ip1, \_ := netaddr.ParseIP("fe80::2%eth0")
ip2, \_ := netaddr.ParseIP("fe80::2%eth0")
fmt.Println(ip1 == ip2) // want true
`
```
But comparisons on Go pointers compare the pointer values, not what
they point to. That is, `new(string) != new(string)`.
So we need to make sure that two separate `ParseIP` calls with same
`"eth0"` zone at any point and any time in the program **always return
the same pointer value** for that process.
That implies we need a mapping between these pointer values and their
process-wide-unique names (`"eth0"`, etc). If this sounds a lot like
the earlier problem with the zone indexes, it is, but there’s one
thing that’s different: when shoving a zone index into an integer
above, we didn’t have a way to do any cleanup of the mapping
table. But with a pointer, we can use
[`runtime.SetFinalizer`](https://golang.org/pkg/runtime/#SetFinalizer).
Using `SetFinalizer` is gross and scary and you should think twice
before using it. We sure did. But sometimes gross and scary things are
the right tool for the job.
What we ended up writing was the
[**`go4.org/intern`**](https://pkg.go.dev/go4.org/intern) package to
hide the bodies so our
[`inet.af/netaddr`](https://pkg.go.dev/inet.af/netaddr) package could
have plausible deniability as to its innocence.
The `go4.org/intern` package is tiny and worth [reading in
full](https://github.com/go4org/intern/blob/main/intern.go) (and perhaps
worthy of a future blog post on its own), but the
core of it is this ungodliness:
```
`var (
// mu guards valMap, a weakref map of \*Value by underlying value.
// It also guards the resurrected field of all \*Values.
mu sync.Mutex
valMap = map[key]uintptr{} // to uintptr(\*Value)
)
// A Value pointer is the handle to an underlying comparable value.
// See func Get for how Value pointers may be used.
type Value struct {
\_ [0]func() // prevent people from accidentally using value type as comparable
cmpVal interface{}
// resurrected is guarded by mu (for all instances of Value).
// It is set true whenever v is synthesized from a uintptr.
resurrected bool
}
func GetByString(s string) \*Value {
return get(key{s: s, isString: true})
}
// We play unsafe games that violate Go's rules (and assume a non-moving
// collector). So we quiet Go here.
// See the comment below Get for more implementation details.
//go:nocheckptr
func get(k key) \*Value {
mu.Lock()
defer mu.Unlock()
var v \*Value
if addr, ok := valMap[k]; ok {
v = (\*Value)((unsafe.Pointer)(addr))
v.resurrected = true
}
if v != nil {
return v
}
v = k.Value()
runtime.SetFinalizer(v, finalize)
valMap[k] = uintptr(unsafe.Pointer(v))
return v
}
func finalize(v \*Value) {
mu.Lock()
defer mu.Unlock()
if v.resurrected {
// We lost the race. Somebody resurrected it while we
// were about to finalize it. Try again next round.
v.resurrected = false
runtime.SetFinalizer(v, finalize)
return
}
delete(valMap, keyFor(v.cmpVal))
}
`
```
Basically, it’s playing unsafe games behind the Go garbage collector’s
back, hiding pointers in untyped `uintptr` integers so Go will be
forced to eventually garbage collect things which then causes the
finalizer to be invoked to step in and either clean up its lies or
clean up the map.
But the end result is that this is now true:
```
` intern.GetByString("eth0") == intern.GetByString("eth0")
`
```
So our `IP` representation can be:
```
`type IP struct {
addr [16]byte
z \*intern.Value // zone and family
}
var (
z0 \*intern.Value // nil for the zero value
z4 = new(intern.Value) // sentinel value to mean IPv4
z6noz = new(intern.Value) // sentinel value to mean IPv6 with no zone
)
`
```
The accessors to get/set the zone are then:
```
`// Zone returns ip's IPv6 scoped addressing zone, if any.
func (ip IP) Zone() string {
if ip.z == nil {
return ""
}
zone, \_ := ip.z.Get().(string)
return zone
}
// WithZone returns an IP that's the same as ip but with the provided
// zone. If zone is empty, the zone is removed. If ip is an IPv4
// address it's returned unchanged.
func (ip IP) WithZone(zone string) IP {
if !ip.Is6() {
return ip
}
if zone == "" {
ip.z = z6noz
return ip
}
ip.z = intern.GetByString(zone)
return ip
}
`
```
How we’d do?
|Feature|`net.IP`|`netaddr.IP`|
|Immutable|❌, slice|✅|
|Comparable|❌, slice|✅|
|Small|❌, 28-56B|✅, 24B, always|
|Allocation free|❌|✅|
|Supports IPv4 & IPv6|✅|✅|
|Can distinguish IPv4/IPv6|❌|✅|
|Supports IPv6 zones|❌|✅|
|Opaque type|❌|✅|
|Interops with standard library|✅|🤷, adaptor methods|
Nailed it.
### Take 4: uint64s for speed
We were pretty happy, but [Dave Anderson](https://github.com/danderson) took advantage of the type’s
opaque representation and changed the representation to make it faster in
[`4eb479db13`](https://github.com/inetaf/netaddr/commit/4eb479db13f8b816537f38c664776b193c7a86ec),
replacing the `addr [16]byte` with a pair of `uint64` values:
```
`type IP struct {
// hi and lo are the bits of an IPv6 address. If z==z4, hi and lo
// contain the IPv4-mapped IPv6 address.
//
// hi and lo are constructed by interpreting a 16-byte IPv6
// address as a big-endian 128-bit number. The most significant
// bits of that number go into hi, the rest into lo.
//
// For example, 0011:2233:4455:6677:8899:aabb:ccdd:eeff is stored as:
// hi = 0x0011223344556677
// lo = 0x8899aabbccddeeff
//
// We store IPs like this, rather than as [16]byte, because it
// turns most operations on IPs into arithmetic and bit-twiddling
// operations on 64-bit registers, which is much faster than
// bytewise processing.
hi, lo uint64
// z is a combination of the address family and the IPv6 zone.
z \*intern.Value
}
`
```
The compiler liked that much more.
### Take 5: a uint128 type
But why stop there? Being able to change the representation without affecting the API is too much
fun, so in [`318330f177`](https://github.com/inetaf/netaddr/commit/318330f177ab307858b73763bf7e8715db66a4a5)
I replaced the `uint64` pair with a new `uint128` type, as [Go doesn’t have a native one](https://github.com/golang/go/issues/9455).
We’re now at:
```
`type uint128 [2]uint64
type IP struct {
addr uint128
z \*intern.Value
}
`
```
But the compiler [didn’t like that](https://github.com/golang/go/issues/24416),
so [`bf0e22f9f3`](https://github.com/inetaf/netaddr/commit/bf0e22f9f32fdeb31cd4c253c852708915d2c89a)
broke it back down into:
```
`type uint128 struct {
hi uint64
lo uint64
}
`
```
And that’s basically where we’re at today.
We’re talking about breaking out the [uint128 type into its own package](https://github.com/inetaf/netaddr/issues/131)
but haven’t done so yet.
### Other inet.af/netaddr fun
In addition to just IP addresses, [`inet.af/netaddr`](https://pkg.go.dev/inet.af/netaddr) contains:
* [`IPPort`](https://pkg.go.dev/inet.af/netaddr#IPPort): a value type for an IP address and a port
* [`IPPrefix`](https://pkg.go.dev/inet.af/netaddr#IPPrefix): a value type for an IP address and a CIDR prefix (e.g. 192.168.0.1/16)
* [`IPRange`](https://pkg.go.dev/inet.af/netaddr#IPRange): a value type for range of IPs (e.g. 10.0.0.200-10.0.0.255)
* [`IPSet`](https://pkg.go.dev/inet.af/netaddr#IPSet): an efficient, immutable set of IP addresses, built with an
[`IPSetBuilder`](https://pkg.go.dev/inet.af/netaddr#IPSetBuilder).
As [one contrived example](https://play.golang.org/p/XpeIbAZ5HlO), this code:
```
`var b netaddr.IPSetBuilder
b.AddPrefix(netaddr.MustParseIPPrefix("10.0.0.0/8"))
b.Remove(netaddr.MustParseIP("10.2.3.4"))
s, \_ := b.IPSet()
fmt.Println(s.Ranges())
fmt.Println(s.Prefixes())
`
```
Outputs:
```
`[10.0.0.0-10.2.3.3 10.2.3.5-10.255.255.255]
[10.0.0.0/15 10.2.0.0/23 10.2.2.0/24 10.2.3.0/30 10.2.3.5/32 10.2.3.6/31 10.2.3.8/29 10.2.3.16/28 10.2.3.32/27 10.2.3.64/26 10.2.3.128/25 10.2.4.0/22 10.2.8.0/21 10.2.16.0/20 10.2.32.0/19 10.2.64.0/18 10.2.128.0/17 10.3.0.0/16 10.4.0.0/14 10.8.0.0/13 10.16.0.0/12 10.32.0.0/11 10.64.0.0/10 10.128.0.0/9]
`
```
### FAQ
#### Should you use `netaddr.IP`?
If you work with a lot of IP addresses and sets, ranges, and
prefixes thereof, you’d probably benefit from using `netaddr.IP` over
the standard library’s types.
#### Is the API stable?
Mostly. We haven’t done a 1.0.0 yet and we might yet [change a few
minor things](https://github.com/inetaf/netaddr/issues), but it’s
pretty much done at this point.
#### What’s with the package name’s `inet.af`?
AF\_INET, of course.
#### Was IPv6 worth it?
It is what it is.
#### This was too many words
If you’d like this blog post in video form, my [FOSDEM
2021](https://fosdem.org/2021/) talk, [“Go at
Tailscale”](https://www.youtube.com/watch?v=csbE6G9lZ-U&amp;t=1125s)
discusses this starting at time 18:45.
### Thanks
Writing the [`inet.af/netaddr` package](https://pkg.go.dev/inet.af/netaddr) was a fun collaboration
with
[@crawshaw](https://github.com/crawshaw),
[@danderson](https://github.com/danderson),
[@josharian](https://github.com/josharian),
[@mdlayher](https://github.com/mdlayher), and
[@tklauser](https://github.com/tklauser).
Share
Author
Brad Fitzpatrick
Author
Brad Fitzpatrick
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