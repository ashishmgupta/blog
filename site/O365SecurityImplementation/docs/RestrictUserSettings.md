# Restrict User settings

### Restrict registration of new Azure AD applications
It is important to control the registration of Azure AD applications. <br><br>
Azure Portal > Azure Active Directory > User Settings <br><br>
<img src="../../../images/o365security/restrict-user-settings-01.png"></img>
[Note on the "Application Developer" role : Users in this role will continue to be able to register app registrations even if the Global Admin has turned off the tenant level switch for "Users can register apps". <br>
This role is considered privileged because one or more of its permissions are privileged]

### Restrict users' ability to consent to Apps.
It is important to restrict users' ability to consent for applications to access organization data
With the below setting, we allow user consent only for applications that have been published by a verified publisher. 
```powershell
Set-AzureADMSAuthorizationPolicy -DefaultUserRolePermissions @{"PermissionGrantPoliciesAssigned" = @("managePermissionGrantsForSelf.microsoft-user-default-low") }
```
<br>
When an application is marked as publisher verified, it means that the publisher has verified their identity using a Microsoft Partner Network account that has completed the verification process and has associated this MPN account with their application registration. <br>
Source : <a href="https://docs.microsoft.com/en-us/azure/active-directory/develop/publisher-verification-overview">Publisher verification overview</a>
