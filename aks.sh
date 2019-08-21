#!/usr/bin/env bash 
#-v
set -x
export AKS_NAME=$1
export AKS_RG=$2
export AGENTPOOL_NAME=$3
export POOL_VMSIZE=$4
export POOL_MIN=$5
export POOL_MAX=$6
export SUBSCRIPTION_ID=${AZ_SUBSCRIPTION_ID}

az extension add --name aks-preview
az extension update --name aks-preview

list_nodepool() {
    az aks nodepool list --cluster-name ${AKS_NAME} -g ${AKS_RG} --query "[?name=='${AGENTPOOL_NAME}']| [0]"
}

add_nodepool() {
    az aks nodepool add --cluster-name ${AKS_NAME} -g ${AKS_RG} --name ${AGENTPOOL_NAME} \
    --min-count ${POOL_MIN} \
    --max-count ${POOL_MAX} \
    --node-vm-size ${POOL_VMSIZE} \
    --os-type "Linux"
}

az login --identity
for (( i=0; i<3; ++i)); do
    echo "Loop Count $i"
    list_nodepool
    add_nodepool
    sleep 10
done
   