
```powershell
	# Create an emergency user
	# Create an emergency user
	$EmergencyUserUPNPrefix = "EmUser4"
	$UserDisplayName = "EmergencyUser"
	$Connection = Connect-AzureAD
	$TenantDomain = $Connection.TenantDomain
	$CurrentlyLoggedInUser = $connection.Account | select -ExpandProperty Id
	$CurrentUserId = Get-AzureADUser -Filter "UserPrincipalName eq '$CurrentlyLoggedInUser'" | select -ExpandProperty ObjectId
	$CurrentlyLoggedInUser = $connection.Account | select -ExpandProperty Id
	$OnMicrosoftDomain = $CurrentlyLoggedInUser.substring($CurrentlyLoggedInUser.IndexOf('@'))
	$UserPrincipalName = $EmergencyUserUPNPrefix+$OnMicrosoftDomain
	Add-Type -AssemblyName System.Web
	$UserPassword = [System.Web.Security.Membership]::GeneratePassword(32,2)
	$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
	$PasswordProfile.Password = $UserPassword
	$UserPassword
	$NewUser = New-AzureADUser -DisplayName $UserDisplayName -PasswordProfile $PasswordProfile -AccountEnabled $true -UserPrincipalName $UserPrincipalName -MailNickName "EmUser"
	
	# Adding the new user to Global Admin role
	$GlobalAdminRole = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq  "Global Administrator"} 
	Add-AzureADDirectoryRoleMember -ObjectId $GlobalAdminRole.ObjectId -RefObjectId $NewUser.ObjectId 
```
