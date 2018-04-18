terraform {
  backend "gcs" {}
}

// We use `helm template` since we want to run this before installing Tiller
resource "null_resource" "administration_tasks" {
  provisioner "local-exec" {
    command = <<EOF
    helm template --values ${path.module}/values.yaml \
    --execute templates/rolebinding-admins.yaml \
    ${path.module}/chart \
    | kubectl apply -f - \
    && sleep 7 \
    && helm template --values ${path.module}/values.yaml \
    ${path.module}/chart > ${path.module}/generated.yaml \
    && kubectl apply -f ${path.module}/generated.yaml
EOF
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl delete -f ${path.module}/generated.yaml"
  }
}
