# Kubernetes Examples Workshop

You can follow this workshop in the suggested order below to have an overview of different Kubernetes
resource types by using existing examples in the repository.

## Environment Setup

### Kubernetes Cluster

Examples in the repo can run in any Kubernetes cluster.
Although they are simple examples, please avoid using any production clusters.

If you don't have access to any Kubernetes cluster, you can simply follow kind quick start instructions
to have a local cluster up and running in a few minutes.

For the examples in the workshop, it will be useful to have a multi node cluster to see node scheduling in action.
You can run these commands on Linux to install kind and create a 3 node cluster:

```sh
# Instructions for installing kind on Linux
# Source: https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.19.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.19.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Create config for 3 node kind cluster
cat << EOF > kind-3-node-cluster.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30080
    hostPort: 30080
    listenAddress: "0.0.0.0"
    protocol: TCP
- role: worker
- role: worker
EOF

# Create kind cluster k8s-examples
kind create cluster --name k8s-examples --config kind-3-node-cluster.yaml
```

### kubernetes-examples krew plugin

After creating kind cluster, you can also install kubernetes-examples krew plugin to make it available with kubectl command.
Instructions are available [here](https://github.com/ContainerSolutions/kubernetes-examples#usage) in `Usage` section of `README.md`.

If you have already cloned the kubernetes-examples repository you can also run `make install`,
which will create krew plugin locally and install it. 

## Examples

1. Simple Pod - Create a simple pod and ensure it's running on your cluster

[Pod/simple.yaml](/Pod/simple.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/Pod/simple.yaml

# OR

kubectl examples Pod simple | kubectl apply -f -
```

Check the pod status and make sure the status is `Running` with following command:

```sh
kubectl get pods
```

2. Pod - with hostpath volume for persistent storage

[Pod/spec.volumes.hostPath/hostdir.yaml](/Pod/spec.volumes.hostPath/hostdir.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/Pod/spec.volumes.hostPath/hostdir.yaml

# OR

kubectl examples Pod hostdir | kubectl apply -f -
```

Check the pod status and make sure the status is `Running` with following command:

```sh
kubectl get pods
```

3. Broken pod - liveness/readiness - apply both to see how they act differently

[broken-Pod/spec.containers.livenessProbe/liveness.yaml](/broken-Pod/spec.containers.livenessProbe/liveness.yaml)

[broken-Pod/spec.containers.readinessProbe/readiness.yaml](/broken-Pod/spec.containers.readinessProbe/readiness.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/broken-Pod/spec.containers.livenessProbe/liveness.yaml
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/broken-Pod/spec.containers.readinessProbe/readiness.yaml
```

These two commands create the broken readiness and liveness pods `broken-liveness-pod` and `broken-readiness-pod`.
You can try fixing these pods.

Hint: Use a random file on the image like `/etc/hosts`

4. Pod with ConfigMap volume mount

[ConfigMap/configmap.yaml](/ConfigMap/configmap.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/ConfigMap/configmap.yaml

# OR

kubectl examples ConfigMap | kubectl apply -f -
```

Check files in `/etc/config` on the running busybox container.

5. Broken secret

[broken-Secret/simple-secret.yaml](broken-Secret/simple-secret.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/broken-Secret/simple-secret.yaml
```

Check the container status and identify which example you can use to make it running.

Hint: Ensure secret name you create as a fix matches expected secret name.

6. Deployment

[Deployment/simple-deployment.yaml](/Deployment/simple-deployment.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/Deployment/simple-deployment.yaml
```

Check related Deployment, ReplicaSet and Pod resources.

7. Service - ClusterIP

[Service/simple.yaml](/Service/simple.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/Service/simple.yaml 
```

Check created Service resource.

8. Service - Headless

[Service/spec.clusterIP/headless-service.yaml](/Service/spec.clusterIP/headless-service.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/Service/spec.clusterIP/headless-service.yaml
```

Use nslookup to check ClusterIP and Headless services DNS resolution
(command with service names are at the top of the yaml file).

9. Broken deployment and service

[broken-Deployment/spec.spec.readinessProbe/readiness-broken.yaml](/broken-Deployment/spec.spec.readinessProbe/readiness-broken.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/broken-Deployment/spec.spec.readinessProbe/readiness-broken.yaml
```

Check the deployment and pods, and try to fix the issues.

Hints:
- Check if any pods are created and edit replica count
- Check image name, you can use `docker.io/nginx:1.23`
- Check path and port of readinessProbe, for nginx image you can use `/` path and port 80
- Ensure you have correct port and label on the service

10. DaemonSet

[DaemonSet/simple-daemon-set.yaml](/DaemonSet/simple-daemon-set.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/DaemonSet/simple-daemon-set.yaml
```

Check which nodes pods are scheduled.

11. StatefulSet

[StatefulSet/simple-stateful-set.yaml](/StatefulSet/simple-stateful-set.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/StatefulSet/simple-stateful-set.yaml
```

Note: Ensure you have correct storageClassName that's available on your cluster

Check created PersistentVolumeClaim, PersistentVolume and Pod


12. Job

[Job/simple.yaml](/Job/simple.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/Job/simple.yaml
```

Wait for a Pod to be created, and check it's logs after it is completed.

13. CronJob

[CronJob/simple.yaml](/CronJob/simple.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/CronJob/simple.yaml
```

Check the CronJob resource and cron schedule.
Wait a few minutes for 2-3 jobs to start and complete.
Check Job and Pod resources

14. ServiceAccount

[ServiceAccount/service-account-pod.yaml](/ServiceAccount/service-account-pod.yaml)

```sh
kubectl apply -f https://raw.githubusercontent.com/ContainerSolutions/kubernetes-examples/master/ServiceAccount/service-account-pod.yaml
```

Check RBAC definitions in the yaml, and check logs of the running pod to see the output.
