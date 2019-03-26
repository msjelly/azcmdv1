#!/usr/bin/env bash
set -e
echo logging in as ${AZ_CLIENT_ID}
az login --service-principal --username  ${AZ_CLIENT_ID} --password ${AZ_CLIENT_SECRET} --tenant ${AZ_TENANT_ID}

echo setting subscription
az account set --subscription ${AZ_SUBSCRIPTION_ID}

exec "$@"
