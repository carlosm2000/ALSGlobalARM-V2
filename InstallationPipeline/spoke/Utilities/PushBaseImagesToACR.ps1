[CmdletBinding(DefaultParameterSetName = 'None')]
param
(
  [String] [Parameter(Mandatory = $true)] $ACRName
)

$SITECORE_DOCKER_REGISTRY="scr.sitecore.com/sxp/"
$SITECORE_VERSION="10.2.0-ltsc2019"
$SITECORE_TOOLS_REGISTRY="scr.sitecore.com/tools/"
$TOOLS_VERSION="10.2-1809"
$SITECORE_MODULE_REGISTRY="scr.sitecore.com/sxp/modules/"
$SPE_VERSION="6.3-1809"
$HORIZON_VERSION="3.0-ltsc2019"
$MANAGEMENT_SERVICES_VERSION="4.0.1-1809"
$HORIZON_ASSET_VERSION="3.0.0-1809"

$ACRName = $ACRName.replace('-','')
az acr login -n $ACRName --expose-token
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-cd:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-cd:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-cm:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-cm:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-id6:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-id6:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-cortexprocessing:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-cortexprocessing:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-cortexprocessingworker:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-cortexprocessingworker:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-cortexreporting:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-cortexreporting:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-prc:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-prc:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-xdbautomation:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-xdbautomation:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-xdbautomationrpt:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-xdbautomationrpt:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-xdbautomationworker:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-xdbautomationworker:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-xdbcollection:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-xdbcollection:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-xdbrefdata:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-xdbrefdata:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-xdbsearch:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-xdbsearch:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_DOCKER_REGISTRY)sitecore-xp1-xdbsearchworker:$($SITECORE_VERSION)" -t "sitecorebaseimages/sitecore-xp1-xdbsearchworker:$($SITECORE_VERSION)" --force

az acr import --name $ACRName --source "$($SITECORE_TOOLS_REGISTRY)sitecore-docker-tools-assets:$($TOOLS_VERSION)" -t "sitecoretoolsimages/sitecore-docker-tools-assets:$($TOOLS_VERSION)" --force

az acr import --name $ACRName --source "$($SITECORE_MODULE_REGISTRY)sitecore-horizon:$($HORIZON_VERSION)" -t "sitecoremodulesimages/sitecore-horizon:$($HORIZON_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_MODULE_REGISTRY)sitecore-spe-assets:$($SPE_VERSION)" -t "sitecoremodulesimages/sitecore-spe-assets:$($SITECORE_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_MODULE_REGISTRY)horizon-integration-xp1-assets:$($HORIZON_ASSET_VERSION)" -t "sitecoremodulesimages/horizon-integration-xp1-assets:$($HORIZON_ASSET_VERSION)" --force
az acr import --name $ACRName --source "$($SITECORE_MODULE_REGISTRY)sitecore-management-services-xp1-assets:$($MANAGEMENT_SERVICES_VERSION)" -t "sitecoremodulesimages/sitecore-management-services-xp1-assets:$($MANAGEMENT_SERVICES_VERSION)" --force

