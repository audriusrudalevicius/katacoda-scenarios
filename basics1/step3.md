# Create deployment

<pre class="file" data-filename="deployment.yaml" data-target="replace">
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
</pre>

`kubectl create -f deployment.yaml`{{execute}}

Get deployment, replicaSet, pod
`kubectl get deploy,rs,po -l app=app1`{{execute}}

Describe
`kubectl describe rs <name>`