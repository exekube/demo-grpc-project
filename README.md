# demo-grpc-project

- Team 1 is developing gRPC client (web application)
- Team 2 is developing gRPC server
- Use deny all `NetworkPolicy` for team1 and team2 namespaces
- Allow only traffic that our applications require (principle of least privilege)

## Networking

### Privately expose your API

By default, this project ships with minimally configured networking for simplicity and ease of setup, though our services will be available only privately via `kubectl proxy` (from within the cluster). For this project, you can enable the proxy by typing in your shell

```sh
docker-compose up
```

Use can then access the applications using the "Private address" links below.

### Publicly expose your API

If we want to expose our services (applications) on the public Internet, we will need to:

1. Create an [external static IP address](/) for `nginx-ingress` service.
2. Enable `nginx-ingress` (Kubernetes LoadBalancer type of service)
3. Create DNS records to point clients to this address
4. Use [cert-manager](https://github.com/jetstack/cert-manager) to enable TLS for the domains
5. Enable `Ingress` resources for our Helm releases.

Use [this pull request](/) as an example of how to set up production networking.

There is also a step-by-step tutorial: <https://docs.exekube.com/in-practice/production-networking>


## Modules

### Base modules

This project uses the Exekube [base-project](https://github.com/exekube/base-project) as boilerplate.

Modules from base-project:

- gke-network
- gke-cluster
- administration-tasks

### modules/nginx-ingress

We use nginx-ingress as our Kubernetes ingress controller.

### modules/grpc-client

- Private address: <http://localhost:8001/api/v1/namespaces/team1/services/grpc-client-demo-api:80/proxy/payments/status>
- Public address: [read instructions above](#apps-on-the-public-internet)

*Expected response*: `{"status":"ok","message":"200 OK"}`

### modules/grpc-server

- Private address: access through grpc-client
- Public address: access through grpc-client
