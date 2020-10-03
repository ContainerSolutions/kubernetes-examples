See:
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/
https://cloud.google.com/kubernetes-engine/docs/how-to/horizontal-pod-autoscaling

To create the Deployment, apply the nginx.yaml manifest:
> `kubectl apply -f nginx.yaml`

To get a list of HPA objects in the cluster, use the following command:
> `kubectl get hpa`

To view an HPA's configuration and statistics, use the following command:
> `kubectl describe hpa %hpa-name%`
*Replace %hpa-name% with the name of your HorizontalPodAutoscaler object.

If the HPA uses `apiVersion: autoscaling/v2beta2` and is based on multiple metrics, the `kubectl describe hpa` command only shows the CPU metric. To see all metrics, use the following command instead:
> `kubectl describe hpa.v2beta2.autoscaling %hpa-name%`

For deleting HPA, use the following command:
> `kubectl delete hpa %hpa-name%`

For deleting cluster, use next:
> `kubectl delete deployment %deployment-name%`

To create the Deployment with multiple autoscale metrics, run:
> `kubectl apply -f nginx-multiple.yaml`
