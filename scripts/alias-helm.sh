#!/bin/bash

ns=team1

alias helm="helm --tiller-namespace $ns \
--tls --tls-verify \
--tls-ca-cert $TF_VAR_secrets_dir/$ns/helm-tiller/ca.cert.pem \
--tls-cert $TF_VAR_secrets_dir/$ns/helm-tiller/helm.cert.pem \
--tls-key $TF_VAR_secrets_dir/$ns/helm-tiller/helm.key.pem"
