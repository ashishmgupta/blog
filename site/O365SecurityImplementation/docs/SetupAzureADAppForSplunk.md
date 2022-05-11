```powershell
# Author - Ashish Gupta
# This script creates a new Azure AD application and sets the Application and Delegated permissions for specific API (O365)

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
	

$CurrentDateTime = Get-Date -UFormat "%Y-%m-%d_%H-%m-%S"
$ApplicationDisplayName = "aaa_" +$CurrentDateTime
#  Get the service principal for O365 and Microsoft Graph
$ServicePrincipalO365API 		= Get-AzureADServicePrincipal -All $true | ? { $_.DisplayName -eq "Office 365 Management APIs" }
$ServicePrincipalMicrosoftGraph = Get-AzureADServicePrincipal -All $true | ? { $_.DisplayName -eq "Microsoft Graph" }

# Get all application permissions for Microsoft Graph
$ServicePrincipalMicrosoftGraphAppRoles = $ServicePrincipalMicrosoftGraph.AppRoles | Where-Object {$_.Value -match "\bDirectory.Read.All\b|\bAuditLog.Read.All\b|\bPolicy.Read.All\b|\bReports.Read.All\b"}

# Get all delegated permissions for Microsoft Graph
$ServicePrincipalMicrosoftGraphDelegatedRoles = $ServicePrincipalMicrosoftGraph.Oauth2Permissions | Where-Object {$_.Value -match "\bDirectory.Read.All\b|\bAuditLog.Read.All\b|\bPolicy.Read.All\b|\bReports.Read.All\b"}


# Get all application permissions for O365 API
$ServicePrincipalO365APIAppRoles = $ServicePrincipalO365API.AppRoles | Where-Object {$_.Value -match "\bActivityFeed.Read\b|\bActivityFeed.ReadDlp\b|\bServiceHealth.Read\b"}


# Get all delegated permissions for O365 API
$ServicePrincipalO365APIDelegatedRoles = $ServicePrincipalO365API.Oauth2Permissions | Where-Object {$_.Value -match "\bActivityFeed.Read\b|\bActivityFeed.ReadDlp\b|\bServiceHealth.Read\b"}


# Create a Required Resource Access object for Office 365
$RequiredResourceAccessO365API = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
$RequiredResourceAccessO365API.ResourceAppId = $ServicePrincipalO365API.AppId

$ServicePrincipalO365APIAppRolesSelectedPermissions = @()


# Get all the Resource Access objects for the Application permissions

foreach ($ServicePrincipalO365APIAppRole in $ServicePrincipalO365APIAppRoles)
{
	$Permission = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $ServicePrincipalO365APIAppRole.Id,"Role"
	$ServicePrincipalO365APIAppRolesSelectedPermissions += $Permission
}

<#
$ActivityReportsReadAppPermission = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList 
"594c1fb6-4f81-4475-ae41-0c394909246c","Role"
$ServicePrincipalO365APIAppRolesSelectedPermissions += $ActivityReportsReadAppPermission
$ActivityFeedReadDlpAppPermission = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "4807a72c-ad38-4250-94c9-4eabfe26cd55","Role"
$ServicePrincipalO365APIAppRolesSelectedPermissions += $ActivityFeedReadDlpAppPermission
$ServiceHealthReadAppPermission = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "e2cea78f-e743-4d8f-a16a-75b629a038ae","Role"
$ServicePrincipalO365APIAppRolesSelectedPermissions += $ServiceHealthReadAppPermission
#>
# Get all the Resource Access objects for the Delegated permissions
foreach ($ServicePrincipalO365APIDelegatedRole in $ServicePrincipalO365APIDelegatedRoles)
{
	$Permission = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $ServicePrincipalO365APIDelegatedRole.Id,"Scope"
	$ServicePrincipalO365APIAppRolesSelectedPermissions += $Permission

}


#$ServicePrincipalO365APIAppRolesSelectedPermissions = 'e2cea78f-e743-4d8f-a16a-75b629a038ae','594c1fb6-4f81-4475-ae41-0c394909246c','4807a72c-ad38-4250-94c9-4eabfe26cd55','17f1c501-83cd-414c-9064-cd10f7aef836','b3b78c39-cb1d-4d17-820a-25d9196a800e','69784729-33e3-471d-b130-744ce05343e5','825c9d21-ba03-4e97-8007-83f020ff8c0f'

# Assign all the permissions to the required Resource access for the O365 API 
$RequiredResourceAccessO365API.ResourceAccess  = $ServicePrincipalO365APIAppRolesSelectedPermissions

# Create the Password credential for the new app
Add-Type -AssemblyName System.Web
$ApplicationPassword =[System.Web.Security.Membership]::GeneratePassword(32,2)
$ApplicationPassword = $ApplicationPassword.Replace("+","_")
$ApplicationPassword = $ApplicationPassword.Replace("-","_")
$keyId = (New-Guid).ToString();
$fromDate = [System.DateTime]::Now
$durationInYears = 5
$endDate = $fromDate.AddYears($durationInYears) 
$Applicationkey = New-Object Microsoft.Open.AzureAD.Model.PasswordCredential($null, $endDate, $keyId, $fromDate, $ApplicationPassword)

# Create the new app with the password cred
$aadApplication = New-AzureADApplication -DisplayName $ApplicationDisplayName -PasswordCredentials $Applicationkey

write-output("Application created")

# Set the permissions
Set-AzureADApplication -ObjectId $aadApplication.ObjectId -RequiredResourceAccess $RequiredResourceAccessO365API
write-output("Application permissions set")
```