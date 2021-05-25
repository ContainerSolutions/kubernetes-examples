![yamllint](https://github.com/ContainerSolutions/kubernetes-examples/workflows/yamllint/badge.svg)
# Kubernetes Examples

A reference repository of YAML with canonical and as-simple-as-possible demonstrations of kubernetes functionality and features.

See here for a searchable front-end: https://k8s-examples.container-solutions.com/

![Kubernetes Examples](logo.png)

## Why?

At Container Solutions we find we regularly need chunks of YAML to  demonstrate something specific, such as:

- A simple deployment

- A simple pod

- A pod with a volume

This might be to do a basic test of an environment, find an example to tinker with, or send to someone to get them going.

## Usage

The examples can be used by a kubectl plugin `examples`. This plugin can be installed
by [krew](https://krew.sigs.k8s.io/):

- first [install krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)
- Install a custom plugin index: `kubectl krew index add cs https://github.com/ContainerSolutions/kubernetes-examples.git`
- Install this plugin: `kubectl krew install cs/examples`

Interactively discover by first selecting the resource type:
```
$ kubectl examples
```

filter by resource type
```
$ kubectl examples Service
```

filter by resource type and pattern
```
$ kubectl examples Pod res
```

If there is only a single match selected by the parameters, it is printed to the stdout.
So you can deploy a modified version of a sample by:
```
$ export KUBE_EDITOR='code -w'
$ kubectl examples Ingress fanout | kubectl create -f - --edit
```

## Sections

`broken-*` - yamls that exemplify broken kubernetes yaml states

`[A-Z][a-zA-Z]*` - Example yamls that correspond to resource types.

`test` - Scripts to test or validate the YAML

Within those folders are either simple/canonical examples, or examples in subfolders that expose particular items of functionality that are highlighted by their yaml path, eg `Pod/spec.initContainers/`.

If an example is an exemplar of a particular feature but tightly related to another resource, then an absolute folder might be added eg in Service there is `Service/Pod.spec.subdomain`.

Symlinks are also used to make finding things easier, eg `Service/headless-service -> Service/spec.clusterIP`.

`plugins` - a directory following the spec for a Custom krew [plugin index](https://krew.sigs.k8s.io/docs/user-guide/custom-indexes/)

## Principles

The examples seek to be:

- As simple as possible to illustrate the functionality

- Self-contained (ie limited to one .yaml file)

- Non-conflicting (eg resource names are unique)

- Clear (eg resource names are verbose and unambiguous)

## Release Process

See [here](RELEASE_PROCESS.md)

## Sources / Thanks To

[Official Kubernetes docs](https://kubernetes.io/docs/)

[Kubernetes by Example](https://kubernetesbyexample.com/)

[Practical Kubernetes](https://github.com/kubernauts/practical-kubernetes-problems)

[Security Examples](https://github.com/NodyHub/docker-k8s-resources/tree/master/k8s-pods)
