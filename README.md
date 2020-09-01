![yamllint](https://github.com/ContainerSolutions/kubernetes-examples/workflows/yamllint/badge.svg)
# Kubernetes Examples

A reference repository of YAML with canonical and as-simple-as-possible demonstrations of kubernetes functionality and features.

## Why?

At Container Solutions we find we regularly need chunks of YAML to  demonstrate something specific, such as:

- A simple deployment

- A simple pod

- A pod with a volume

This might be to do a basic test of an environment, find an example to tinker with, or send to someone to get them going.

## Sections

`broken-*` - yamls that exemplify broken kubernetes yaml states

`[A-Z][a-zA-Z]*` - Example yamls that correspond to resource types.

Within those folders are either simple/canonical examples, or examples in subfolders that expose particular items of functionality that are highlighted by their yaml path, eg `Pod/spec.initContainers/`.

If an example is an exemplar of a particular feature but tightly related to another resource, then an absolute folder might be added eg in Service there is `Service/Pod.spec.subdomain`.

Symlinks are also used to make finding things easier, eg `Service/headless-service -> Service/spec.clusterIP`.

## Principles

The examples seek to be:

- As simple as possible to illustrate the functionality

- Self-contained (ie limited to one .yaml file)

- Non-conflicting (eg resource names are unique)

- Clear (eg resource names are verbose and unambiguous)

## Sources / Thanks To

[Official Kubernetes docs](https://kubernetes.io/docs/)

[Kubernetes by Example](https://kubernetesbyexample.com/)

[Practical Kubernetes](https://github.com/kubernauts/practical-kubernetes-problems)

[Security Examples](https://github.com/NodyHub/docker-k8s-resources/tree/master/k8s-pods)
