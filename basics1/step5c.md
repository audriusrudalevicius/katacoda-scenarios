# Debug

Getting shell in runnig container in pod:
`kubectl exec --stdin --tty POD_NAME -- /bin/sh`

Getting back resource yaml or just inspectig
`kubectl get po/POD_NAME -o yaml`{{execute}}