# Inspecting pods

Inpect details about pod status
`kubectl describe po -l app=app1`{{execute}}

Look at logs from stdin/stdout
`kubectl logs -l app=app1`{{execute}}

## What is a pod?

Smalles computing resource of kubernetes
Disposable collection of containers that can/are:

* Share network
* Stroage
* Co-located and Co-scheduled

## How they scheduled

Pod gets its unique id
And scheduler checks  for pods that has no node assigned and tryes find best node for that pod.

If node is deleted/crashed same it will start over

You cann add rules how pod should assigned to nodes but will cover this later.

## What you can manage in pod

* Volumes
* Assign Pods to Nodes

## What you can manage in container

* Resources
* Limits
* Restart policies
* Readines probes - When to stop serving requests (overload).
* Live probes - If a container is unresponsive, restart.
* startupProbe - tweek startup for livines probe

<!-- 
### Pod can have init-container
Usefull when you have no controll over code you running

* Debug/troubleshooting 
* Setup scripts independent from application (main pod)
* Block and wait for available resources susch as db or other service -->
