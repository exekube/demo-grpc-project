terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}
variable "domain_name" {}

module "grpc_client" {
  source           = "/exekube-modules/helm-release-v2"
  tiller_namespace = "team1"
  client_auth      = "${var.secrets_dir}/team1/helm-tls"

  release_name      = "grpc-client"
  release_namespace = "team1"
  domain_name       = "${var.domain_name}"

  chart_repo    = "exekube"
  chart_name    = "demo-api"
  chart_version = "0.1.2"
}
