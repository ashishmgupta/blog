# Implement MFA

We will create a conditional access policy to enforce all MFA on all users excluding an emergency Azure cloud-only Account. <br>
Below is the PowerShell script for the same.
If the emergency account does not exist, It will create the account before creating the conditional access policy. <br>

### The PowerShell script to enforce MFA <br>

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

### Number matching (Currently in preview)
As of the day of writing this (5/23/2022), this feature is <a href="https://docs.microsoft.com/en-us/azure/active-directory/authentication/how-to-mfa-number-match">in preview and not GA.</a><br>
However, It will be enabled by default when It goes GA just because of added security and great user experience.<br>

<br>
Just like <a href="https://en.wikipedia.org/wiki/Password_fatigue">password fatigue</a> caused users to re-use passwords and get compromised If we use push notifications for MFA, and if an attacker constantly sends push notifications to users with compromised credentials, users would eventually push and that would lead to the attacker accessing the user's cloud resources. <br>

To counter "push fatigue" [ a made-up term :)], Microsoft launched a new feature named "Number matching" (currently in preview). <br>
<a href="https://docs.microsoft.com/en-us/azure/active-directory/authentication/how-to-mfa-number-match">https://docs.microsoft.com/en-us/azure/active-directory/authentication/how-to-mfa-number-match</a><br>

Login to Azure Portal > Azure Active Directory > Security > Authentication methods and click on the "Microsoft Authenticator" <br>
<img src="../../../images/o365security/implement-mfa-04.png"></img><br>

Click on the "..." and then configure. <br>
<img src="../../../images/o365security/implement-mfa-05.png"></img><br>

Make sure "Require number matching" is set to "Enabled". <br>
Also, make sure the "Show additional context in notification" is also enabled. <br> This provides for which app the login is being performed. <br>
<img src="../../../images/o365security/implement-mfa-06.png"></img><br>

Now when the user logs in, after the user name and password has been validated, the browser shows a number and a notification is sent to the Microsoft Authenticator. We need to enter the same number in the authenticator to be successfully and fully authenticated via MFA.<br>

<table>
	<tr>
		<td>Bworser shows the number during log in process</td>
		<td>Enter the same number in the Microsoft Authenticator app</td>
	</tr>
	<tr>
		<td><img src="../../../images/o365security/implement-mfa-07.png"></img></td>
		<td><img src="../../../images/o365security/implement-mfa-08.png"></img></td>
	</tr>
</table>

I notice the number is always double-digit (not 5 or 6 digits).<br>
So, not only It adds to security by having the user enter the number (instead of an ignorant push) but also Its a great user experience because It's just two digits and easy to remember.