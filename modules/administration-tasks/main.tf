terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}

module "administration_tasks" {
  // Note the `helm-template-release` module (Tillerless Helm)
  source = "/exekube-modules/helm-template-release"

  release_name      = "adm"
  release_namespace = "kube-system"

  chart_repo    = "exekube"
  chart_name    = "administration-tasks"
  chart_version = "0.3.0"
}
