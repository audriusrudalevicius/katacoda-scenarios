# Application deployment using Kubernetes

## Basic core concepts to begin with

* Deployment (defines deplotyment) enables rollback changre image to v2, v3...
* Replicaset (supervised set of replicated pods) ensures required instances are running
* Pod (running set of instaciated containers) like processes

Deployment will create replicaset, replicaset will create pods, pods will be assigned to available node

![Deployment](https://www.katacoda.com/contino/courses/kubernetes/basic-deployments/assets/deployment-high-level.png)
