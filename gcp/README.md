# Creating a simple webserver that already accepts https requests with a domain and managed certificate using GKE

As written in the title, for this to work you need to apply this resources to a GKE cluster.

## Before applying it

- First create a static named ip address. It needs to be global (not regional). [Here](https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address) you can find google documentation about it. You can either use gcloud cli or gcp console for that. If you are using terraform, go for [google_compute_global_address](https://www.terraform.io/docs/providers/google/r/compute_global_address.html).

- Have your domain point to this ip. Add a new DNS record to the DNS service that is currently holding your domain.

- Replace example-ip with the name of the ip that you created in your gcp setup

- Replace example.dev with the domain/subdomain that you created in your DNS record

## Apply it

```
kubectl apply -f https-ready-alb-gke.yaml
```

Wait a bit for google to spin up a new Application load balancer and setup the managed certificate (sometimes the certificate takes a while to be provisioned).

## Concerns

Spinning up a new gcp application load balancer for every service that needs to be accessible externally will eat all your budget really fast in a real production cenario. This is just a really fast way to have some demos or really simple setup with a no brainer process for https ready services.