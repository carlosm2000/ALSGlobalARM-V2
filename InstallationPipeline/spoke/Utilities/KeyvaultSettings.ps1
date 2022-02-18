#set access policy for manage identity
$principalId = (az identity list -g "webfrontend-bx-rg" | ConvertFrom-Json).principalId
$principalObjectId = (az ad sp show --id $principalId | ConvertFrom-Json).objectId
az keyvault set-policy -n "webfrontend-bx-keyvault" -g "webfrontend-bx-rg" --key-permissions get list --secret-permissions get list --certificate-permissions get list getissuers listissuers --object-id $principalObjectId

#set agent ip
$agentIP = az vm show -d -g "webfrontend-bx-rg" -n "agent-vm" --query publicIps -o tsv
az keyvault network-rule add -n "webfrontend-bx-keyvault" -g "webfrontend-bx-rg" --ip-address "$($agentIP)/32"


