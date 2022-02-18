$certificatePassword = "Password12345!!"

$newCert = New-SelfSignedCertificate -DnsName "localhost" -FriendlyName "Sitecore Identity Token Signing" -NotAfter (Get-Date).AddYears(5)

Export-PfxCertificate -Cert $newCert -FilePath C:\Temp\nwn\SitecoreIdentityTokenSigning.pfx -Password (ConvertTo-SecureString -String $certificatePassword -Force -AsPlainText)

$certItem = Get-Item C:\Temp\nwn\SitecoreIdentityTokenSigning.pfx

[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes(($certItem))) | Out-File -Encoding ascii -NoNewline -Confirm -FilePath C:\Temp\nwn\sitecore-identitycertificate.txt
