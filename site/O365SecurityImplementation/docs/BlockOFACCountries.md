In case we have a requirement to block requests from certain countries , we can use conditional policy to achieve the same.
As a first step, we create a "named location" which has the list of countries we need to block all requests from. <br>
Then we create a conditional access policy to use that country list to implement the block.<br>
ALL users would be blocked from OFAC countries except the currently logged in user.<br>

A user website to look for ISO codes (among others) for countries is <a href="https://countrycode.org/usa" target="_blank"> https://countrycode.org</a>.
<br>
<br>
The PowerShell script to create the named location and conditional access policy for the block: 

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
<br>
<br>
The conditional access policy is created. <br>
<img src="../../../images/o365security/block-ofac-01.png"></img>
<br>
<br>
The conditional access policy showing block condition for the location noted in the named location "OFAC Countries".
<img src="../../../images/o365security/block-ofac-02.png"></img>
<br>