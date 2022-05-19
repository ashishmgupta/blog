We will create a conditional access policy to enforce all MFA on all users excluding an emergency Azure cloud-only Account. <br>
Below is the PowerShell script for the same.
If the emergency account does not exist, It will create the account before creating the conditional access policy. <br>

The PowerShell script : <br>

```powershell
$TenantDetails = $NULL
$CurrentlyLoggedInUser = $NULL
$OnMicrosoftDomain = $NULL
$connection = $NULL
try { 
	$AzureADSession = Get-AzureADCurrentSessionInfo
	$CurrentlyLoggedInUser = $AzureADSession.Account | select -ExpandProperty Id
	Write-Host "Already connected to : $AzureADSession.TenantDomain as $CurrentlyLoggedInUser"
	
} 
catch [Microsoft.Open.Azure.AD.CommonLibrary.AadNeedAuthenticationException] { 
	Write-Host "You're not connected to AzureAD. Connecting now..."; 
	$connection = Connect-AzureAD
	$AzureADSession = Get-AzureADCurrentSessionInfo
	$CurrentlyLoggedInUser = $AzureADSession.Account | select -ExpandProperty Id
	Write-Host "Connected to : $AzureADSession.TenantDomain as $CurrentlyLoggedInUser"
}
$CurrentlyLoggedInUser
$CurrentUserId = Get-AzureADUser -Filter "UserPrincipalName eq '$CurrentlyLoggedInUser'" | select -ExpandProperty ObjectId
$EmergencyUserUPNPrefix = "EmUser"
$UserDisplayName = "EmergencyUser"
$TenantDomain = $Connection.TenantDomain
$OnMicrosoftDomain = $CurrentlyLoggedInUser.substring($CurrentlyLoggedInUser.IndexOf('@'))
$OnMicrosoftDomain
$UserPrincipalName = $EmergencyUserUPNPrefix+$OnMicrosoftDomain


$EmUser = $NULL

try{
	$EmUser = Get-AzureADUser -ObjectId $UserPrincipalName -ErrorAction silentlycontinue
	write-output("Emergency user " + $UserPrincipalName + ' already exists.')
}catch{
	write-output("Emergency user " + $UserPrincipalName + ' does not exist. Creating now..')
	Add-Type -AssemblyName System.Web
	$UserPassword = [System.Web.Security.Membership]::GeneratePassword(32,2)
	$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
	$PasswordProfile.Password = $UserPassword
	$UserPassword
	$NewUser = New-AzureADUser -DisplayName $UserDisplayName -PasswordProfile $PasswordProfile -AccountEnabled $true -UserPrincipalName $UserPrincipalName -MailNickName "EmUser"

	# Adding the new user to Global Admin role
	Write-output "Adding the new user to Global Admin r+ole"
	$GlobalAdminRole = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq  "Global Administrator"} 
	Add-AzureADDirectoryRoleMember -ObjectId $GlobalAdminRole.ObjectId -RefObjectId $NewUser.ObjectId 

	# Saving the details for the app
	$temp_location = (get-location).Drive.Root+"office365_temp\"
	$temp_file = $temp_location + $CurrentTimestamp+".txt"
	New-Item $temp_location -ItemType Directory -Force | Out-Null
	New-Item $temp_file -ItemType File -Force | Out-Null
	Add-Content $temp_file ("Tenant Domain: " + $AzureADSession.TenantDomain)
	Add-Content $temp_file ("Tenant Id: " + $AzureADSession.TenantId)
	Add-Content $temp_file ("Username: " + $UserPrincipalName)
	Add-Content $temp_file ("Password: " + $UserPassword)
	.\notepad.exe $temp_file
	write-output("User details written to the file\r\n")
}
	
	$conditions = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessConditionSet
	$conditions.Applications = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessApplicationCondition
	$conditions.Applications.IncludeApplications = "all"
	$conditions.Users = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessUserCondition
	$conditions.Users.IncludeUsers = "all"
	$conditions.Users.ExcludeUsers = $EmUser.ObjectId
	$controls = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessGrantControls
	$controls._Operator = "OR"
	$controls.BuiltInControls = "mfa"
	New-AzureADMSConditionalAccessPolicy -DisplayName "Enforce MFA on all users" -State "Enabled" -Conditions $conditions -GrantControls $controls
	Write-Output "Conditional Access policy created"
```
<br>
Conditional Access policy is created.<br>
<img src="../../../images/o365security/implement-mfa-01.png"></img><br>

<br>
MFA is enforced for all apps.<br>
<img src="../../../images/o365security/implement-mfa-03.png"></img><br>

<br>
MFA is enforced for all users except the emergency global admin user.<br>
<img src="../../../images/o365security/implement-mfa-02.png"></img><br>

