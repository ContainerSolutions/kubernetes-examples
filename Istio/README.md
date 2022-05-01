# Resource Types
Colloquially
* `ServiceEntry` - what Services exist and how are their network endpoints found?
* `VirtualService` - to which Service should traffic for a given hostname be sent?
* `DestinationRule` - how do I talk to that Service?

### Services in Istio
_Services_ are the *destination* of Route Rules (the `host` which a `VirtualService` matches is an arbitrary string).
_Services_ by the Istio definition are morally "units of application behaviour".
They are made of network _endpoints_: Pods, and external endpoints.
Istio has a _Service Registry_ of all the Services it knows about.
In some configurations it will refuse to send traffic to Services that aren't in the Service Registry (in others it'll assume the Service exists and take some guesses about how to find its endpoints and how to talk to them).

In a Kubernetes environment, the Service Registry is populated from Kubernetes `Service` instances.
Extra Service Registry entries (eg for internet endpoints, VMs) can be added with the `ServiceEntry` resource.
Recall that, in some mesh configurations, such `ServiceEntries` are *necessary* for workloads in the mesh to talk to anything outside the cluster.
`ServiceEntry` is a higher-level resource - doesn't necessarily specify all endpoints in a Service, instead it says where to discover them.

There is no (easy) way to view the contents of the Service Registry; the imported Kubernetes `Services`, DNS query results, etc aren't reflected as a read-only resource like Kubernetes' `Endpoint`.
