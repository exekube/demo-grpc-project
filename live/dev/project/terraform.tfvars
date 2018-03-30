# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/exekube-modules//gcp-project"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

create_static_ip_address = true

dns_zones = {
  "swarm-pw" = "swarm.pw."
}

dns_records = {
  "swarm-pw" = "*.swarm.pw."
}
