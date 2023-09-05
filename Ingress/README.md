See: https://kubernetes.io/docs/concepts/services-networking/ingress/

For rewrite Ingress annotations, see: https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#rewrite

pathType:
     PathType determines the interpretation of the Path matching. PathType can
     be one of the following values: * Exact: Matches the URL path exactly. *
     Prefix: Matches based on a URL path prefix split by '/'. Matching is done
     on a path element by element basis. A path element refers is the list of
     labels in the path split by the '/' separator. A request is a match for
     path p if every p is an element-wise prefix of p of the request path. Note
     that if the last element of the path is a substring of the last element in
     request path, it is not a match (e.g. /foo/bar matches /foo/bar/baz, but
     does not match /foo/barbaz).
     * ImplementationSpecific: Interpretation of the Path matching is up to the
     IngressClass. Implementations can treat this as a separate PathType or
     treat it identically to Prefix or Exact path types. Implementations are
     required to support all path types.
