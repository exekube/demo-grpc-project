terraform {
  backend "gcs" {}
}

variable "secrets_dir" {}

# Install Tiller in kube-system namespace with cluster-admin permissions
#   for all namespaces
module "system_tiller" {
  source = "/exekube-modules/helm-initializer"

  secrets_dir = "${var.secrets_dir}"
}

# Tiller for team1 ns
module "team1_tiller" {
  source = "/exekube-modules/helm-initializer"

  secrets_dir      = "${var.secrets_dir}"
  tiller_namespace = "team1"
}

# Tiller for team2 ns
module "team2_tiller" {
  source = "/exekube-modules/helm-initializer"

  secrets_dir      = "${var.secrets_dir}"
  tiller_namespace = "team2"
}
