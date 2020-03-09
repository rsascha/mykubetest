# Just a try to deploy a full stack app (powered by nx) to microkube

## Diagram of the Setup

![diagram](./material/k8s.png)

## Setup

### Setup microk8s

To run this shit you need:

- https://microk8s.io/docs/

And move to:

```bash
cd my-fullstack-app
```

### Build the application

```bash
npm install
npm run build
```

### Configure microk8s

Use `microk8s.enable` to get the following `microk8s.status`:

```plain
microk8s is running
addons:
cilium: disabled
dashboard: disabled
dns: enabled
fluentd: disabled
gpu: disabled
helm3: disabled
helm: disabled
ingress: enabled
istio: disabled
jaeger: disabled
juju: disabled
knative: disabled
kubeflow: disabled
linkerd: disabled
metallb: disabled
metrics-server: disabled
prometheus: disabled
rbac: disabled
registry: enabled
storage: enabled
```

### Build and deploy docker images

```bash
./k8s.api.build-and-push.sh
./k8s.mykubetest.build-and-push.sh
```

### Apply deployments and services

```bash
microk8s.kubectl apply -f k8s.api.deployment.yaml
microk8s.kubectl apply -f k8s.api.service.yaml

microk8s.kubectl apply -f k8s.mykubetest.deployment.yaml
microk8s.kubectl apply -f k8s.mykubetest.service.yaml

microk8s.kubectl apply -f k8s.ingress.yaml
```

### For this feature branch check my Twitch streams

https://www.twitch.tv/gp4791

Current problem:

The pull was only working for the first time. After that, I get:

```
Warning  Failed     23s (x3 over 62s)  kubelet, x1        Failed to pull image "api:0.0.21": rpc error: code = Unknown desc = failed to resolve image "docker.io/library/api:0.0.21": no available registry endpoint: pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
```

Kubernetes is trying to load the images from docker.io, instead from the
local registry at localhost:32000.

Work in progress ...

### Open browser

https://localhost/

### Status should look like

```bash
watch -n1 microk8s.kubectl get all
```

```plain

┌───=[ x1 :: x1 ]-( 0 )-[ ~ ]
└──( microk8s.kubectl get all
NAME                             READY   STATUS    RESTARTS   AGE
pod/api-7cf9778dd6-6frm4         1/1     Running   0          117m
pod/api-7cf9778dd6-lwhk6         1/1     Running   0          117m
pod/api-7cf9778dd6-wtl6j         1/1     Running   0          117m
pod/mykubetest-fd678dc59-26zjc   1/1     Running   0          101m
pod/mykubetest-fd678dc59-dv2pb   1/1     Running   0          101m
pod/mykubetest-fd678dc59-hhlnb   1/1     Running   0          101m

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/api          ClusterIP   10.152.183.62   <none>        80/TCP    155m
service/kubernetes   ClusterIP   10.152.183.1    <none>        443/TCP   5h47m
service/mykubetest   ClusterIP   10.152.183.5    <none>        80/TCP    91m

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/api          3/3     3            3           117m
deployment.apps/mykubetest   3/3     3            3           101m

NAME                                   DESIRED   CURRENT   READY   AGE
replicaset.apps/api-7cf9778dd6         3         3         3       117m
replicaset.apps/mykubetest-fd678dc59   3         3         3       101m

```

## Development

### IDE

I'm using [Visual Studio Code](https://code.visualstudio.com/download).

### Source Control Management

I'm using git-flow.

Check out:

https://danielkummer.github.io/git-flow-cheatsheet/index.de_DE.html

```bash
apt-get install git-flow
```
