# Setup secret for access docker registry

```
kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=./.docker/config.json \
    --type=kubernetes.io/dockerconfigjson
```

Update `deployment.yaml`

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: app1
  template:
    metadata:
      labels:
        app: app1
    spec:
      containers:
      - name: app1
        image: localhost:5000/example_counter
      imagePullSecrets:
      - name: regcred
```

Update deployment

```
kubectl apply -f deployment.yaml
```
