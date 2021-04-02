# Create deployment

<pre class="file" data-filename="deployment.yaml" data-target="replace">
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app1
  labels:
   app: app1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: app1
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: app1
    spec:
      containers:
      - name: app1
        image: localhost:5000/tot/example_counter
      imagePullSecrets:
      - name: regcred
</pre>

kind: Deployment

Kubernetes resource defines deployment that will create ReplicaSets resources for this spec.template.

**Selector** ReplicaSet will add its OwnerReference to them and add to count of running pods

**Strategy** Defines how to deal with old pods

* Recreate - Kill old, start new.
* RollingUpdate - Kill defined % of old pods, start new, checks its ready status, continues

**Template** Defines a pod

<!-- **Under the hood of resources**

Kubernetes has key/value database and event stream internally and after you will create/update/delete resource it will:

* Execute hooks for resource [validation/defaulting](https://book.kubebuilder.io/cronjob-tutorial/webhook-implementation.html), and [finalizers](https://book.kubebuilder.io/reference/using-finalizers.html)

* Shoot events and store to its interal resource database

Intrnaly there is *controller* that monitors internal events like created, modified, deleted etc. for interested resources like this one and will prcess them usually also altering its meta information to reflect its state.

In kubernetes you can create your own resources and controllers for them. -->
