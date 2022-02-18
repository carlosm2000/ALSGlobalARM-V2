[CmdletBinding(DefaultParameterSetName = 'None')]
param
(
  [String] [Parameter(Mandatory = $true)] $ClusterName,
  [String] [Parameter(Mandatory = $true)] $ACRName,
  [String] [Parameter(Mandatory = $true)] $AppGWName,
  [String] [Parameter(Mandatory = $true)] $ResourceGroup
)
$ACRName = $ACRName.replace('-','')
$appgwId = $(az network application-gateway show -n $AppGWName -g $ResourceGroup -o tsv --query "id") 
az aks disable-addons -a ingress-appgw -n $ClusterName -g $ResourceGroup
az aks enable-addons -n $ClusterName -g $ResourceGroup -a ingress-appgw --appgw-id $appgwId
az aks update -n $ClusterName -g $ResourceGroup --attach-acr $ACRName

# adding hub private link
$dnsZone = (az network private-dns zone list -g "MC_webfrontend-bx-rg_webfrontend-bx-aks-cluster_westus2" | ConvertFrom-Json).name
$agentVnetId = (az network vnet show -g "webfrontend-bx-rg" -n "webfrontend-bx-hub-vnet" | ConvertFrom-Json).id
az network private-dns link vnet create -g "MC_webfrontend-bx-rg_webfrontend-bx-aks-cluster_westus2" -z $dnsZone -e true -n "aks-agent" -v $agentVnetId
