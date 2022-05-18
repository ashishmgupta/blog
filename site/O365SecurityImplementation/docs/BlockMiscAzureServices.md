
We would want to restrict access to various Azure services to non-admin users becuase they dont need that access.
One of those applications is "Microsoft Azure management" which includes below services :

<ul>
    <li>Azure portal</li>
    <li>Azure Resource Manager provider</li>
    <li>Classic deployment model APIs</li>
    <li>Azure PowerShell</li>
    <li>Azure CLI</li>
    <li>Azure DevOps</li>
    <li>Azure Data Factory portal</li>
    <li>Azure Event Hubs</li>
    <li>Azure Service Bus</li>
    <li>Azure SQL Database</li>
    <li>SQL Managed Instance</li>
    <li>Azure Synapse</li>
    <li>Visual Studio subscriptions administrator portal</li>
</ul>
Source : <a href="https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-cloud-apps">https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-cloud-apps</a> <br>

Below is the conditional access policy which would restrict access to above services to all users except admins.

```PowerShell
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


$AdminRolesIds = Get-AzureADMSROleDefinition | Where-Object -FilterScript {$_.DisplayName -like '*Administrator'}| select -ExpandProperty Id

# Create the conditional access policy to block access from all OFAC countries to all apps for all users except the currently logged in user

$conditions = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessConditionSet
$conditions.Applications = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessApplicationCondition
$conditions.Applications.IncludeApplications = "797f4846-ba00-4fd7-ba43-dac1f8f63013"
$conditions.Users = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessUserCondition
$conditions.Users.IncludeUsers = "all"
$conditions.Users.ExcludeRoles = $AdminRolesIds
$controls = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessGrantControls
$controls._Operator = "OR"
$controls.BuiltInControls = "block"
New-AzureADMSConditionalAccessPolicy -DisplayName "Block Misc Azure apps for non-admin users" -State "Enabled" -Conditions $conditions -GrantControls $controls
```

<br>
We can see the conditional access policy has been created to block ALL users(except those in admin roles) from accessing services included under "Microsoft Azure Management"
<table>
    <tr>
        <td><img src="../../../images/o365security/block-misc-azure-services-01.png"></img></td>
        <td><img src="../../../images/o365security/block-misc-azure-services-02.png"></img></td>
    </tr>
</table>