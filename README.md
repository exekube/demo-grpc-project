# demo-grpc-project

This is a demo project built with the [Exekube framework](https://github.com/exekube/exekube)

> :warning:
>
> This is a work in progress
>
> :warning:

---

If you are new to Exekube, follow the *Getting Started Tutorial* at https://exekube.github.io/exekube/in-practice/getting-started

## What we're building

Our goal is to create a production-like GKE cluster, then deploy these applications onto it:

- A gRPC server
- A REST HTTP(S) client app that will return a response from the gRPC server when you `curl https://YOURDOMAIN.com/payments/status`

## How to configure the project

To get this working, you'll need to:

1. Set the *GCP project* name base in `docker-compose.yaml`:
    ```yaml
    TF_VAR_project_id: ${ENV:?err}-demo-apps-296e23
    ```
2. Configure project-scoped modules in the `modules` directory: all settings that will be *the same across all environments of the project*.
3. Configure module imports for the *dev* environment in the `live/dev` directory. We use [Terragrunt](/) to do module imports for us.

... to be continued ...
