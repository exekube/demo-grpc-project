# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//gke-network"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

dns_zones = {
  grpc-exekube-us = "grpc.exekube.us."
}

dns_records = {
  grpc-exekube-us = "*.grpc.exekube.us."
}
