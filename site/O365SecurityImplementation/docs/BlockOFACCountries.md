<h1>Block OFAC Countries</h1>
<p>We create a conditional access policy to block access from OFAC countries to all apps.</p>
<p>ALL users would be blocked from OFAC countries except the currently logged in user.</p>


```powershell
	# Connect to AzureAD and get current logged in user
	$TenantDetails = $NULL
	$CurrentlyLoggedInUser = $NULL
	$OnMicrosoftDomain = $NULL
	$connection = $NULL
	try { 
 		$AzureADSession = Get-AzureADCurrentSessionInfo
		$CurrentlyLoggedInUser = $AzureADSession.Account | select -ExpandProperty Id
		Write-Host "Already connected to : $AzureADSession.TenantDomain as $CurrentlyLoggedInUser"
		$CurrentUserId = Get-AzureADUser -Filter "UserPrincipalName eq '$CurrentlyLoggedInUser'" | select -ExpandProperty ObjectId
	} 
	catch [Microsoft.Open.Azure.AD.CommonLibrary.AadNeedAuthenticationException] { 
	Write-Host "You're not connected to AzureAD. Connect now..."; 
	Write-Host "You're not connected to AzureAD"; 
	$connection = Connect-AzureAD
	$AzureADSession = Get-AzureADCurrentSessionInfo
	$CurrentlyLoggedInUser = $AzureADSession.Account | select -ExpandProperty Id
	Write-Host "Connected to : $AzureADSession.TenantDomain as $CurrentlyLoggedInUser"
	$CurrentUserId = Get-AzureADUser -Filter "UserPrincipalName eq '$CurrentlyLoggedInUser'" | select -ExpandProperty ObjectId
	}
	

	$NamedLocationPolicyName = "OFAC Countries"

	$NamedLocationPolicy = Get-AzureADMSNamedLocationPolicy | Where-Object {$_.DisplayName -eq $NamedLocationPolicy}
	if ($NamedLocationPolicy -eq $null)
	{
		# Create a named location policy which includes all the OFAC Countries.
		$NamedLocationPolicy = New-AzureADMSNamedLocationPolicy -OdataType "#microsoft.graph.countryNamedLocation" -DisplayName $NamedLocationPolicyName -CountriesAndRegions "BY","BI","BA","CD","CF","CI","CN","CU","IQ","IR","KP","LR","MD","ME","MK","NI","RU","RS","SD","SS","SY","UA","VE","YE","ZW","AU" -IncludeUnknownCountriesAndRegions $false
		Write-Host "Named location policy : " + $NamedLocationPolicyName + " has been created."
		Write-Host "Countries included : " + $NamedLocationPolicyName.CountriesAndRegions
	}else{
		Write-Host "Named location policy : " + $NamedLocationPolicyName + " already exists."
		Write-Host "Countries included : " + $NamedLocationPolicyName.CountriesAndRegions
	}
	
	# Create the conditional access policy to block access from all OFAC countries to all apps for all users except the currently logged in user
	
	$conditions = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessConditionSet
	$conditions.Applications = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessApplicationCondition
	$conditions.Applications.IncludeApplications = "all"
	$conditions.Users = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessUserCondition
	$conditions.Users.IncludeUsers = "all"
	$conditions.Users.ExcludeUsers = $CurrentUserId
	$conditions.Locations = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessLocationCondition
	$conditions.Locations.IncludeLocations = $NamedLocationPolicy.Id
	$controls = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessGrantControls
	$controls._Operator = "OR"
	$controls.BuiltInControls = "block"
	New-AzureADMSConditionalAccessPolicy -DisplayName "Block OFAC countries" -State "Enabled" -Conditions $conditions -GrantControls $controls
```