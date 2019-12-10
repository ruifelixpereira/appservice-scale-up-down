# Introduction

The goal is to test the impact of scaling up and down an App Service plan and validate the impact in the performance and availability of the applications deployed.

## How to test

### Step 1. Deploy your app

Deploy your application to Azure App Service.

### Step 2. Start injecting request into your app

Before, during and after the scaling operation we run curl with the required parameters as such. Open a terminal windows an run these commands (you can also use the provided monitor.sh sample file):

```shell
while sleep 3;do curl -s -w "@curlfile" -o /dev/null https://<your-app>.azurewebsites.net; done
```

### Step 3. Scale Up/Down

Open a second terminal window and run this command (you can also use the provided scale-up.sh and scale-down.sh sample files):

```shell
az appservice plan update \
  --name $AZURE_APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --sku $SCALEUP_PLAN_TIER
```

While you are running this scaling command you can validate the impact on the response times of your application being shown in the terminal window started in Step 1, but without "downtime".

## Results

From the testing results you will experience a delayed response for some seconds (I've measured 4 to 6 seconds with my app) as traffic is routed to a new instance with the requested size and still requires the initial warm up. However, the application service is always available, without "downtime"

## References

[1] - https://www.wesleyhaakman.org/azure-app-service-when-do-you-plan-for-scaling/
