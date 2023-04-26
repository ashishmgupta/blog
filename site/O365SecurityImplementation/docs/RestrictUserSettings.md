# Restrict User settings

### Restrict registration of new Azure AD applications
It is important to control registration of Azure AD applications. <br><br>
Azure Portal > Azure Active Directory > User Settings <br><br>
<img src="../../../images/o365security/restrict-user-settings-01.png"></img>

### Restrict users' ability to consent to Apps.
It is important to restrict users' ability to consent for applications to access organization data
With the below setting, we allow user consent only for applications that have been published by a verified publisher. 
```powershell
Set-AzureADMSAuthorizationPolicy -DefaultUserRolePermissions @{"PermissionGrantPoliciesAssigned" = @("managePermissionGrantsForSelf.microsoft-user-default-low") }
```
<br>
When an application is marked as publisher verified, it means that the publisher has verified their identity using a Microsoft Partner Network account that has completed the verification process and has associated this MPN account with their application registration. <br>
Source : <a href="https://docs.microsoft.com/en-us/azure/active-directory/develop/publisher-verification-overview">Publisher verification overview</a>
