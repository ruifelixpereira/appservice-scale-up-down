#!/bin/bash

# Load configurations
set -o allexport
source .env
set +o allexport

while sleep 1;do curl -s -w "@curlfile" -o /dev/null https://$AZURE_APP_NAME.azurewebsites.net/version; done