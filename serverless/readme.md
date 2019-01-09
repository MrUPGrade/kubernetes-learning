# Fission

Serverless on k8s

https://fission.io/

Install

CLI

```bash
curl -Lo fission https://github.com/fission/fission/releases/download/1.0-rc1/fission-cli-linux && chmod +x fission && sudo mv fission /usr/local/bin/`
```

K8s

```bash
helm install --name fission --namespace fission --set serviceType=NodePort,routerServiceType=NodePort https://github.com/fission/fission/releases/download/1.0-rc1/fission-all-1.0-rc1.tgz
```


GO:
```
fission env create --name go --image fission/go-env:1.0-rc1 --builder fission/go-builder:1.0-rc1
```

```
fission function create --name gohello --env go --src hello.go --entrypoint Handler
```

```
fission function create --name gohelloid --env go --src hello_id.go --entrypoint Handler
```


```
fission route create --url "/hello" --function gohello --createingress
fission route create --url "/hello/{id}" --function gohelloid --createingress
```