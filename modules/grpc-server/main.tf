terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}

module "grpc_server" {
  source           = "/exekube-modules/helm-release"
  tiller_namespace = "team2"
  client_auth      = "${var.secrets_dir}/team2/helm-tls"

  release_name      = "grpc-server"
  release_namespace = "team2"

  chart_repo    = "exekube"
  chart_name    = "demo-payments"
  chart_version = "0.1.2"
}
