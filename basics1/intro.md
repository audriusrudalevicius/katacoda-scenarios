# Application deployment using Kubernetes and docker

## What is Kubernetes?

Kubernetes is an open-source container-orchestration platform for automating container deployment, scaling, and management.

## What is container?

Packaged application with all its dependecies to  run it quickly and reliably independend from its environment.

## This interactive totorial will cover basic core concepts to begin with


Workload type resources:
* Deployment
* Replicaset
* Pod
* Job

Configuration:
* Configset
* Secrets

Storage:
* Volumes
* Persitent Volumes


Deployment will create replicaset, replicaset will create pods, pods will be assigned to available node

![Deployment](https://www.katacoda.com/contino/courses/kubernetes/basic-deployments/assets/deployment-high-level.png)

