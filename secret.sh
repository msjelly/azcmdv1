kubectl create secret generic azcreds \
  --namespace=${K8S_NAMESPACE} \
  --from-literal=AZ_CLIENT_ID=${ARM_CLIENT_ID} \
  --from-literal=AZ_CLIENT_SECRET=${ARM_CLIENT_SECRET} \
  --from-literal=AZ_TENANT_ID=${ARM_TENANT_ID} \
  --from-literal=AZ_SP_OBJECT_ID=${ARM_SP_OBJECT_ID} \
  --from-literal=AZ_SUBSCRIPTION_ID=${ARM_SUBSCRIPTION_ID}

