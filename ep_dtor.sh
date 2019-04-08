#!/usr/bin/env bash

export TM_RESOURCE_GROUP=$1
export TM_RG_LOCATION=$2
export TM_NAME=$3
export TM_DNS_PREFIX=$4
export ENDPOINT_NAME=$5
export ENDPOINT_ADDRESS=$6


az network traffic-manager endpoint show \
  -g ${TM_RESOURCE_GROUP} \
  --profile-name ${TM_NAME} \
  -n ${ENDPOINT_NAME} \
  --type externalEndpoints

if [ $? -eq 0 ]; then
    echo "deleting endpoint"
    az network traffic-manager endpoint delete \
      -g ${TM_RESOURCE_GROUP} \
      --profile-name ${TM_NAME} \
      -n ${ENDPOINT_NAME} \
      --type externalEndpoints 
fi
