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

For cluster setup:

```
minikube start --vm-driver=virtualbox --cpus 4 --disk-size 40g --memory 4096 --network-plugin=cni
```

Docker:

```
eval $(minikube docker-env)
```


To read about:

http://opentracing.io/

https://github.com/containernetworking/cni/blob/master/SPEC.md

https://github.com/google/cadvisor

https://github.com/kubernetes/heapster/blob/master/docs/sink-configuration.md