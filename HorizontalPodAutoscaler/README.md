To create the Deployment, apply the nginx.yaml manifest:

> `kubectl apply -f nginx.yaml`

To create an HPA object that only targets average CPU utilization, use the following command:

> `kubectl autoscale deployment horizontal-pod-autoscaler-cpu-based --cpu-percent=50 --min=1 --max=10`

To get a list of HPA objects in the cluster, use the following command:

> `kubectl get hpa`

To view an HPA's configuration and statistics, use the following command:

> `kubectl describe hpa horizontal-pod-autoscaler-cpu-based`

For deleting HPA, use the following command:

> `kubectl delete hpa horizontal-pod-autoscaler-cpu-based`

To create an HPA object with multiple autoscale metrics, run:

> `kubectl apply -f hpa-multi.yaml`

To get a list of HPA objects in the cluster, use the following command:

> `kubectl get hpa`

To view an HPA's configuration and statistics, use the following command:

> `kubectl describe hpa horizontal-pod-autoscaler-multiple-metrics`

If the HPA uses apiVersion: autoscaling/v2beta2 and is based on multiple metrics, the kubectl describe hpa command only shows the CPU metric. To see all metrics, use the following command instead:

> `kubectl describe hpa.v2beta2.autoscaling horizontal-pod-autoscaler-multiple-metrics`

For deleting HPA, use the following command:

> `kubectl delete hpa horizontal-pod-autoscaler-multiple-metrics`

For deleting cluster, use next:

> `kubectl delete deployment horizontal-pod-autoscaler-nginx`

Additional information about HorizontalPodAutoscaler you could find on next links:

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

https://cloud.google.com/kubernetes-engine/docs/how-to/horizontal-pod-autoscaling
