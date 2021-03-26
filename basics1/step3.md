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
      imagePullSecrets:
      - name: regcred
</pre>


kind: Deployment

Kubernetes resource defines deployment that will create ReplicaSet resource for this spec.template