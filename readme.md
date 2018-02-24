# Kubernetes learning

Project for learning Kubernetes and storing notes.

## Installation

kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/

minikube: https://github.com/kubernetes/minikube/releases

# Start

Start:

```
minikube start --vm-driver=virtualbox
```

or

```
minikube start --vm-driver=virtualbox --cpus 4 --disk-size 40g --memory 4096
```

Docker:

```
eval $(minikube docker-env)
```
