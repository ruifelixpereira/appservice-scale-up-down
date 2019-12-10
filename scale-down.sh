#!/bin/bash

# Load configurations
set -o allexport
source .env
set +o allexport

# Scale Up an App Service plan
az appservice plan update \
  --name $AZURE_APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --sku $SCALEDOWN_PLAN_TIER
