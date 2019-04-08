#!/usr/bin/env bash

export TM_RESOURCE_GROUP=$1
export TM_RG_LOCATION=$2
export TM_NAME=$3
export TM_DNS_PREFIX=$4
export ENDPOINT_NAME=$5
export ENDPOINT_ADDRESS=$6


az group create -l ${TM_RG_LOCATION} -n ${TM_RESOURCE_GROUP}

az network traffic-manager profile show -g ${TM_RESOURCE_GROUP} -n ${TM_NAME}
if [ $? -eq 0 ]; then
    echo "traffic manager found"
else
    az network traffic-manager profile check-dns -n ${TM_DNS_PREFIX}
    if [ $? -eq 0 ]; then
        az network traffic-manager profile create \
          -g ${TM_RESOURCE_GROUP} \
          -n ${TM_NAME} --routing-method Weighted \
          --unique-dns-name ${TM_DNS_PREFIX} \
          --ttl 30 \
          --protocol HTTP \
          --port 80 \
          --path "/"
        if [ $? -ne 0 ]; then
            echo "Traffic Manager profile creation failed"
            exit 1
        fi
    else
        echo "DNS availability check failed"
        exit 1
    fi
fi

az network traffic-manager endpoint show \
  -g ${TM_RESOURCE_GROUP} \
  --profile-name ${TM_NAME} \
  -n ${ENDPOINT_NAME} \
  --type externalEndpoints

if [ $? -eq 0 ]; then
    echo "endpoint found"
else
    echo "creating endpoint"
    az network traffic-manager endpoint create \
      -g ${TM_RESOURCE_GROUP} \
      --profile-name ${TM_NAME} \
      -n ${ENDPOINT_NAME} \
      --type externalEndpoints \
      --target ${ENDPOINT_ADDRESS} \
      --endpoint-status enabled \
      --weight 100
fi
