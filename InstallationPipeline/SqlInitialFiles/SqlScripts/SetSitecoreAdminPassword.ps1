[CmdletBinding(DefaultParameterSetName = 'None')]
param
(
  [String] [Parameter(Mandatory = $true)] $FilePath,
  [String] [Parameter(Mandatory = $true)] $ScAdminPassword
)

$ErrorActionPreference = 'Stop'

If(Test-Path -Path $FilePath) {
  If((-Not([string]::IsNullOrEmpty($ScAdminPassword)))) {
    Write-Host "Replacing SC Admin Password on $FilePath"
    (Get-Content $FilePath) -replace 'PlaceHolderForPassword', "$ScAdminPassword" | Set-Content $FilePath
  }
  Write-Host "Done replacing $FilePath"
}
else {
  Write-Host "Not found $FilePath"
}



