See: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims

You can test a local `PersistentVolume` and a `PersistentVolumeClaim` with the following files. (this example was tested on a docker-desktop kubernetes cluster)

1 - Create a `PersistentVolume` on your host monted on a local directory (add an `index.html` file in that directory with a hello world message)  
`kubectl apply -f ./PersistentVolume/spec.local/local.yaml`

2 - Create the `PersitentVolumeClaim`  
`kubectl apply -f ./PersistentVolumeClaim/pvc.yaml`

3 - Spin up a `Pod` with nginx poiting where its default root directory points to your host's directory   
`kubectl apply -f ./Pod/spec.volumes.persistentVolumeClaim/pod-pvc.yaml`

4 - Port forward your `Pod` and access it with your browser. You should be able to see the `index.html` file from your local directory.  
`kubectl port-forward volume-pvc :80`


Clean up
```
kubectl delete -f ./Pod/spec.volumes.persistentVolumeClaim/pod-pvc.yaml
kubectl delete -f ./PersistentVolumeClaim/pvc.yaml
kubectl delete -f ./PersistentVolume/spec.local/local.yaml
```