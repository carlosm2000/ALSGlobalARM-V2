# Oshyn - Pay-As-You-Go Dev/Test
#Connect-AZAccount -Subscription 80e2f4cb-198c-49b1-ad82-da207799c3f9

# Oshyn - Pay-As-You-Go
#Connect-AZAccount -Subscription d76d72fb-442d-4770-bd16-ad5a936f5336

# ALS
#Connect-AZAccount -Subscription ef08bd0e-f03b-4670-9049-586d63da00a1

$deploymentName = "AlsGlobalDeploymentQA"
$deploymentNamek8s = "AlsGlobalK8sDeploymentQA"
$resourceGroup = "ALSGlobal-Website"

$azuredeployFile = "https://raw.githubusercontent.com/carlosm2000/ALSGlobalARM-V2/master/azureEnvARMTemplates/XPk8s/azuredeploy.json"
$azuredeployparametersFile = "https://raw.githubusercontent.com/carlosm2000/ALSGlobalARM-V2/master/azureEnvARMTemplates/XPk8s/azuredeploy.parameters.json"
$azuredeployk8sFile = "https://raw.githubusercontent.com/carlosm2000/ALSGlobalARM-V2/master/azureEnvARMTemplates/XPk8s/azuredeployk8s.json"
$azuredeployk8sparametersFile = "https://raw.githubusercontent.com/carlosm2000/ALSGlobalARM-V2/master/azureEnvARMTemplates/XPk8s/azuredeployk8s.parameters.json"


# New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroup -TemplateUri $azuredeployFile -TemplateParameterUri $azuredeployparametersFile -debug
New-AzResourceGroupDeployment -Name $deploymentNamek8s -ResourceGroupName $resourceGroup -TemplateUri $azuredeployk8sFile -TemplateParameterUri $azuredeployk8sparametersFile -debug
