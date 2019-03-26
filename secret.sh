kubectl create secret generic azcreds \
  --namespace=${K8S_NAMESPACE} \
  --from-literal=AZ_CLIENT_ID=${AZ_CLIENT_ID} \
  --from-literal=AZ_CLIENT_SECRET=${AZ_CLIENT_SECRET} \
  --from-literal=AZ_TENANT_ID=${AZ_TENANT_ID} \
  --from-literal=AZ_SUBSCRIPTION_ID=${AZ_SUBSCRIPTION_ID}

