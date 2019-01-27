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
minikube start --vm-driver=virtualbox --cpus 4 --disk-size 40g \
 --memory 12288 --network-plugin=cni --kubernetes-version=v1.11.5
```

Docker:

```
eval $(minikube docker-env)
```

Domain names that may be useful for testing:

```bash
cat <<EOF | sudo tee -a /etc/hosts
$(minikube ip) minikube
$(minikube ip) kta.minikube
$(minikube ip) echoapi.minikube
$(minikube ip) grafana.minikube
$(minikube ip) prometheus.minikube
$(minikube ip) influxdb.minikube
$(minikube ip) pushgateway.minikube
EOF
```


helm

```
kubectl -n kube-system create sa tiller
kubectl create clusterrolebinding tiller-cluster-rule \
    --clusterrole=cluster-admin \
    --serviceaccount=kube-system:tiller
helm init --skip-refresh --upgrade --service-account tiller
```

flux

```
helm repo add weaveworks https://weaveworks.github.io/flux
helm install --name flux \
--set rbac.create=true \
--set helmOperator.create=true \
--set helmOperator.createCRD=true \
--set git.url=git@github.com:GIT_REPO_NAME \
--namespace flux \
weaveworks/flux
```


Keel

```
helm repo add keel-charts https://charts.keel.sh
helm repo update
helm fetch keel-charts/keel
```

To read about:

http://opentracing.io/

https://github.com/containernetworking/cni/blob/master/SPEC.md

https://github.com/google/cadvisor

https://github.com/kubernetes/heapster/blob/master/docs/sink-configuration.md
