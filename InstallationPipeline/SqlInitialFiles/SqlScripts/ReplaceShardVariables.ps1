[CmdletBinding(DefaultParameterSetName = 'None')]
param
(
  [String] [Parameter(Mandatory = $true)] $FilePath,
  [String] [Parameter(Mandatory = $true)] $ServerName,
  [String] [Parameter(Mandatory = $true)] $Shard0Name,
  [String] [Parameter(Mandatory = $true)] $Shard1Name
)

$ErrorActionPreference = 'Stop'

If(Test-Path -Path $FilePath) {
  Write-Host "Replacing values on $FilePath"
  (Get-Content $FilePath) -replace 'dbserverplaceholder', "$ServerName" | Set-Content $FilePath
  (Get-Content $FilePath) -replace 'PlaceholderShard0', "$Shard0Name" | Set-Content $FilePath
  (Get-Content $FilePath) -replace 'PlaceholderShard1', "$Shard1Name" | Set-Content $FilePath
  Write-Host "Done replacing $FilePath"
}
else {
  Write-Host "Not found $FilePath"
}


