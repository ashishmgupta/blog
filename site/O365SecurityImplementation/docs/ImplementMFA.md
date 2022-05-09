<b>
Create a conditional Acesss Policy to enforce all MFA on all users excluding an emergency Azure cloud-only Account 
</b>

```powershell
	$EmergencyUser = $null
	$Connection = Connect-AzureAD
	$TenantDomain = $Connection.TenantDomain
	$CurrentlyLoggedInUser = $connection.Account | select -ExpandProperty Id
	$CurrentUserId = Get-AzureADUser -Filter "UserPrincipalName eq '$CurrentlyLoggedInUser'" | select -ExpandProperty ObjectId
	$CurrentlyLoggedInUser = $connection.Account | select -ExpandProperty Id
	$OnMicrosoftDomain = $CurrentlyLoggedInUser.substring($CurrentlyLoggedInUser.IndexOf('@'))
	
	try {
	$EmergencyUser = Get-AzureAdUser -ObjectId 'EmUser@redteamsimulation.onmicrosoft.com'
	}
	catch
	{
		# Create an emergency user
		$EmergencyUserUPNPrefix = "EmUser"
		$UserDisplayName = "EmergencyUser"
		$UserPrincipalName = $EmergencyUserUPNPrefix+$OnMicrosoftDomain
		Add-Type -AssemblyName System.Web
		$UserPassword = [System.Web.Security.Membership]::GeneratePassword(32,2)
		$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
		$PasswordProfile.Password = $UserPassword
		$UserPassword
		$EmergencyUser = New-AzureADUser -DisplayName $UserDisplayName -PasswordProfile $PasswordProfile -AccountEnabled $true -UserPrincipalName $UserPrincipalName -MailNickName "EmUser"
	
		# Adding the new user to Global Admin role
		$GlobalAdminRole = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq  "Global Administrator"} 
		Add-AzureADDirectoryRoleMember -ObjectId $GlobalAdminRole.ObjectId -RefObjectId $EmergencyUser.ObjectId 
	}
	
	$conditions = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessConditionSet
	$conditions.Applications = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessApplicationCondition
	$conditions.Applications.IncludeApplications = "all"
	$conditions.Users = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessUserCondition
	$conditions.Users.IncludeUsers = "all"
	$conditions.Users.ExcludeUsers = $EmergencyUser.ObjectId
	$controls = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessGrantControls
	$controls._Operator = "OR"
	$controls.BuiltInControls = "mfa"
	New-AzureADMSConditionalAccessPolicy -DisplayName "Enforce MFA on all users" -State "Enabled" -Conditions $conditions -GrantControls $controls
	

```