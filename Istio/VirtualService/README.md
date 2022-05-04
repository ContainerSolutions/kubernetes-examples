# VirtualService
`VirtualServices` configure routing rules for traffic.

Traffic is identified by the _Host_ it's addressed to in its layer 7 request header (there must be at most one VirtualService per Host).
For a given protocol, Routing Rules are then tried in order until one matches the attributes of the request.
The matching routing rule specifies a Service to which to send the request (a _Service_ is effectively a Kubernetes `Service`, qv).
Optionally, a subset of the Service's Pods can be targeted using Subsets (see `DestinationRule`)

VirtualServices can be thought of as an "active" bump-on-the-wire through which requests are sent.
They can apply various transforms to the traffic passing through them, such as header manipulation, delay injection, etc.
