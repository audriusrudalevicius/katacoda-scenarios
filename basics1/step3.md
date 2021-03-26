# Create deployment

`deployment.yaml`

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
```

```
kubectl create -f deployment.yaml
```

```
kubectl get deployment
```

```
kubectl describe deployment app1
```

```
kubectl get po
```
