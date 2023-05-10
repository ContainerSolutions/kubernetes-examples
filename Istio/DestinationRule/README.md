# DestinationRule

After a destination Service is chosen by a `VirtualService` (the request is routed), a `DestinationRule` specifies how that Service should be talked to.

> In this directory, "endpoint pool" means the set of endpoints to which traffic has been routed; a Service or a Subset of a Service

It describes how to load balance between the network endpoints of the Service (as found in the Service Registry).
It also says how connections should be made to those network endpoints (HTTP version, TLS stance) and how they should be managed (keep-alive times, maximum active connections to load-balance onto any individual endpoint at once).

`DestinationRules` configure the _client_ sidecars, eg for the flow `service-a -> sidecar-a -> sidecar-b -> service-b` the `DestinationRule` for host "service-b" configures each instance of "sidecar-a".
Thus the connection options technically configure how "sidecar-a" talks to _"sidecar-b"_ (if the destination is also in the mesh, or directly to the service or whatever proxies are in front of it if it's not).
The only time to bear in mind that you're talking to the server's sidecar rather than the actual "app" is when considering TLS, as the server sidecar will terminate this.
There is no way to configure the behaviour from "sidecar-b" to "service-b"; this is basically a passthrough, except the mutual TLS upgrade noted above.

`DestinationRules` are implemented locally by each sidecar; there is no global coordination between sidecars.
For example
* circuit-breaker detection and elimination is done per client sidecar; each holds their own state for this which might differ from other sidecars'

`DestinationRules` configure how one client should talk to the _pool_ of endpoints (a Service or subset of a Service).
For example
* load-balancer config controls how each individual client should pick one of the _n_ servers (endpoint instances) each time there's a new outbound connection
* circuit-breaking applies across the pool (of servers); it temporarily removes instances from the pool (even if Service Discovery says they're healthy thus they're in the service registry)
* TLS config applies to all connections from the client to any server (in the pool)
The exception is connection-pool settings, which apply to each client-server pair individually.
Recall though that they apply to `sidecar-a -> sidecar-b`, not `sidecar-b -> service-b`.

It also somewhat confusingly details the Subsets of the Service available as routing targets in `VirtualServices`.
You might think this would be on something like a `ServiceEntry` resource that obviously manipulates the Service Registry.
However, `DestinationRule` settings can be per-subset (as they're different workload binaries and might need treating differently).
