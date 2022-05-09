<h1>Conditional access policy to block access from OFAC countries to all apps for all users except the current logged in user</h1>

```powershell
	# Connect to AzureAD and get current logged in user
	$Connection = Connect-AzureAD
	$CurrentlyLoggedInUser = $connection.Account | select -ExpandProperty Id
	$CurrentUserId = Get-AzureADUser -Filter "UserPrincipalName eq '$CurrentlyLoggedInUser'" | select -ExpandProperty ObjectId
	
	# Create a named location policy
	$NamedLocationPolicy = New-AzureADMSNamedLocationPolicy -OdataType "#microsoft.graph.countryNamedLocation" -DisplayName "OFAC Countries" -CountriesAndRegions "BY","BI","BA","CD","CF","CI","CN","CU","IQ","IR","KP","LR","MD","ME","MK","NI","RU","RS","SD","SS","SY","UA","VE","YE","ZW","AU" -IncludeUnknownCountriesAndRegions $false
	
	
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