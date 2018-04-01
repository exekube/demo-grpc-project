# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/exekube-modules//helm-release"
  }

  dependencies {
    paths = [
      "../_helm",
      "../../kube-system/cluster-admin",
      "../../kube-system/ingress-controller",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

release_spec = {
  enabled = true

  release_name     = "demo-api"
  namespace        = "team1"
  tiller_namespace = "team1"

  chart_repo    = "exekube"
  chart_name    = "demo-api"
  chart_version = "0.1.2"

  domain_name = "status.swarm.pw"
}
