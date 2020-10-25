## Pod Disruption Budget Example
---

1. Make sure Pod Disruption Budget is supported by your provider and/or cluster
   owner.
2. Change the metadata `name` tag to the name you want.
3. Set the `app` value. All pods that have this label will fall under this Pod
   Disruption Budget.
4. Set the `minAvailable` or `maxUnavailable` value. This can be an integer (for
   example when specififying minimum 3 pods should be available) or a percentage
   (for example when maximum 50% may be unavailable).

Reference: https://kubernetes.io/docs/tasks/run-application/configure-pdb/
