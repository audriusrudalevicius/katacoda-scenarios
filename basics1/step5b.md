# How to add volume to pod

## PersistentVolume and PersistentVolumeClaim Creation

## PersistentVolume

Can be created staticaly or dynamically, this coure will cover only dynamic.

<!-- 

### Static

1. First lats check if we have PersistentVolumes to claim
`kubectl get pv`{{execute}}
2. Check what type of storage classes we have for PersistentVolumes creation
`kubectl get storageclass`{{execute}}

3. Create PersistentVolume

<pre class="file" data-filename="pv.yaml" data-target="replace">
kind: PersistentVolume
apiVersion: v1
metadata:
  name: demo-pv1
  labels:
    type: local
spec:
  storageClassName: standard
  persistentVolumeReclaimPolicy: Delete
  capacity:
    storage: 100Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/persistent-volume"
</pre>

**persistentVolumeReclaimPolicy**
Can be one of:

* Retain
  Data will be kept to be deleted manually
* Delete"
  When **PersistentVolumeClaim** is deleted data will be deleted
 -->

### Dynamic creation of PersistentVolume

PersistentVolumeClaim will create PersistentVolume and bind to it so our pod can Mount it to containers.

IF we delete PersistentVolumeClaim data will be lost. But if we delete pod data will be not affected.

<pre class="file" data-filename="pvc.yaml" data-target="replace">
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: demo-pv1-claim
  labels:
   app: app1
spec:
  storageClassName: standard
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 50Mi
</pre>

`kubectl create -f pvc.yaml`{{execute}}

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
  template:
    metadata:
      labels:
        app: app1
    spec:
      volumes:
        - name: my-pv-storage
          persistentVolumeClaim:
            claimName: demo-pv1-claim
      containers:
      - name: app1
        image: localhost:5000/tot/example_counter
        volumeMounts:
        - mountPath: "/out/"
          name: my-pv-storage
      imagePullSecrets:
      - name: regcred
</pre>

`kubectl apply -f deployment.yaml`{{execute}}

Check new deployed pod version
`kubectl get po -l app=app1`{{execute}}

Now our numbers are stored in persitent disk. As in this demo our peristend disk is dir on host, we can prove it stores data by finding that dir.

`kubectl get pv -l app=app1`{{execute}}

Find the name of pv and then

`kubectl get pv/NAME OF PV -o yaml`

You will see someting like:

```
spec:
  accessModes:
  - ReadWriteOnce
  capacity:
    storage: 50Mi
  claimRef:
    apiVersion: v1
    kind: PersistentVolumeClaim
    name: demo-pv1-claim
    namespace: default
    resourceVersion: "474"
    uid: cb12ed91-dc7b-41f2-a5e2-0f01e81879ae
  hostPath:
    path: /tmp/hostpath-provisioner/pvc-cb12ed91-dc7b-41f2-a5e2-0f01e81879ae
    type: ""
```

hostPath.path is path to dir

Same can be done with single comand:
`ls $(kubectl get pv -l app=app1 jsonpath='{.items[*].spec.hostPath.path}')`{{execute}}