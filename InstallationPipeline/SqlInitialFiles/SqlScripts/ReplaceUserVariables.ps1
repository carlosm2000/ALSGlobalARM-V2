[CmdletBinding(DefaultParameterSetName = 'None')]
param
(
  [String] [Parameter(Mandatory = $true)] $FilePath,
  [String] [Parameter(Mandatory = $true)] $Username,
  [String] [Parameter(Mandatory = $true)] $Password,
  [String] $SecUsername = "",
  [String] $SecPassword = ""
)

$ErrorActionPreference = 'Stop'

If(Test-Path -Path $FilePath) {
  Write-Host "Replacing Username on $FilePath"
  (Get-Content $FilePath) -replace 'PlaceHolderForUser', "$Username" | Set-Content $FilePath
  Write-Host "Replacing Password on $FilePath"
  (Get-Content $FilePath) -replace 'PlaceHolderForPassword', "$Password" | Set-Content $FilePath
  If((-Not([string]::IsNullOrEmpty($SecUsername))) -AND (-Not([string]::IsNullOrEmpty($SecPassword)))) {
    Write-Host "Replacing Sec Username on $FilePath"
    (Get-Content $FilePath) -replace 'PlaceHolderForSecUser', "$SecUsername" | Set-Content $FilePath
    Write-Host "Replacing Sec Password on $FilePath"
    (Get-Content $FilePath) -replace 'PlaceHolderForSecPassword', "$SecPassword" | Set-Content $FilePath
  }
  Write-Host "Done replacing $FilePath"
}
else {
  Write-Host "Not found $FilePath"
}