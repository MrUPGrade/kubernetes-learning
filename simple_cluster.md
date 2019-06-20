How to quickly build simple one node k8s cluster

Using *kube-router* and *kubeadm*

```bash
kubeadm reset -f
```

Setup cluster

```bash
kubeadm init --pod-network-cidr=10.0.0.0/24 --service-cidr=10.0.1.0/24

mkdir -p ~/.kube/
cp /etc/kubernetes/admin.conf ~/.kube/config

kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter-all-features.yaml
```

kubectl autocomplete

```bash
kubectl completion bash > .kubectl.bc
echo 'source .kubectl.bc' >> ~/.bashrc
```
