# Storage

Files created in running container is gone once it crashes, restarts. Also they are not accessible by other containers in a pod.

Volumes abstracts storage from computing and solves it.

## Volumes

Pod can have variuos types of volumes mounted to container File System. Livecycle is managed py pod.

* ConfigMap resource
* Cecret resource
* EmptyDir
* Downward API (access to pod metadata)
* PersistentVolumeClaim

### Temporary/Short lived

**EmptyDir** can be shared between containers in Pod, can be disk or ram. Will be deleted when pod is deleted, but if pod crashes data will be not affected. Uses sceduled node resources.

### Persistent

Usual flow:

1. Ususally kuberentes admin defines **PersistentVolume** resources that is basically defined sorage available to claim. Life cyle is manage dy Kubernetes. What type of storage you will get is managed by its [**StorageClass**](https://kubernetes.io/docs/concepts/storage/storage-classes/#provisioner)

2. You create **PersistentVolumeClaim** asking for disk space

3. You start pod with volume linked to **PersistentVolumeClaim**

**PersistentVolume** can have following access modes:

* ReadWriteOnce: The volume can be mounted as read-write by a single node.
* ReadOnlyMany: The volume can be mounted read-only by many nodes.
* ReadWriteMany: The volume can be mounted as read-write by many nodes. (ususally NFS/S3/GCS only)

PV to PVC is one to one bound
