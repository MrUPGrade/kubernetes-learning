# Kubernetes learning

Installation


KubeCTL

https://kubernetes.io/docs/tasks/tools/install-kubectl/

Kube

https://github.com/kubernetes/minikube/releases



# Start


```
minikube start --vm-driver=virtualbox
```

Run local docker on kubenernetes host:

```
eval $(minikube docker-env)
```



# Example app in docker

Prepare docker image

```
cd pyapp1
docker build -t mru/pyapp1:1 .
```