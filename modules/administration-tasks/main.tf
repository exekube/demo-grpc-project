terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}

provider "helm" {}

resource "helm_repository" "exekube" {
  name = "exekube"
  url  = "https://exekube.github.io/charts"

  provisioner "local-exec" {
    command = "helm repo update"
  }
}

module "administration_tasks" {
  // Note the `helm-template-release` module (Tillerless Helm)
  source = "/exekube-modules/helm-template-release"

  release_name      = "adm"
  release_namespace = "kube-system"

  chart_repo    = "${helm_repository.exekube.name}"
  chart_name    = "administration-tasks"
  chart_version = "0.3.0"
}
