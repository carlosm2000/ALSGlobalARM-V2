$redis = (az redis show -g "webfrontend-bx-rg" -n "webfrontend-bx-redis" | ConvertFrom-Json)
$hostname = $redis.hostName
$port = $redis.sslPort
$key = (az redis list-keys -g "webfrontend-bx-rg" -n "webfrontend-bx-redis" | ConvertFrom-Json).primaryKey

$connString = "$($hostname):$($port),password=$($key),ssl=True,abortConnect=False"

 
az keyvault secret set -n "sitecore-redis-connectionstring" --vault-name "webfrontend-bx-keyvault" --value $connString