# Inspecting pods

Inpect details about pod status
`kubectl describe po -l app=app1`{{execute}}

Look at logs from stdin/stdout
`kubectl logs -l app=app1`{{execute}}