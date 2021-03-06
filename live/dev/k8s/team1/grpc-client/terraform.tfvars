# ↓ Module metadata
terragrunt = {
  terraform {
    source = "/project/modules//grpc-client"
  }

  dependencies {
    paths = [
      "../../kube-system/helm-initializer",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

domain_name = "dev.grpc.exekube.us"
