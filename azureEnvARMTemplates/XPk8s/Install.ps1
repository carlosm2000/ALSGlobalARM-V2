# Local
#Connect-AZAccount -Subscription 80e2f4cb-198c-49b1-ad82-da207799c3f9

# ALS
#Connect-AZAccount -Subscription ef08bd0e-f03b-4670-9049-586d63da00a1

$deploymentName = "AlsGlobalDeployment01"
$deploymentNamek8s = "AlsGlobalK8sDeployment01"
$resourceGroup = "ALSGlobal-Website"

$templateFile = "https://raw.githubusercontent.com/carlosm2000/AlsGlobalArm/master/azuredeploy.json?token=GHSAT0AAAAAABMBPMD4FQSPWZ3BWKLIMKQKYO55DUQ"
$templateFilek8s = "https://raw.githubusercontent.com/carlosm2000/AlsGlobalArm/master/azuredeployk8s.json?token=GHSAT0AAAAAABMBPMD5VRAZ2WBWRD34YE2WYO55EBQ"
$parameterFile = "https://raw.githubusercontent.com/carlosm2000/AlsGlobalArm/master/azuredeploy.parameters.json?token=GHSAT0AAAAAABMBPMD4OOH2KE37GPURRRMEYO55EAQ"

# New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroup -TemplateUri $templateFile -TemplateParameterUri $parameterFile -debug
New-AzResourceGroupDeployment -Name $deploymentNamek8s -ResourceGroupName $resourceGroup -TemplateUri $templateFilek8s -TemplateParameterUri $parameterFile -debug