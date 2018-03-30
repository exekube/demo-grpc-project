# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/exekube-modules//helm-tiller"
  }

  dependencies {
    paths = [
      "../../cluster",
      "../../kube-system/cluster-admin",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

tiller_namespace = "team2"
