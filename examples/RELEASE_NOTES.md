# Release Notes

## v0.0.5

- v1.27.0
- v1.26.0
- v1.25.0
- v1.24.0
- v1.23.0
- v1.22.0
- v1.21.0

### Changes

#### Removed Examples

- PodSecurityPolicy/Ingress/simple.yaml
- PodSecurityPolicy/pod-security-policy.yaml
- PodSecurityPolicy/restricted.yaml
- PodSecurityPolicy/spec.privileged/privileged.yaml

#### Other Changes

- Updated list of supported Kubernetes versions

## v0.0.4

Supported Kubernetes versions:

- v1.24.0
- v1.23.0
- v1.22.0
- v1.21.0

### Changes

#### New Examples

- CustomResourceDefinition/custom-resource-definition.yaml
- Istio/DestinationRule/circuit-breaker.yaml
- Istio/DestinationRule/connection-pool-settings.yaml
- Istio/DestinationRule/load-balance.yaml
- Istio/DestinationRule/sticky-sessions.yaml
- Istio/DestinationRule/subsets.yaml
- Istio/DestinationRule/tls.yaml
- Istio/VirtualService/delay-injection.yaml
- Istio/VirtualService/error-injection.yaml
- Istio/VirtualService/header-manipulation.yaml
- Istio/VirtualService/identity.yaml
- Istio/VirtualService/layer-7-routing.yaml
- Istio/VirtualService/redirect-rewrite.yaml
- Istio/VirtualService/retry.yaml
- Istio/VirtualService/timeout.yaml
- Istio/VirtualService/traffic-split.yaml

#### Updated Examples

- CronJob/simple.yaml
- Endpoints/endpoint-slice.yaml
- Ingress/fanout.yaml
- Ingress/ingress-class.yaml
- Ingress/ingress.yaml
- Ingress/nohost.yaml
- Ingress/rewrite.yaml
- Ingress/tls.yaml
- Ingress/virtualhosting.yaml
- Pod/spec.volumes.persistentVolumeClaim/pod-pvc.yaml
- PodDisruptionBudget/pod-disruption-budget-max-unavailable.yaml
- PodDisruptionBudget/pod-disruption-budget-min-available.yaml
- PodSecurityPolicy/Ingress/simple.yaml
- PodSecurityPolicy/restricted.yaml
- Service/Pod.spec.subdomain/subdomain.yaml

#### Removed Examples

- PodPreset/pod-preset.yaml
- Service/spec.topologyKeys/fallback.yaml

#### Other Changes

- Updated list of supported Kubernetes versions
- Replaced kubeval with kubeconform for CI tests

## v0.0.3

Supported Kubernetes versions:
- v1.19.0
- v1.18.0
- v1.17.0
- v1.16.0
- v1.15.0

Changes:

- Add Kubeval test
- Added Deployment/simple-deployment-privileged.yaml
- Added Deployment/simple-deployment-with-environment.yaml
- Added Endpoints/endpoint-slice.yaml
- Added restartPolicy to Job/simple.yaml
- Added PersistentVolumeClaim/pvc.yaml
- Added Pod/spec.affinity.nodeAffinity/node-affinity.yaml
- Added Pod/spec.nodeSelector/simple.yaml
- Added Pod/spec.volumes.persistentVolumeClaim/pod-pvc.yaml
- Added PodDisruptionBudget/pod-disruption-budget-max-unavailable.yaml and PodDisruptionBudget/pod-disruption-budget-min-available.yaml
- Added PodPreset/pod-preset.yaml
- Added PriorityClass/default-priority-class.yaml
- Added Secret/simple-secret.yaml
- Added ServiceAccount/service-account-pod.yaml
- Corrected Pod/spec.containers.volumes.projected/projected.yaml
- Corrected Pod/spec.volumes.hostPath.type/file-or-create.yaml
- Corrected PodSecurityPolicy/Ingress/simple.yaml
- Corrected Service/spec.type/load-balancer.yaml
- Code of conduct, license, and contributions guidelines added

## v0.0.2

Changes:

- Bugfix for v0.0.1

## v0.0.1

Changes:

- Initial base examples added
