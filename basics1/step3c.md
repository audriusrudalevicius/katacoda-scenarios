# Inspect deployed application

Get deployment, replicaSet, pod of our deployed app1
`kubectl get deploy,replicaSet,pod -l app=app1`{{execute}}

You should see 3 kinds of resources being created from one yaml file that describes only deployment kind. Moust important for us is deployment as it basically manages all of them.

Describe deploy (deployment) to see more information about its deployment state
`kubectl describe deploy -l app=app1`{{execute}}

## What is Deployment

Kubernetes resource thet defines deployment

* Defines deployment stategy (Manages pod migrations between old and new replicasets)
* Defines pod template
* Manages ReplicaSets

## What is ReplicaSet

Kubernetes resource thet defines replication

* Creates or deletes pods to match desired number of running pods
* Defines ownership reference
* Defines pod template
* Accuires pods by its selector, eg pod is stated externaly but replicaset will count it ar running instnace

## What is Pod

Manages set of runnining containers
