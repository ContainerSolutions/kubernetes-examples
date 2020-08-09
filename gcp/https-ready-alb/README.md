# Creating a simple webserver that already accepts https requests with a domain and managed certificate using GKE

As written in the title, for this to work you need to apply this resource to an existing GKE cluster.

## Before applying it

- First create a static named ip address.

The IP address needs to be global (not regional). Documentation for GCP is [here](https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address).

You can use the `gcloud` cli, the GCP console, or Terraform to create it. If you are using Terraform, use [google_compute_global_address](https://www.terraform.io/docs/providers/google/r/compute_global_address.html).

- Have your domain point to this ip. Add a new DNS record to the DNS service that is currently holding your domain. This can be done within GCP or by any standard DNS service.

- Replace `HTTPS-READY-ALB-IP` with the name of the ip that you created in your GCP setup

- Replace `EXAMPLE.DEV.REPLACEME` with the domain/subdomain that you created in your DNS record

## Apply it

```
kubectl apply -f https-ready-alb.yaml
```

Wait a short time for GCP to spin up a new Application Load Balancer and set up the managed certificate (the certificate can take a while to be provisioned).

## Concerns

Spinning up a new GCP application load balancer for every service that needs to be accessible externally could eat up your cloud budget quickly in a production scenario.
This is just a really fast way to have some demos or really simple setup with a no brainer process for https-ready services.
