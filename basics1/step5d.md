# Rollback

We have deployed 2 releses of our small application:

`kubectl get replicaSet -l app=app1`{{execute}}

What if we found bug and want to rollback?

1. Lets check revisions available to rollback
`kubectl rollout history deployment/app1`{{execute}}
2. `kubectl rollout undo deployment/app1 --to-revision=1`{{execute}
3. `kubectl rollout status -w deployment/app1`{{execute}}

We can prove by `kubectl get po -l app=app1`{{execute}}

Will see freshly started pod

We can inspect its spec and check if it has our Volume attached:

`kubectl get po -l app=app1 --field-selector=status.phase=Running -o yaml`{{execute}}