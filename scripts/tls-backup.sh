#!/bin/bash

domain_zone="swarm.pw"
source=("status")
green="\e[1;32m"
no_color="\e[0m"
secret_file_name="certs-$(date '+%Y-%m-%d-%H-%M-%S').yaml"

for i in ${source[@]}
do
    echo "---" >> ${TF_VAR_secrets_dir}/kube-system/kube-lego/${secret_file_name} \
    && kubectl -n team1 get secret $i.$domain_zone-tls -o yaml >> ${TF_VAR_secrets_dir}/kube-system/kube-lego/${secret_file_name} \
    && printf "${green}Secret $i.$domain_zone-tls has been saved to ${TF_VAR_secrets_dir}/kube-system/${secret_file_name} successfully!\n${no_color}"
done
