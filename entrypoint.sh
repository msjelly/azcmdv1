#!/usr/bin/env bash
set -e

if [ -z ${AZ_CLIENT_ID} ]; then
    # n.b. https://github.com/Azure/azure-cli/issues/9537
    echo "logging in with managed identity"
    az login --identity
else
    echo logging in as ${AZ_CLIENT_ID}
    az login --service-principal --username  ${AZ_CLIENT_ID} --password ${AZ_CLIENT_SECRET} --tenant ${AZ_TENANT_ID}
    echo setting subscription
    az account set --subscription ${AZ_SUBSCRIPTION_ID}
fi

exec "$@"
