# Inspect deployed application

Get deployment, replicaSet, pod of our deployed app1
`kubectl get deploy,replicaSet,pod -l app=app1`{{execute}}

You should see 3 kinds of resources being created from one yaml file that describes only deployment kind. Moust important for us is deployment as it basically manages all of them.


Describe deploy (deployment) to see more information about its deployment state
`kubectl describe deploy -l app=app1`{{execute}}


<hr>

**What is Deployment**

Defines pod template

**Waht is ReplicaSet**

Manages replicated instances of pods

**What is Pod**

Manages set of runnining containers
