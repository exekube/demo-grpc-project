# Demo Exekube Project: demo-grpc-project

> :warning: This is a work in progress

The demo project uses the Exekube framework to demonstrate a deployment of

- A gRPC server
- A REST client app to our gRPC server

onto the :cloud: Google Cloud Platform, resulting in:

1. A fully-configured Google Cloud Platform *project* (each for every environment -- dev, stg, prod, etc.) with configured networking and security
2. A fully-configured GKE (Kubernetes) *cluster*
3. A *gRPC server* app (Helm release)
4. A public *REST API* (Helm release) app that is a client to our gRPC server, and responds with `{"status":"ok","message":"200 OK"}` to our https://status.YOURDOMAIN.com/payments/status requests

## Test manually

We want to be able to contact our publicly available REST API (`demo-api` Helm release), which will contact our gRPC server, (`demo-payments` Helm release) which will finally try to get a message back from <http://httpstat.us/200>

```sh
curl https://status.YOURDOMAIN.com/payments/status

{"status":"ok","message":"200 OK"}
```

## Getting Started

### Requirements

- Have *Docker for X* installed on your local machine.

... to be continued
