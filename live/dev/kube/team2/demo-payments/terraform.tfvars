# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/exekube-modules//helm-release"
  }

  dependencies {
    paths = [
      "../helm-tiller",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

release_spec = {
  enabled = true

  release_name     = "demo-payments"
  namespace        = "team2"
  tiller_namespace = "team2"

  chart_repo    = "exekube"
  chart_name    = "demo-payments"
  chart_version = "0.1.2"
}
